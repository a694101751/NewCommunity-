//
//  AppDelegate.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/19.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "AppDelegate.h"
#import "GuideViewController.h"
#import "MyTabBarViewController.h"
#import "InformationRootViewController.h"

#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
//腾讯开放平台（对应QQ和QQ空间）SDK头文件
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>
//微信SDK头文件
#import "WXApi.h"
#import "MyMessageViewController.h"

// 引入JPush功能所需头文件
#import "JPUSHService.h"
// iOS10注册APNs所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif

@interface AppDelegate ()<JPUSHRegisterDelegate>
@property (strong, nonatomic) MyTabBarViewController *myTabBarVC;
@end

@implementation AppDelegate

-(void)unreadMessages
{
    [NewCommunityBLL unreadMessagesandshowHUDInView:nil resultPostsWithBlock:^(UnreadMessagesModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                if ([model.data.total integerValue] > 0) {
                    [[User sharedInstanced]setUnreadMessages:model.data.total];
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"unreadMessage" object:nil];
                }
            }
        }
    }];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    IQKeyboardManager * keyboardManager = [IQKeyboardManager sharedManager];
    keyboardManager.enable = YES;
    keyboardManager.enableAutoToolbar = NO;
    keyboardManager.shouldResignOnTouchOutside = YES;
    [self unreadMessages];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    _myTabBarVC = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([MyTabBarViewController class])];
    //Required
    //notice: 3.0.0及以后版本注册可以这样写，也可以继续用之前的注册方式
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    
    // Required
    // init Push
    // notice: 2.1.5版本的SDK新增的注册方法，改成可上报IDFA，如果没有使用IDFA直接传nil
    // 如需继续使用pushConfig.plist文件声明appKey等配置内容，请依旧使用[JPUSHService setupWithOption:launchOptions]方式初始化。
    [JPUSHService setupWithOption:launchOptions appKey:@"11642dc64762bedc526df0ac"
                          channel:@"App Store"
                 apsForProduction:NO
            advertisingIdentifier:nil];
    [JPUSHService setBadge:0];
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    //引导页
    BOOL firstLaunchFlag = [[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunchFlag"];
    NSDictionary * userInfo = [launchOptions objectForKey: UIApplicationLaunchOptionsRemoteNotificationKey];
    // 第一次启动
    if (firstLaunchFlag == NO)
    {
        [self showGuideViewController];
    }
    
    if (userInfo) {
        UIStoryboard * stroyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        MyMessageViewController * VC = [stroyBoard instantiateViewControllerWithIdentifier:NSStringFromClass([MyMessageViewController class])];
        VC.hidesBottomBarWhenPushed = YES;
        [[self topViewController].navigationController pushViewController:VC animated:YES];
    }
    /**初始化ShareSDK应用
     @param activePlatforms
     使用的分享平台集合
     @param importHandler (onImport)
     导入回调处理，当某个平台的功能需要依赖原平台提供的SDK支持时，需要在此方法中对原平台SDK进行导入操作
     @param configurationHandler (onConfiguration)
     配置回调处理，在此方法中根据设置的platformType来填充应用配置信息
     */
    
    [ShareSDK registerActivePlatforms:@[
                                        @(SSDKPlatformSubTypeWechatSession),
                                        @(SSDKPlatformSubTypeQQFriend),
                                        @(SSDKPlatformSubTypeWechatTimeline)
                                        ]
                             onImport:^(SSDKPlatformType platformType)
     {
         switch (platformType)
         {
             case SSDKPlatformTypeWechat:
                 [ShareSDKConnector connectWeChat:[WXApi class]];
                 break;
             case SSDKPlatformTypeQQ:
                 [ShareSDKConnector connectQQ:[QQApiInterface class] tencentOAuthClass:[TencentOAuth class]];
                 break;
             default:
                 break;
         }
     }
                      onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo)
     {
         switch (platformType)
         {
             case SSDKPlatformTypeWechat:
                 [appInfo SSDKSetupWeChatByAppId:@"wx244b4dec296e2437"
                                       appSecret:@"2fe5420c3e440ce9d77acdf8b978ede0"];
                 break;
             case SSDKPlatformTypeQQ:
                 [appInfo SSDKSetupQQByAppId:@"1106459106"
                                      appKey:@"AmAhpmNgHFODpwlo"
                                    authType:SSDKAuthTypeBoth];
                 break;
             default:
                 break;
         }
     }];
    
    return YES;
}

- (void)showGuideViewController
{
    GuideViewController *gv = [[GuideViewController alloc] init];
    [gv setEnterBtnClickBlock:^{
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunchFlag"];
        [self showRootViewController];
    }];
    self.window.rootViewController = gv;
}

-(void)showRootViewController
{
    self.window.rootViewController = _myTabBarVC;
    [_myTabBarVC setSelectedIndex:0];
}

- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    /// Required - 注册 DeviceToken
    [JPUSHService registerDeviceToken:deviceToken];
}

#pragma mark- JPUSHRegisterDelegate

#pragma mark - 收到消息相关
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    [JPUSHService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
    [self unreadMessages];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    // Required,For systems with less than or equal to iOS6
    [JPUSHService handleRemoteNotification:userInfo];
    [self unreadMessages];
    UIStoryboard * stroyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MyMessageViewController * VC = [stroyBoard instantiateViewControllerWithIdentifier:NSStringFromClass([MyMessageViewController class])];
    VC.hidesBottomBarWhenPushed = YES;
    [[self topViewController].navigationController pushViewController:VC animated:YES];
}
// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
    // Required
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    
    completionHandler(UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以选择设置
    [self unreadMessages];
}

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    // Required
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler();  // 系统要求执行这个方法
    [self unreadMessages];
    UIStoryboard * stroyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MyMessageViewController * VC = [stroyBoard instantiateViewControllerWithIdentifier:NSStringFromClass([MyMessageViewController class])];
    VC.hidesBottomBarWhenPushed = YES;
    [[self topViewController].navigationController pushViewController:VC animated:YES];
}

- (UIViewController *)topViewController {
    UIViewController *resultVC;
    resultVC = [self _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

- (UIViewController *)_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}

+ (AppDelegate*)sharedInstanced{
    return (AppDelegate*)[UIApplication sharedApplication].delegate;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    [JPUSHService setBadge:0];
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    [self unreadMessages];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

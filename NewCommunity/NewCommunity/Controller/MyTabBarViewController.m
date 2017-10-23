//
//  MyTabBarViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/20.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "MyTabBarViewController.h"
#import "CommunityRootViewController.h"
#import "LoginViewController.h"
#import "CommunityInViewController.h"

@interface MyTabBarViewController ()<UITabBarControllerDelegate>

@end

@interface MyTabBarViewController (resetTabBarItem)
/**
 *  设置TabBarItem 选择状态时的图片
 *
 *  @param index  在TabBar上第几个
 *  @param selectedImageName 图片名，NSString类型
 */
- (void) setTabBarItemWithIndex:(NSInteger)index selectedImageName:(NSString*)selectedImageName;
/**
 *  设置TabBarItem nomal和选择状态时的图片
 *
 *  @param index             在TabBar上第几个
 *  @param nomalImageName    图片名，NSString类型
 *  @param selectedImageName 图片名，NSString类型
 */
- (void) setTabBarItemWithIndex:(NSInteger)index nomalImageName:(NSString*)nomalImageName selectedImageName:(NSString*)selectedImageName;
@end

@implementation MyTabBarViewController (resetTabBarItem)
- (void) setTabBarItemWithIndex:(NSInteger)index selectedImageName:(NSString*)selectedImageName{
    [self setTabBarItemWithIndex:index nomalImageName:nil selectedImageName:selectedImageName];
}

- (void) setTabBarItemWithIndex:(NSInteger)index nomalImageName:(NSString*)nomalImageName selectedImageName:(NSString*)selectedImageName{
    
    UITabBarItem *item = self.tabBar.items[index];
//    if (index != 1) {
//        item.imageInsets = UIEdgeInsetsMake(2, 0, -2, 0);
//    }
//    else
//    {
//        item.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
//    }
    if (nomalImageName) {
        UIImage *imageNomal = [[UIImage imageNamed:nomalImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.image = imageNomal;
    }
    
    UIImage *imageSelected = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item.selectedImage = imageSelected;
}
@end

@implementation MyTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    self.tabBar.translucent = NO;
    //    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0, -3)];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName :getColor(@"c6c6c6")} forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName :getColor(@"584f60")} forState:UIControlStateSelected];
    
    //这部分代码在viewDidLoad方法里写
    
    [self setTabBarItemWithIndex:0 nomalImageName:@"tabBar_nomal_1" selectedImageName:@"tabBar_selected_1"];
    [self setTabBarItemWithIndex:1 nomalImageName:@"tabBar_nomal_2" selectedImageName:@"tabBar_selected_2"];
    [self setTabBarItemWithIndex:2 nomalImageName:@"tabBar_nomal_3" selectedImageName:@"tabBar_selected_3"];
    [self setTabBarItemWithIndex:3 nomalImageName:@"tabBar_nomal_4" selectedImageName:@"tabBar_selected_4"];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;
}

#pragma mark - UITabBarControllerDelegate

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    UINavigationController *nav = (UINavigationController*)viewController;
    if ([nav.topViewController isKindOfClass:[CommunityRootViewController class]]) {
        if ([User sharedInstanced].ATP_acessToken.length <= 0) {
            LoginViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([LoginViewController class])];
            [self presentViewController:VC animated:YES completion:nil];
            return NO;
        }
        if ([User sharedInstanced].ATP_clubID.length <= 0) {
            UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil message:@"请先完善信息，入住社区" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction * enterAction = [UIAlertAction actionWithTitle:@"现在去" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                UINavigationController * VC = [self.storyboard instantiateViewControllerWithIdentifier:@"CommunityInViewNav"];
               [self presentViewController:VC animated:YES completion:nil];
            }];
            UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"再想想" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [alert addAction:enterAction];
            [alert addAction:cancelAction];
            [self presentViewController:alert animated:YES completion:nil];
            return NO;
        }
        return YES;
    }
    return YES;
}

@end

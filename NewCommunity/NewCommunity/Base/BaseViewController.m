//
//  BaseViewController.m
//  TianjinBoHai
//
//  Created by 李莹 on 15/1/9.
//  Copyright (c) 2015年 Binky Lee. All rights reserved.
//

#import "BaseViewController.h"
#import "UIViewController+DismissKeyboard.h"
#import "MJPhotoBrowser.h"
#import "MJPhoto.h"
#import "LoginViewController.h"

@import QuartzCore;

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:getColor(@"efefef")];
    
    [self.navigationController.navigationBar setBarTintColor:getColor(@"ffffff")];
    [self.navigationController.navigationBar setTintColor:getColor(@"584f60")];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:17],NSForegroundColorAttributeName: getColor(@"584f60")}];
    [self.navigationController.navigationBar setTranslucent:NO];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"";
    self.navigationItem.backBarButtonItem = backItem;
    
    [self setupForDismissKeyboard];    
}

- (void) showMessage:(NSString*)message{

    [self.view makeToast:message duration:1.0 position:CSToastPositionCenter];
}

- (void) showError:(NSError*)error{
    switch (error.code) {
        case NSURLErrorNotConnectedToInternet:
            [self showMessage:@"请检查您的网络"];
            break;
        case NSURLErrorTimedOut:
            [self showMessage:@"请求超时，请查看您的网络"];
            break;
        case NSURLErrorCannotConnectToHost:
            [self showMessage:@"服务器繁忙，请稍后再试"];
            break;
        case NSURLErrorNetworkConnectionLost:
//            [self showMessage:@"处理过程中网络中断，请重试"];
            break;
        default:
            [self showMessage:@"未知错误"];
            break;
    }
}

#pragma mark - alertController

- (void)showLeonAlertWithTitle:(NSString *)title msg:(NSString *)msg okBlock:(void(^)())okblock cancelblock:(void(^)())cancelBlock{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        okblock();
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        cancelBlock();
    }];
    
    [alertController addAction:okAction];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - get date

- (NSString *)getNowDate
{
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY.MM.dd"];
    NSString *DateTime = [formatter stringFromDate:date];
    return DateTime;
}

//等比例压缩
-(UIImage *) imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size{
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = size.width;
    CGFloat targetHeight = size.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
    if(CGSizeEqualToSize(imageSize, size) == NO){
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        if(widthFactor > heightFactor){
            scaleFactor = widthFactor;
        }
        else{
            scaleFactor = heightFactor;
        }
        scaledWidth = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        if(widthFactor > heightFactor){
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }else if(widthFactor < heightFactor){
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    UIGraphicsBeginImageContext(size);
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    [sourceImage drawInRect:thumbnailRect];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil){
        NSLog(@"scale image fail");
    }
    UIGraphicsEndImageContext();
    return newImage;
}

- (void) showImageWithPhotoURLsArray:(NSArray<NSString*>*)photosURLsArray startIndex:(NSInteger)startIndex fromViews:(NSArray*)fromViews{
    
    // 1. 创建photoBroseView对象
    PYPhotoBrowseView *photoBroseView = [[PYPhotoBrowseView alloc] init];
    // 2.1 设置图片源(UIImageView)数组
    photoBroseView.sourceImgageViews = fromViews;
    // 2.2 设置初始化图片下标（即当前点击第几张图片）
    photoBroseView.currentIndex = startIndex;
    photoBroseView.imagesURL = photosURLsArray;
    // 3.显示(浏览)
    photoBroseView.showDuration = 0.3;
    photoBroseView.hiddenDuration = 0.3;
    [photoBroseView show];
}

- (void) showImageWithImageURL:(NSString*)imageURL fromView:(UIView*)fromView{
    NSArray * imageArray = @[fromView];
    NSArray * imageUrl = @[imageURL];
    // 1. 创建photoBroseView对象
    PYPhotoBrowseView *photoBroseView = [[PYPhotoBrowseView alloc] init];
    // 2.1 设置图片源(UIImageView)数组
    photoBroseView.sourceImgageViews = imageArray;
    // 2.2 设置初始化图片下标（即当前点击第几张图片）
    photoBroseView.currentIndex = 0;
    photoBroseView.imagesURL = imageUrl;
    // 3.显示(浏览)
    photoBroseView.showDuration = 0.3;
    photoBroseView.hiddenDuration = 0.3;
    [photoBroseView show];
}

//手机号码验证
- (BOOL) validateMobile:(NSString *)mobile
{
    //手机号以13，15，18开头，八个 \d 数字字符
    //    NSString *phoneRegex = @"^1(3[0-9]|5[0-35-9]|8[0235-9])\\d{8}$";
    NSString *phoneRegex = @"^1(3[0-9]|4[579]|5[0-35-9]|7[0135-8]|8[0-9])\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

-(void)presentLogin
{
    UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController * VC = [storyBoard instantiateViewControllerWithIdentifier:NSStringFromClass([LoginViewController class])];
    [self presentViewController:VC animated:YES completion:nil];
}

-(void)shareWithImage:(id)image Title:(NSString *)title content:(NSString *)content url:(NSString *)url SSDKPlatformType:(SSDKPlatformType )SSDKPlatformType
{
    //创建分享参数
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
    [shareParams SSDKSetupShareParamsByText:content
                                     images:image //传入要分享的图片
                                        url:[NSURL URLWithString:url]
                                      title:title
                                       type:SSDKContentTypeAuto];
    //进行分享
    [ShareSDK share:SSDKPlatformType //传入分享的平台类型
         parameters:shareParams
     onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
         // 回调处理....}];
     }];
}

-(void)htmlUrlString:(NSString *)htmlStr
{
    NSMutableString *outputStr = [NSMutableString stringWithString:htmlStr ? : @""];
    
    [outputStr replaceOccurrencesOfString:@"+"
     
                               withString:@" "
     
                                  options:NSLiteralSearch
     
                                    range:NSMakeRange(0,[outputStr length])];
    
    NSString*decodedString = [outputStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    
    
//    NSURL* url = [NSURL fileURLWithPath:strFinalPath];
//    NSURLRequest* request = [NSURLRequest requestWithURL:url] ;
//    [_webView loadRequest:request];
}

@end

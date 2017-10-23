//
//  BaseViewController.h
//  TianjinBoHai
//
//  Created by 李莹 on 15/1/9.
//  Copyright (c) 2015年 Binky Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ShareSDK/ShareSDK.h>

@interface BaseViewController : UIViewController<UIImagePickerControllerDelegate>
- (void) showError:(NSError*)error;
/**
 *  显示message
 */
- (void)showMessage:(NSString*)message;

//等比例压缩图片到指定大小
-(UIImage *) imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size;
- (NSString*)getNowDate;

#pragma mark - alert
- (void)showLeonAlertWithTitle:(NSString *)title msg:(NSString *)msg okBlock:(void(^)())okblock cancelblock:(void(^)())cancelBlock;
//浏览图片
- (void) showImageWithPhotoURLsArray:(NSArray<NSString*>*)photosURLsArray startIndex:(NSInteger)startIndex fromViews:(NSArray*)fromViews;
//单张图片浏览
- (void) showImageWithImageURL:(NSString*)imageURL fromView:(UIView*)fromView;
- (BOOL) validateMobile:(NSString *)mobile;
-(void)presentLogin;
-(void)shareWithImage:(id)image Title:(NSString *)title content:(NSString *)content url:(NSString *)url SSDKPlatformType:(SSDKPlatformType )SSDKPlatformType;
@end

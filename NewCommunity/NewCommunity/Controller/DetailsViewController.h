//
//  DetailsViewController.h
//  NewCommunity
//
//  Created by Aaron on 2017/9/21.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "BaseViewController.h"
#import "QDCommonViewController.h"

/**
 详情
 */
@interface DetailsViewController : BaseViewController
@property (nonatomic, assign)NSInteger kid;
@property (nonatomic, strong)NSIndexPath * indexPath;
@property (nonatomic, assign)BOOL isCommunity;
@end

@protocol QDKeyboardCustomViewControllerDelegate <NSObject>

-(void)publishButtonClickWithText:(NSString *)text;

@end
@interface QDKeyboardCustomViewController : QDCommonViewController
@property (nonatomic, weak)id<QDKeyboardCustomViewControllerDelegate>delegate;
- (void)showInParentViewController:(UIViewController *)controller;
@end

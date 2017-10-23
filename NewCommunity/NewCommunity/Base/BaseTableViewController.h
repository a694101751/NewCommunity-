//
//  BaseTableViewController.h
//  SunyardFinance
//
//  Created by 李莹 on 15/8/25.
//  Copyright (c) 2015年 Blue Mobi. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface BaseTableViewController : UITableViewController
/**
 *  显示message
 */
- (void) showMessage:(NSString*)message;
- (void) showError:(NSError*)error;

- (NSString*)getNowDate;

#pragma mark - alert
- (void)showLeonAlertWithTitle:(NSString *)title msg:(NSString *)msg okBlock:(void(^)())okblock cancelblock:(void(^)())cancelBlock;

@end

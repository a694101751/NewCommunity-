//
//  BaseTableViewController.m
//  SunyardFinance
//
//  Created by 李莹 on 15/8/25.
//  Copyright (c) 2015年 Blue Mobi. All rights reserved.
//

#import "BaseTableViewController.h"
@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:getColor(@"ebebeb")];
    
    [self.navigationController.navigationBar setBarTintColor:getColor(@"ffffff")];
    [self.navigationController.navigationBar setTintColor:getColor(@"584f60")];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:17],NSForegroundColorAttributeName: getColor(@"584f60")}];
    [self.navigationController.navigationBar setTranslucent:NO];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"";
    self.navigationItem.backBarButtonItem = backItem;
    
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        self.tableView.layoutMargins = UIEdgeInsetsZero;
    }
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
            [self showMessage:@"处理过程中网络中断，请重试"];
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

@end

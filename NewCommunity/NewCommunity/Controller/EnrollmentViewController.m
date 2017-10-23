//
//  EnrollmentViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/21.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "EnrollmentViewController.h"
#import "EventDetailsViewController.h"

@interface EnrollmentViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *addsTextField;
-(void)submittedSuccessfully;
@end

@interface EnrollmentViewController (network)
@end

@implementation EnrollmentViewController (network)
//报名
-(void)enrollMent
{
    [NewCommunityBLL enrollmentName:self.nameTextField.text phone:self.phoneTextField.text club:self.addsTextField.text activityId:self.kid andshowHUDInView:self.view resultPostsWithBlock:^(ModifyInformationModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                [self showMessage:@"报名成功"];
                //延时函数，1秒后执行
                [self performSelector:@selector(submittedSuccessfully) withObject:nil afterDelay:1.5f];
            }
        }
    }];
}

@end

@implementation EnrollmentViewController

-(void)submittedSuccessfully
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)submitButtonClick:(id)sender {
    if (self.nameTextField.text.length <= 0) {
        [self showMessage:@"姓名不能为空"];
        return;
    }
    if (![self validateMobile:self.phoneTextField.text]) {
        [self showMessage:@"您输入的手机号有误"];
        return;
    }
    if (self.addsTextField.text.length <= 0) {
        [self showMessage:@"社区不能为空"];
        return;
    }
    [self enrollMent];
}

@end

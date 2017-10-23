//
//  LoginViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/26.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "LoginViewController.h"
#import "JPUSHService.h"
#import "AppDelegate.h"

@interface LoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;
@property (weak, nonatomic) IBOutlet UIButton *codeButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
/** *  计数60秒 */
@property (nonatomic) NSInteger secondsCountDown;
/** *  计时器 */
@property (strong, nonatomic) NSTimer *countDownTimer;
- (void)startTime;
@end

@interface LoginViewController (network)
@end

@implementation LoginViewController(network)
//获取验证码
-(void)verificationCode
{
    [NewCommunityBLL verificationCodePhone:self.phoneTextField.text andshowHUDInView:nil resultPostsWithBlock:^(VerificationCodeModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                [self startTime];
            }
            else
            {
                [self showMessage:model.content];
            }
        }
        else
        {
            [self showError:error];
        }
    }];
}
//登录
-(void)login
{
    [NewCommunityBLL loginAccount:self.phoneTextField.text sms:self.codeTextField.text andshowHUDInView:self.view resultPostsWithBlock:^(LoginModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                [self dismissViewControllerAnimated:YES completion:nil];
                [[User sharedInstanced] setAcessToken:model.user.idField];
                [[User sharedInstanced] setATP_Phone:self.phoneTextField.text];
                [[User sharedInstanced]setATP_nickName:model.user.nickName];
                [[User sharedInstanced]setATP_address:model.user.address];
                [[User sharedInstanced]setATP_avatar:model.user.avatar];
                if (![model.user.areaId isEqualToString:@"0"]) {
                    [[User sharedInstanced]setATP_areaID:model.user.areaId];
                }
                if (![model.user.clubId isEqualToString:@"0"]) {
                    [[User sharedInstanced]setATP_clubID:model.user.clubId];
                }
                [[User sharedInstanced]setCommunityInAreaName:model.user.areaName];
                [[User sharedInstanced]setCommunityInClubName:model.user.clubName];
                [[User sharedInstanced]setATP_userName:model.user.userName];
                //街道
                [[User sharedInstanced]setATP_clubName:model.user.subdistrictName];
                [[User sharedInstanced]setATP_areaName:model.user.areaName];
                [[AppDelegate sharedInstanced] unreadMessages];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"loginSuccess" object:nil];
                [JPUSHService setTags:[NSSet setWithObjects:self.phoneTextField.text, nil] completion:^(NSInteger iResCode, NSSet *iTags, NSInteger seq) {
                    
                } seq:0];
            }
            else
            {
                [self showMessage:model.content];
            }
        }
        else
        {
            [self showError:error];
        }
    }];
}

@end

@implementation LoginViewController

-(void)setLoginButton:(UIButton *)loginButton
{
    _loginButton = loginButton;
    _loginButton.layer.cornerRadius = 25;
    _loginButton.layer.masksToBounds = YES;
    _loginButton.enabled = NO;
    _loginButton.backgroundColor = getColor(@"eaeaea");
    [_loginButton setTitleColor:getColor(@"a6a6a6") forState:UIControlStateNormal];
    _phoneTextField.delegate = self;
    _codeTextField.delegate = self;
    [_codeTextField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/**
 *  开始计时
 */
- (void)startTime{
    
    [self stopTime];
    
    _secondsCountDown = 60;
    _codeButton.enabled = NO;
    _codeButton.titleLabel.text = [NSString stringWithFormat:@"%lds",_secondsCountDown];
    [_codeButton setTitle:[NSString stringWithFormat:@"%lds",_secondsCountDown] forState:UIControlStateNormal];
    _codeButton.backgroundColor = getColor(@"eaeaea");
    [_codeButton setTitleColor:getColor(@"a6a6a6") forState:UIControlStateNormal];
    _countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES];
}

/**
 *  重置
 */
- (void) stopTime{
    if (_countDownTimer) {
        [_countDownTimer invalidate];
        _countDownTimer = nil;
        _codeButton.enabled = YES;
    }
}

/**
 *  timer方法
 */
- (void)timeFireMethod{
    
    _secondsCountDown--;
    _codeButton.titleLabel.text = [NSString stringWithFormat:@"%lds",_secondsCountDown];
    [_codeButton setTitle:[NSString stringWithFormat:@"%lds",_secondsCountDown] forState:UIControlStateNormal];
    if(_secondsCountDown == 0){
        [self stopTime];
        _codeButton.titleLabel.text = @"获取验证码";
        [_codeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        _codeButton.backgroundColor = getColor(@"24c789");
        [_codeButton setTitleColor:getColor(@"ffffff") forState:UIControlStateNormal];
    }
}

#pragma mark - UITextFieldDelegate
-(void)textChange
{
    if (_codeTextField.text.length >0 && _phoneTextField.text.length > 0) {
        _loginButton.enabled = YES;
        _loginButton.backgroundColor = getColor(@"24c789");
        [_loginButton setTitleColor:getColor(@"ffffff") forState:UIControlStateNormal];
    }
    else
    {
        _loginButton.enabled = NO;
        _loginButton.backgroundColor = getColor(@"eaeaea");
        [_loginButton setTitleColor:getColor(@"a6a6a6") forState:UIControlStateNormal];
    }
}
//关闭
- (IBAction)shutDownButtonClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
//获取验证码
- (IBAction)codeButtonClick:(id)sender {
    if (![self validateMobile:self.phoneTextField.text]) {
        [self showMessage:@"您输入的手机号有误"];
    }
    [self verificationCode];
}
//快速登录
- (IBAction)loginButtonClick:(id)sender {
    [self login];
}
//注册协议
- (IBAction)registeredButtonClick:(id)sender {
}

@end

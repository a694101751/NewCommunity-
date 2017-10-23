//
//  ModifyTheNameViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/20.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "ModifyTheNameViewController.h"

@interface ModifyTheNameViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@end

@interface ModifyTheNameViewController (network)
@end

@implementation ModifyTheNameViewController (network)

-(void)modifyNameTitle:(NSString *)title
{
    if ([title isEqualToString:@"昵称"]) {
        [NewCommunityBLL modifyTheInformationID:[User sharedInstanced].ATP_acessToken areaId:nil clubId:nil nickName:self.textField.text userName:nil avatar:nil address:nil subdistrictId:nil addressAareaId:nil andshowHUDInView:self.view resultPostsWithBlock:^(ModifyInformationModel *model, NSError *error) {
            if (!error) {
                if ([model.code isEqualToString:@"200"]) {
                    [[User sharedInstanced]setATP_nickName:self.textField.text];
                    [self.navigationController popViewControllerAnimated:YES];
                }
            }
        }];
    }
    else
    {
        [NewCommunityBLL modifyTheInformationID:[User sharedInstanced].ATP_acessToken areaId:nil clubId:nil nickName:nil userName:self.textField.text avatar:nil address:nil subdistrictId:nil addressAareaId:nil andshowHUDInView:self.view resultPostsWithBlock:^(ModifyInformationModel *model, NSError *error) {
            if (!error) {
                if ([model.code isEqualToString:@"200"]) {
                    [[User sharedInstanced]setATP_userName:self.textField.text];
                    [self.navigationController popViewControllerAnimated:YES];
                }
            }
        }];
    }
}

@end

@implementation ModifyTheNameViewController

-(void)setTextField:(UITextField *)textField
{
    _textField = textField;
    if (self.contentString.length > 0) {
        _textField.text = self.contentString;
    }
    else
    {
        _textField.placeholder = [NSString stringWithFormat:@"请输入%@", self.title];
    }
    _textField.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)saveButtonClick:(id)sender {
    if (self.textField.text <= 0) {
        [self showMessage:@"内容不能为空"];
        return;
    }
    [self modifyNameTitle:self.title];
}

@end

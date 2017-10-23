//
//  FeedbackViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/23.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "FeedbackViewController.h"

@interface FeedbackViewController ()
@property (weak, nonatomic) IBOutlet QMUITextView *textView;
@end

@interface FeedbackViewController (network)
@end

@implementation FeedbackViewController (network)

-(void)feedback
{
    [NewCommunityBLL feedbackContent:self.textView.text ndshowHUDInView:self.view resultPostsWithBlock:^(ModifyInformationModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                [self showMessage:@"提交成功"];
                //延时函数，1秒后执行
                [self performSelector:@selector(submittedSuccessfully) withObject:nil afterDelay:1.5f];
            }
        }
        else
        {
            [self showError:error];
        }
    }];
}

@end

@implementation FeedbackViewController

-(void)setTextView:(QMUITextView *)textView
{
    _textView = textView;
    _textView.placeholder = @"简要描述您的问题和建议";
    _textView.placeholderColor = getColor(@"b2b2b2");
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)submittedSuccessfully
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)submitButtonClick:(id)sender {
    if (self.textView.text.length <= 0) {
        [self showMessage:@"内容不能为空"];
        return;
    }
    [self feedback];
}

@end

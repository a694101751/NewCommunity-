//
//  EventDetailsViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/30.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "EventDetailsViewController.h"
#import "EnrollmentViewController.h"
#import <WebKit/WebKit.h>

static void *WkwebBrowserContext = &WkwebBrowserContext;

@interface EventDetailsViewController ()<WKUIDelegate,WKNavigationDelegate>
@property (nonatomic, strong)UIButton * signUpButton;
@property (nonatomic ,strong) WKWebView *mainWebView;
//设置加载进度条
@property (nonatomic,strong) UIProgressView *progressView;
@end

@interface EventDetailsViewController (network)
@end

@implementation EventDetailsViewController (network)

-(void)eventDetails
{
    [NewCommunityBLL eventDetailsID:self.kid andshowHUDInView:self.view resultPostsWithBlock:^(EventDetailsModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                NSURLRequest * req = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@cms/html/activity.action?id=%@", BASE_URL, self.kid]]];
                [self.mainWebView loadRequest:req];
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

@implementation EventDetailsViewController

-(WKWebView *)mainWebView
{
    if (!_mainWebView) {
        _mainWebView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - statusBarAndNavigationBarHeight - 54)];
        _mainWebView.backgroundColor = [UIColor clearColor];
        _mainWebView.UIDelegate = self;
        _mainWebView.navigationDelegate = self;
        _mainWebView.scrollView.showsVerticalScrollIndicator = NO;
        
        //kvo 添加进度条监控
        [_mainWebView addObserver:self forKeyPath:NSStringFromSelector(@selector(estimatedProgress)) options:0 context:WkwebBrowserContext];
    }
    return _mainWebView;
}

-(UIProgressView *)progressView
{
    if (!_progressView) {
        _progressView = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
        _progressView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 3);
        [_progressView setTrackTintColor:[UIColor whiteColor]];
        _progressView.progressTintColor = [UIColor greenColor];
    }
    return _progressView;
}

-(UIButton *)signUpButton
{
    if (!_signUpButton) {
        
    }
    return _signUpButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"活动说明";
    [self eventDetails];
    [self.view addSubview:self.mainWebView];
    [self.view addSubview:self.progressView];
    _signUpButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _signUpButton.backgroundColor = getColor(@"34c789");
    [_signUpButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_signUpButton setTitle:@"活动报名" forState:UIControlStateNormal];
    _signUpButton.titleLabel.font = Define_SystemIphone6Font16;
    [_signUpButton addTarget:self action:@selector(signUpButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.signUpButton];
    _signUpButton.sd_layout.leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomEqualToView(self.view)
    .heightIs(54);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - wkwebview

-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    self.progressView.hidden = NO;
}

//kvo监听进度条
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(estimatedProgress))] && object == self.mainWebView) {
        [self.progressView setAlpha:1.0f];
        BOOL animated = self.mainWebView.estimatedProgress > self.progressView.progress;
        [self.progressView setProgress:self.mainWebView.estimatedProgress animated:animated];
        
        if (self.mainWebView.estimatedProgress >= 1.0f) {
            [UIView animateWithDuration:0.3f delay:0.3f options:UIViewAnimationOptionCurveEaseOut animations:^{
                [self.progressView setAlpha:0.0f];
            } completion:^(BOOL finished) {
                [self.progressView setProgress:0.0f animated:NO];
            }];
        }
    }
    else
    {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

-(void)dealloc
{
    [self.mainWebView removeObserver:self forKeyPath:NSStringFromSelector(@selector(estimatedProgress))];
}
//报名
-(void)signUpButtonClick
{
    UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    EnrollmentViewController * VC = [storyBoard instantiateViewControllerWithIdentifier:NSStringFromClass([EnrollmentViewController class])];
    VC.kid = self.kid;
    VC.title = self.title;
    [self.navigationController pushViewController:VC animated:YES];
}

@end

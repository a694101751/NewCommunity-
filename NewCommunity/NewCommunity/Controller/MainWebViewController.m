//
//  MainWebViewController.m
//  TCCulture
//
//  Created by Leon on 2016/12/5.
//  Copyright © 2016年 Binky Lee. All rights reserved.
//

#import "MainWebViewController.h"
#import <WebKit/WebKit.h>

static void *WkwebBrowserContext = &WkwebBrowserContext;

@interface MainWebViewController ()<WKUIDelegate,WKNavigationDelegate>

@property (nonatomic ,strong) WKWebView *mainWebView;
//设置加载进度条
@property (nonatomic,strong) UIProgressView *progressView;
@end

@implementation MainWebViewController

#pragma mark - set&get

-(WKWebView *)mainWebView
{
    if (!_mainWebView) {
        _mainWebView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
        _mainWebView.backgroundColor = getColor(@"ffffff");
        _mainWebView.scrollView.backgroundColor = getColor(@"ffffff");
        _mainWebView.UIDelegate = self;
        _mainWebView.navigationDelegate = self;
        _mainWebView.scrollView.showsVerticalScrollIndicator = NO;
        NSURLRequest * req = [NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString]];
        [_mainWebView loadRequest:req];
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
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.mainWebView];
    [self.view addSubview:self.progressView];
    self.mainWebView.sd_layout.topEqualToView(self.view)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomEqualToView(self.view);
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

#pragma mark - 内存警告
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

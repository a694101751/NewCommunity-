//
//  CommunityServiceDetailsViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/25.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "CommunityServiceDetailsViewController.h"
#import "ShareMenuView.h"
#import <WebKit/WebKit.h>

static void *WkwebBrowserContext = &WkwebBrowserContext;

@interface CommunityServiceDetailsViewController ()<WKUIDelegate, WKNavigationDelegate, UITableViewDataSource, UITableViewDelegate, ShareMenuViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
//设置加载进度条
@property (nonatomic,strong) UIProgressView *progressView;
@property (nonatomic, strong)WKWebView * webView;
@property (nonatomic, strong)UIView * headerView;
@property (nonatomic, assign)CGFloat webViewHeight;
@property (nonatomic, strong)UILabel * titleLabel;
@property (nonatomic, strong)UILabel * timeLabel;
@property (nonatomic, strong)UILabel * numberLabel;
@property (nonatomic, assign)BOOL isCollection;

@property (nonatomic, strong)ShareMenuView * shareMenuView;
@end

@interface CommunityServiceDetailsViewController (network)
@end

@implementation CommunityServiceDetailsViewController (network)
//资讯详情
-(void)detailsList
{
    [NewCommunityBLL detailsListId:[self.kid integerValue] Url:@"cms/post/detail.action" andshowHUDInView:self.view resultPostsWithBlock:^(DetailsModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                NSURLRequest * req = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@cms/html/cms.action?id=%@", BASE_URL, self.kid]]];
                [self.webView loadRequest:req];
                self.titleLabel.text = model.detail.title;
                self.timeLabel.text = model.detail.addTime;
                self.numberLabel.text = [NSString stringWithFormat:@"浏览量：%@", model.detail.click];
                if ([model.detail.collectState isEqualToString:@"true"]) {
                    self.isCollection = YES;
                }
                else
                {
                    self.isCollection = NO;
                }
                
            }
            else
            {
                
            }
        }
        else
        {
            [self showError:error];
        }
        [self.tableView reloadData];
    }];
}
//社区话题详情
-(void)communityTopicDetails
{
    [NewCommunityBLL communityTopicDetailsId:self.kid andshowHUDInView:self.view resultPostsWithBlock:^(CommunityTopicDetailsModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                NSURLRequest * req = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@cms/html/topic.action?id=%@", BASE_URL, self.kid]]];
                [self.webView loadRequest:req];
                self.titleLabel.text = model.topic.title;
                self.timeLabel.text = model.topic.addTime;
                self.numberLabel.text = [NSString stringWithFormat:@"浏览量：%@", model.topic.click];
            }
            else
            {
                
            }
        }
        else
        {
            [self showError:error];
        }
        [self.tableView reloadData];
    }];
}
//社区公告详情
-(void)communityPublicAnnouncementDetails
{
    [NewCommunityBLL communityPublicAnnouncementDetailsId:self.kid andshowHUDInView:self.view resultPostsWithBlock:^(CommunityPublicAnnouncementDetailsModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                NSString * encodeString = [model.pages.content stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"#%<>[\\]^`{|}\"]+"].invertedSet];
                NSURLRequest * req = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@cms/html.action?content=%@", BASE_URL, encodeString]]];
                [self.webView loadRequest:req];
                self.titleLabel.text = model.pages.title;
                self.timeLabel.text = model.pages.addTime;
                self.numberLabel.text = [NSString stringWithFormat:@"浏览量：%@", model.pages.click];
            }
            else
            {
                
            }
        }
        else
        {
            [self showError:error];
        }
        [self.tableView reloadData];
    }];
}

//举报
-(void)communityReport
{
    [NewCommunityBLL communityReportobjType:nil objId:self.kid andshowHUDInView:self.view resultPostsWithBlock:^(ModifyInformationModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                [self showMessage:@"举报成功，感谢您的反馈"];
            }
            else
            {
                
            }
        }
        else
        {
            [self showError:error];
        }
    }];
}

//收藏
-(void)addCollectionType:(NSString *)type
{
    [NewCommunityBLL collectionpostId:self.kid type:type andshowHUDInView:self.view resultPostsWithBlock:^(ModifyInformationModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                [self showMessage:@"收藏成功"];
                self.isCollection = YES;
            }
            else
            {
                [self showMessage:@"收藏失败"];
            }
        }
        else
        {
            [self showError:error];
        }
    }];
}
//取消收藏
-(void)cancelCollection
{
    [NewCommunityBLL cancelCollectionpostId:self.kid andshowHUDInView:self.view resultPostsWithBlock:^(ModifyInformationModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                [self showMessage:@"取消收藏成功"];
                self.isCollection = NO;
            }
            else
            {
                [self showMessage:@"取消收藏失败"];
            }
        }
        else
        {
            [self showError:error];
        }
    }];
}

@end

@implementation CommunityServiceDetailsViewController

-(ShareMenuView *)shareMenuView
{
    if (!_shareMenuView) {
        if (self.type == DetailsTypeCommunityPublicAnnouncement) {
            _shareMenuView = [[ShareMenuView alloc]initWithTitleArry:@[@{@"kTitle":@"朋友圈", @"kImage":@"InformationRoot_share_circleFriends_bg"},
                                                                       @{@"kTitle":@"微信好友", @"kImage":@"InformationRoot_share_weiChat_bg"},
                                                                       @{@"kTitle":@"QQ好友", @"kImage":@"InformationRoot_share_QQ_bg"}]];
        }
        else if (self.type == DetailsTypeCommunityTopic){
            _shareMenuView = [[ShareMenuView alloc]initWithTitleArry:@[@{@"kTitle":@"朋友圈", @"kImage":@"InformationRoot_share_circleFriends_bg"},
                                                                       @{@"kTitle":@"微信好友", @"kImage":@"InformationRoot_share_weiChat_bg"},
                                                                       @{@"kTitle":@"QQ好友", @"kImage":@"InformationRoot_share_QQ_bg"},
                                                                       @{@"kTitle":@"举报", @"kImage":@"report_bg"}]];
        }
        else
        {
            _shareMenuView = [[ShareMenuView alloc]initWithTitleArry:@[@{@"kTitle":@"朋友圈", @"kImage":@"InformationRoot_share_circleFriends_bg"},
                                                                       @{@"kTitle":@"微信好友", @"kImage":@"InformationRoot_share_weiChat_bg"},
                                                                       @{@"kTitle":@"QQ好友", @"kImage":@"InformationRoot_share_QQ_bg"},
                                                                       @{@"kTitle":self.isCollection?@"取消收藏":@"收藏", @"kImage":self.isCollection? @"collection_selected_bg" :@"collection_nomr_bg"}]];
        }
        _shareMenuView.delegate = self;
        [self.navigationController.view addSubview:_shareMenuView];
    }
    return _shareMenuView;
}

-(void)initWithHeaderView
{
    _webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.webViewHeight)];
    _webView.backgroundColor = [UIColor whiteColor];
    _webView.UIDelegate = self;
    _webView.navigationDelegate = self;
    _webView.scrollView.bounces = NO;
    _webView.scrollView.scrollEnabled = NO;
    _webView.scrollView.showsHorizontalScrollIndicator = NO;
    _webView.scrollView.showsVerticalScrollIndicator = NO;
    //kvo 添加进度条监控
    [_webView addObserver:self forKeyPath:NSStringFromSelector(@selector(estimatedProgress)) options:0 context:WkwebBrowserContext];
    
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.webViewHeight + [self harvestSiteLabelHeight:self.titleLabel.text width:SCREEN_WIDTH - 30] + 90)];
    _headerView.backgroundColor = [UIColor whiteColor];
    [_headerView addSubview:self.webView];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:22];
    _titleLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1/1.0];
    [_headerView addSubview:_titleLabel];
    
    _timeLabel = [[UILabel alloc] init];
    _timeLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    _timeLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1/1.0];
    [_headerView addSubview:_timeLabel];
    
    _numberLabel = [[UILabel alloc] init];
    _numberLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    _numberLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1/1.0];
    [_headerView addSubview:_numberLabel];
    
    [_headerView addSubview:self.progressView];
    
    _titleLabel.sd_layout.leftSpaceToView(_headerView, 15)
    .rightSpaceToView(_headerView, 15)
    .topSpaceToView(_headerView, 18)
    .autoHeightRatio(0);
    
    _timeLabel.sd_layout.leftSpaceToView(_headerView, 15)
    .topSpaceToView(_titleLabel, 16)
    .heightIs(13)
    .widthIs(75);
    
    _numberLabel.sd_layout.leftSpaceToView(_timeLabel, 12)
    .topSpaceToView(_titleLabel, 16)
    .widthIs(150)
    .heightIs(13);
    
    _webView.sd_layout.leftSpaceToView(_headerView, 15)
    .rightSpaceToView(_headerView, 15)
    .topSpaceToView(_timeLabel, 10)
    .bottomEqualToView(_headerView);
}

-(UIProgressView *)progressView
{
    if (!_progressView) {
        _progressView = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
        _progressView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 3);
        [_progressView setTrackTintColor:getColor(@"efefef")];
        _progressView.progressTintColor = [UIColor greenColor];
    }
    return _progressView;
}

-(void)setTableView:(UITableView *)tableView
{
    _tableView = tableView;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tableFooterView = [UIView new];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWithHeaderView];
    if (self.type == DetailsTypeHotTopic) {
        [self detailsList];
    }
    else if (self.type == DetailsTypeCommunityTopic)
    {
        [self communityTopicDetails];
    }
    else{
        [self communityPublicAnnouncementDetails];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return self.webViewHeight == 0 ? [self harvestSiteLabelHeight:self.titleLabel.text width:SCREEN_WIDTH - 30] + 90 : self.webViewHeight + [self harvestSiteLabelHeight:self.titleLabel.text width:SCREEN_WIDTH - 30] + 90;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

#pragma mark - WKNavigationDelegate
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    self.progressView.hidden = NO;
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    WS(weakSelf);
    [webView evaluateJavaScript:@"document.body.offsetHeight" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        CGFloat documentHeight = [result doubleValue];
        weakSelf.webViewHeight = documentHeight;
        webView.height = documentHeight;
        [weakSelf.tableView reloadData];
    }];
}

//kvo监听进度条
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(estimatedProgress))] && object == self.webView) {
        [self.progressView setAlpha:1.0f];
        
        BOOL animated = self.webView.estimatedProgress > self.progressView.progress;
        [self.progressView setProgress:self.webView.estimatedProgress animated:animated];
        
        if (self.webView.estimatedProgress >= 1.0f) {
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
    [self.webView removeObserver:self forKeyPath:NSStringFromSelector(@selector(estimatedProgress))];
}

#pragma mark - ShareMenuViewDelegate
-(void)shareButtonWithTitle:(NSString *)title
{
    if ([title isEqualToString:@"举报"]) {
        [self communityReport];
    }
    if ([title isEqualToString:@"朋友圈"]) {
        [self shareWithImage:[UIImage imageNamed:@"icon_bg"] Title:@"智慧沈阳新社区" content:self.titleLabel.text url:shareUrl SSDKPlatformType:SSDKPlatformSubTypeWechatTimeline];
    }
    if ([title isEqualToString:@"微信好友"]) {
        [self shareWithImage:[UIImage imageNamed:@"icon_bg"] Title:@"智慧沈阳新社区" content:self.titleLabel.text url:shareUrl SSDKPlatformType:SSDKPlatformSubTypeWechatSession];
    }
    if ([title isEqualToString:@"QQ好友"]) {
        [self shareWithImage:[UIImage imageNamed:@"icon_bg"] Title:@"智慧沈阳新社区" content:self.titleLabel.text url:shareUrl SSDKPlatformType:SSDKPlatformSubTypeQQFriend];
    }
    if ([title isEqualToString:@"收藏"]) {
        if (self.type == DetailsTypeHotTopic) {
            [self addCollectionType:@"2"];
        }
    }
    if ([title isEqualToString:@"取消收藏"]) {
        [self cancelCollection];
    }
    self.shareMenuView = nil;
}

- (IBAction)moreButtonClick:(id)sender {
    [self.shareMenuView showShareMenuView];
}

-(CGFloat)harvestSiteLabelHeight:(NSString *)text width:(CGFloat)width
{
    CGRect rectToFit = [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22]} context:nil];
    return rectToFit.size.height;
}

@end

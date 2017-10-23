//
//  DetailsViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/21.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "DetailsViewController.h"
#import "ShareMenuView.h"
#import "AllCommentsViewController.h"
#import "InformationRootTableViewCell.h"
#import <WebKit/WebKit.h>

static CGFloat const kToolbarHeight = 50;

static void *WkwebBrowserContext = &WkwebBrowserContext;

@interface QDKeyboardCustomViewController() <QMUIKeyboardManagerDelegate>

@property(nonatomic, strong) QMUIKeyboardManager *keyboardManager;

@property(nonatomic, strong) UIControl *maskControl;
@property(nonatomic, strong) UIView *containerView;
@property(nonatomic, strong) QMUITextView *textView;

@property(nonatomic, strong) UIView *toolbarView;
@property(nonatomic, strong) QMUIButton *cancelButton;
@property(nonatomic, strong) QMUIButton *publishButton;

@property (nonatomic, strong)UIView * lineView;
- (void)hide;
@end

@implementation QDKeyboardCustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorClear;
}

- (void)initSubviews {
    [super initSubviews];
    
    _maskControl = [[UIControl alloc] init];
    self.maskControl.backgroundColor = UIColorMask;
    [self.maskControl addTarget:self action:@selector(handleCancelButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.maskControl];
    
    _containerView = [[UIView alloc] init];
    self.containerView.backgroundColor = UIColorWhite;
    [self.view addSubview:self.containerView];
    
    _textView = [[QMUITextView alloc] init];
    self.textView.font = UIFontMake(16);
    self.textView.placeholder = @"我来说两句";
    self.textView.textContainerInset = UIEdgeInsetsMake(16, 12, 16, 12);
    self.textView.layer.cornerRadius = 8;
    self.textView.clipsToBounds = YES;
    [self.containerView addSubview:self.textView];
    
    _toolbarView = [[UIView alloc] init];
    self.toolbarView.backgroundColor = getColor(@"ffffff");
    [self.containerView addSubview:self.toolbarView];
    
    _lineView = [[UIView alloc]init];
    self.lineView.backgroundColor = getColor(@"efefef");
    [self.toolbarView addSubview:self.lineView];
    
    _cancelButton = [[QMUIButton alloc] init];
    self.cancelButton.titleLabel.font = UIFontMake(16);
    [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [self.cancelButton addTarget:self action:@selector(handleCancelButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.cancelButton setTitleColor:getColor(@"999999") forState:UIControlStateNormal];
    [self.cancelButton sizeToFit];
    [self.toolbarView addSubview:self.cancelButton];
    
    _publishButton = [[QMUIButton alloc] init];
    self.publishButton.titleLabel.font = UIFontMake(16);
    [self.publishButton setTitle:@"发布" forState:UIControlStateNormal];
    [self.publishButton addTarget:self action:@selector(publishButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.publishButton setTitleColor:getColor(@"24c789") forState:UIControlStateNormal];
    [self.publishButton sizeToFit];
    [self.toolbarView addSubview:self.publishButton];
    
    _keyboardManager = [[QMUIKeyboardManager alloc] initWithDelegate:self];
    // 设置键盘只接受 self.textView 的通知事件，如果当前界面有其他 UIResponder 导致键盘产生通知事件，则不会被接受
    [self.keyboardManager addTargetResponder:self.textView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.maskControl.frame = self.view.bounds;
    
    CGRect containerRect = CGRectFlatMake(0, CGRectGetHeight(self.view.bounds), CGRectGetWidth(self.view.bounds), 300);
    
    self.containerView.frame = CGRectApplyAffineTransform(containerRect, self.containerView.transform);
    
    self.toolbarView.frame = CGRectFlatMake(0,0, CGRectGetWidth(self.containerView.bounds), kToolbarHeight);
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.containerView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(10, 10)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.containerView.bounds;
    maskLayer.path = maskPath.CGPath;
    self.containerView.layer.mask = maskLayer;
    
    self.lineView.frame = CGRectMake(15, 49, SCREEN_WIDTH - 30, 1);
    
    self.cancelButton.frame = CGRectFlatMake(20, CGFloatGetCenter(CGRectGetHeight(self.toolbarView.bounds), CGRectGetHeight(self.cancelButton.bounds)), CGRectGetWidth(self.cancelButton.bounds), CGRectGetHeight(self.cancelButton.bounds));
    
    self.publishButton.frame = CGRectFlatMake(CGRectGetWidth(self.toolbarView.bounds) - CGRectGetWidth(self.publishButton.bounds) - 20, CGFloatGetCenter(CGRectGetHeight(self.toolbarView.bounds), CGRectGetHeight(self.publishButton.bounds)), CGRectGetWidth(self.publishButton.bounds), CGRectGetHeight(self.publishButton.bounds));
    
    self.textView.frame = CGRectFlatMake(0, 50, CGRectGetWidth(self.containerView.bounds), CGRectGetHeight(self.containerView.bounds) - 66);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}

- (void)showInParentViewController:(UIViewController *)controller {
    
    // 这一句访问了self.view，触发viewDidLoad:
    self.view.frame = controller.view.bounds;
    
    // 需要先布局好
    [controller.view addSubview:self.view];
    [self.view layoutIfNeeded];
    
    // 这一句触发viewWillAppear:
    [self beginAppearanceTransition:YES animated:YES];
    
    self.maskControl.alpha = 0;
    
    [UIView animateWithDuration:.25 delay:0.0 options:QMUIViewAnimationOptionsCurveOut animations:^{
        self.maskControl.alpha = 1.0;
    } completion:^(BOOL finished) {
        // 这一句触发viewDidAppear:
        [self endAppearanceTransition];
    }];
    
    [self.textView becomeFirstResponder];
}

- (void)hide {
    // 这一句触发viewWillDisappear:
    [self beginAppearanceTransition:NO animated:YES];
    [UIView animateWithDuration:.25 delay:0.0 options:QMUIViewAnimationOptionsCurveOut animations:^{
        self.maskControl.alpha = 0.0;
    } completion:^(BOOL finished) {
        // 这一句触发viewDidDisappear:
        [self endAppearanceTransition];
        [self.view removeFromSuperview];
    }];
}

- (void)handleCancelButtonEvent:(id)sender {
    
    [self.textView resignFirstResponder];
}
//发布
-(void)publishButtonClick:(UIButton *)sender
{
    [self.textView resignFirstResponder];
    if ([self.delegate respondsToSelector:@selector(publishButtonClickWithText:)]) {
        [self.delegate publishButtonClickWithText:self.textView.text];
    }
    self.textView.text = nil;
}

#pragma mark - <QMUIKeyboardManagerDelegate>

- (void)keyboardWillChangeFrameWithUserInfo:(QMUIKeyboardUserInfo *)keyboardUserInfo {
    __weak __typeof(self)weakSelf = self;
    [QMUIKeyboardManager handleKeyboardNotificationWithUserInfo:keyboardUserInfo showBlock:^(QMUIKeyboardUserInfo *keyboardUserInfo) {
        [QMUIKeyboardManager animateWithAnimated:YES keyboardUserInfo:keyboardUserInfo animations:^{
            CGFloat distanceFromBottom = [QMUIKeyboardManager distanceFromMinYToBottomInView:weakSelf.view keyboardRect:keyboardUserInfo.endFrame];
            weakSelf.containerView.layer.transform = CATransform3DMakeTranslation(0, - distanceFromBottom - CGRectGetHeight(self.containerView.bounds), 0);
        } completion:NULL];
    } hideBlock:^(QMUIKeyboardUserInfo *keyboardUserInfo) {
        [weakSelf hide];
        [QMUIKeyboardManager animateWithAnimated:YES keyboardUserInfo:keyboardUserInfo animations:^{
            weakSelf.containerView.layer.transform = CATransform3DIdentity;
        } completion:NULL];
    }];
}

@end


@interface DetailsViewController ()<WKUIDelegate, WKNavigationDelegate, ShareMenuViewDelegate, UITableViewDelegate, UITableViewDataSource, QDKeyboardCustomViewControllerDelegate, AllCommentsViewControllerDelegate>
@property (nonatomic, strong)WKWebView * webView;
@property (weak, nonatomic) IBOutlet UIButton *collectionButton;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)UILabel * titleLabel;
@property (nonatomic, strong)UILabel * timeLabel;
@property (nonatomic, strong)UILabel * commentLabel;

//设置加载进度条
@property (nonatomic,strong) UIProgressView *progressView;
@property (nonatomic, strong)ShareMenuView * shareMenuView;

@property(nonatomic, strong) QDKeyboardCustomViewController *customViewController;
@property (nonatomic, strong)UIView * headerView;
@property (nonatomic, strong)NSArray * dataArray;
@property (nonatomic, assign)CGFloat webViewHeight;
@property (nonatomic, strong)DetailsModel * model;
@property (nonatomic, strong)CommunityTopicDetailsModel * topicModel;
@end
@interface DetailsViewController (network)
@end

@implementation DetailsViewController (network)

-(void)detailsListUrl:(NSString *)url
{
    [NewCommunityBLL detailsListId:self.kid Url:url andshowHUDInView:self.view resultPostsWithBlock:^(DetailsModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                self.dataArray = model.postRecommendList;
                NSURLRequest * req = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@cms/html/cms.action?id=%ld", BASE_URL, self.kid]]];
                
                [self.webView loadRequest:req];
                self.titleLabel.text = model.detail.title;
                self.timeLabel.text = model.detail.addTime;
                self.commentLabel.text = [NSString stringWithFormat:@"浏览量：%@", model.detail.click];
                self.numberLabel.text = model.detail.comment;
                self.dataArray = model.postRecommendList;
                self.model = model;
                if ([model.detail.collectState isEqualToString:@"false"]) {
                    self.collectionButton.selected = NO;
                }
                else
                {
                    self.collectionButton.selected = YES;
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
    [NewCommunityBLL communityTopicDetailsId:[NSString stringWithFormat:@"%ld", self.kid] andshowHUDInView:self.view resultPostsWithBlock:^(CommunityTopicDetailsModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                NSURLRequest * req = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@cms/html/topic.action?id=%ld", BASE_URL, self.kid]]];
                [self.webView loadRequest:req];
                self.titleLabel.text = model.topic.title;
                self.timeLabel.text = model.topic.addTime;
                self.commentLabel.text = [NSString stringWithFormat:@"浏览量：%@", model.topic.click];
                self.numberLabel.text = model.topic.commentSum;
                self.topicModel = model;
                if ([model.topic.state isEqualToString:@"false"]) {
                    self.collectionButton.selected = NO;
                }
                else
                {
                    self.collectionButton.selected = YES;
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

//添加评论
-(void)addCommentsWithText:(NSString *)text
{
    [NewCommunityBLL addCommentsMemeerId:[User sharedInstanced].ATP_acessToken postId:[NSString stringWithFormat:@"%ld", (long)self.kid] message:text andshowHUDInView:self.view resultPostsWithBlock:^(ModifyInformationModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                [self showMessage:@"评论成功"];
                self.numberLabel.text = [NSString stringWithFormat:@"%ld", [self.numberLabel.text integerValue] + 1];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"addCommentsList" object:self.indexPath];
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
//添加社区话题评论
-(void)addcommunityTopicWithText:(NSString *)text
{
    [NewCommunityBLL addTopicCommentLifeId:[NSString stringWithFormat:@"%ld", (long)self.kid] message:text andshowHUDInView:self.view resultPostsWithBlock:^(ModifyInformationModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                [self showMessage:@"评论成功"];
                self.numberLabel.text = [NSString stringWithFormat:@"%ld", [self.numberLabel.text integerValue] + 1];
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
    [NewCommunityBLL collectionpostId:[NSString stringWithFormat:@"%ld", self.kid] type:type andshowHUDInView:self.view resultPostsWithBlock:^(ModifyInformationModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                [self showMessage:@"收藏成功"];
                self.collectionButton.selected = YES;
                if (self.isCommunity) {
                    self.topicModel.topic.state = @"true";
                }
                else
                {
                    self.model.detail.collectState = @"true";
                }
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
    [NewCommunityBLL cancelCollectionpostId:[NSString stringWithFormat:@"%ld", self.kid] andshowHUDInView:self.view resultPostsWithBlock:^(ModifyInformationModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                [self showMessage:@"取消收藏成功"];
                self.collectionButton.selected = NO;
                if (self.isCommunity) {
                    self.topicModel.topic.state = @"false";
                }
                else
                {
                    self.model.detail.collectState = @"false";
                }
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

@implementation DetailsViewController

//- (NSString *)stringEncode {
//
//    return encodedString;
//}

-(ShareMenuView *)shareMenuView
{
    if (!_shareMenuView) {
        _shareMenuView = [[ShareMenuView alloc]initWithTitleArry:@[@{@"kTitle":@"朋友圈", @"kImage":@"InformationRoot_share_circleFriends_bg"},
                                                                   @{@"kTitle":@"微信好友", @"kImage":@"InformationRoot_share_weiChat_bg"},
                                                                   @{@"kTitle":@"QQ好友", @"kImage":@"InformationRoot_share_QQ_bg"}]];
        _shareMenuView.delegate = self;
        [self.navigationController.view addSubview:_shareMenuView];
    }
    return _shareMenuView;
}

-(WKWebView *)webView
{
    if (!_webView) {
        _webView = [[WKWebView alloc]init];
        _webView.backgroundColor = [UIColor clearColor];
        _webView.UIDelegate = self;
        _webView.navigationDelegate = self;
        _webView.scrollView.scrollEnabled = NO;
        _webView.scrollView.showsVerticalScrollIndicator = NO;
        [_webView sizeToFit];
        //kvo 添加进度条监控
        [_webView addObserver:self forKeyPath:NSStringFromSelector(@selector(estimatedProgress)) options:0 context:WkwebBrowserContext];
    }
    return _webView;
}

-(UIView *)headerView
{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.webViewHeight + [self harvestSiteLabelHeight:self.titleLabel.text width:SCREEN_WIDTH - 30] + 90)];
        _headerView.backgroundColor = [UIColor whiteColor];
        [_headerView addSubview:self.webView];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 18, SCREEN_WIDTH, 23)];
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:22];
        _titleLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1/1.0];
        [_headerView addSubview:_titleLabel];
        
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.frame = CGRectMake(15, CGRectGetMaxY(_titleLabel.frame) + 16, 69, 13);
        _timeLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _timeLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1/1.0];
        [_headerView addSubview:_timeLabel];

        _commentLabel = [[UILabel alloc] init];
        _commentLabel.frame = CGRectMake(CGRectGetMaxX(_timeLabel.frame) + 12, CGRectGetMaxY(_titleLabel.frame) + 16, 70, 13);
        _commentLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _commentLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1/1.0];
        [_headerView addSubview:_commentLabel];
        
        _titleLabel.sd_layout.leftSpaceToView(_headerView, 15)
        .topSpaceToView(_headerView, 18)
        .rightSpaceToView(_headerView, 15)
        .autoHeightRatio(0);
        
        _timeLabel.sd_layout.leftSpaceToView(_headerView, 15)
        .topSpaceToView(_titleLabel, 16).widthIs(69).heightIs(13);
        
        _commentLabel.sd_layout.leftSpaceToView(_timeLabel, 12).topSpaceToView(_titleLabel, 16).widthIs(70).heightIs(13);
        
        self.webView.frame = CGRectMake(0, CGRectGetMaxY(_timeLabel.frame) + 40, SCREEN_WIDTH, self.webViewHeight);

        UILabel *label = [[UILabel alloc] init];
        label.text = @"相关推荐";
        label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        label.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1/1.0];
        [_headerView addSubview:label];
        
        UIView * lineView = [[UIView alloc]init];
        lineView.backgroundColor = getColor(@"24c789");
        [_headerView addSubview:lineView];
        
        UIView * view = [[UIView alloc]init];
        view.backgroundColor = getColor(@"efefef");
        [_headerView addSubview:view];
        if (self.isCommunity) {
            label.hidden = YES;
            lineView.hidden = YES;
            view.hidden = YES;
        }
        else
        {
            label.hidden = NO;
            lineView.hidden = NO;
            view.hidden = NO;
        }
        
        lineView.sd_layout.leftSpaceToView(_headerView, 15)
        .heightIs(1)
        .bottomSpaceToView(_headerView, 1)
        .widthIs(56);
        
        view.sd_layout.leftSpaceToView(lineView, 0)
        .bottomSpaceToView(_headerView, 1)
        .heightIs(1)
        .rightSpaceToView(_headerView, 15);
        
        label.sd_layout.leftSpaceToView(_headerView, 15)
        .bottomSpaceToView(lineView, 8)
        .autoWidthRatio(200)
        .heightIs(15);
    }
    return _headerView;
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

-(void)setNumberLabel:(UILabel *)numberLabel
{
    _numberLabel = numberLabel;
    _numberLabel.layer.cornerRadius = 4;
    _numberLabel.layer.masksToBounds = YES;
}

-(void)setCollectionButton:(UIButton *)collectionButton
{
    _collectionButton = collectionButton;
    [_collectionButton setAdjustsImageWhenHighlighted:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.progressView];
    if (self.isCommunity) {
        [self communityTopicDetails];
    }
    else
    {
        [self detailsListUrl:@"cms/post/detail.action"];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addCommentsNoti:) name:@"addComments" object:nil];
}

-(void)addCommentsNoti:(NSNotification *)noti
{
    self.numberLabel.text = [NSString stringWithFormat:@"%ld", [self.numberLabel.text integerValue] + 1];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"addCommentsList" object:self.indexPath];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    InformationRootTableViewCell * cell = [InformationRootTableViewCell cellForTableView:tableView];
    cell.detailModel = self.dataArray[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView cellHeightForIndexPath:indexPath cellContentViewWidth:SCREEN_WIDTH tableView:tableView];
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailsPostRecommendList * model = self.dataArray[indexPath.row];
    DetailsViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([DetailsViewController class])];
    VC.kid = [model.postId integerValue];
    [self.navigationController pushViewController:VC animated:YES];
}

#pragma mark - WKNavigationDelegate
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    self.progressView.hidden = NO;
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    //这里是js，主要目的实现对url的获取
    static  NSString * const jsGetImages =
    @"function getImages(){\
    var objs = document.getElementsByTagName(\"img\");\
    var imgScr = '';\
    for(var i=0;i<objs.length;i++){\
    imgScr = imgScr + objs[i].src + '+';\
    };\
    return imgScr;\
    };";
    [self.webView evaluateJavaScript:jsGetImages completionHandler:^(id _Nullable response, NSError * _Nullable error) {
        NSLog(@"response: %@ error: %@", response, error);
        NSLog(@"call js alert by native");
    }];
    
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
    if ([title isEqualToString:@"朋友圈"]) {
        [self shareWithImage:[UIImage imageNamed:@"icon_bg"] Title:@"智慧沈阳新社区" content:self.titleLabel.text url:shareUrl SSDKPlatformType:SSDKPlatformSubTypeWechatTimeline];
    }
    if ([title isEqualToString:@"微信好友"]) {
        [self shareWithImage:[UIImage imageNamed:@"icon_bg"] Title:@"智慧沈阳新社区" content:self.titleLabel.text url:shareUrl SSDKPlatformType:SSDKPlatformSubTypeWechatSession];
    }
    if ([title isEqualToString:@"QQ好友"]) {
         [self shareWithImage:[UIImage imageNamed:@"icon_bg"] Title:@"智慧沈阳新社区" content:self.titleLabel.text url:shareUrl SSDKPlatformType:SSDKPlatformSubTypeQQFriend];
    }
}

#pragma mark - QDKeyboardCustomViewControllerDelegate
-(void)publishButtonClickWithText:(NSString *)text
{
    if ([User sharedInstanced].ATP_acessToken.length <= 0) {
        [self presentLogin];
        return;
    }
    if (text.length <= 0) {
        [self showMessage:@"内容不能为空"];
        return;
    }
    if (self.isCommunity) {
        [self addcommunityTopicWithText:text];
    }
    else
    {
        [self addCommentsWithText:text];
    }
}

//右上角更多
- (IBAction)moreButtonClick:(id)sender {
    [self.shareMenuView showShareMenuView];
}
//评论
- (IBAction)commentButtonClick:(id)sender {
    AllCommentsViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([AllCommentsViewController class])];
    VC.delegate = self;
    VC.postId = [NSString stringWithFormat:@"%ld", self.kid];
    VC.isCommunity = self.isCommunity;
    VC.topicModel = self.topicModel;
    VC.model = self.model;
    [self.navigationController pushViewController:VC animated:YES];
}

#pragma mark - AllCommentsViewControllerDelegate

-(void)collectionWithState:(BOOL)state
{
    self.collectionButton.selected = state;
    if (self.isCommunity) {
        self.topicModel.topic.state = state ? @"true" : @"false";
    }
    else
    {
        self.model.detail.collectState = state ? @"true" : @"false";
    }
}

//输入评论
- (IBAction)inPutButtonClick:(id)sender {
    if (!self.customViewController) {
        self.customViewController = [[QDKeyboardCustomViewController alloc] init];
        self.customViewController.delegate = self;
    }
    if (!self.customViewController.view.superview) {
        [self.customViewController showInParentViewController:self.navigationController];
    }
}
//收藏
- (IBAction)collectionButtonClick:(UIButton *)sender {
    if ([User sharedInstanced].ATP_acessToken.length <= 0) {
        [self presentLogin];
        return;
    }
    if (sender.selected) {
        [self cancelCollection];
    }
    else
    {
        if (self.isCommunity) {
            [self addCollectionType:@"0"];
        }
        else
        {
            [self addCollectionType:@"1"];
        }
    }
}
//分享
- (IBAction)shareButtonClick:(id)sender {
    [self.shareMenuView showShareMenuView];
}

-(CGFloat)harvestSiteLabelHeight:(NSString *)text width:(CGFloat)width
{
    CGRect rectToFit = [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22]} context:nil];
    return rectToFit.size.height;
}

@end

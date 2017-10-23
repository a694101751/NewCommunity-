//
//  AllCommentsViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/21.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "AllCommentsViewController.h"
#import "ShareMenuView.h"
#import "DetailsViewController.h"
#import "AllCommentsTableViewCell.h"

@class QDKeyboardCustomViewController;

@interface AllCommentsViewController ()<ShareMenuViewDelegate, UITableViewDelegate, UITableViewDataSource, QDKeyboardCustomViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
//标题
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
//时间
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
//浏览量
@property (weak, nonatomic) IBOutlet UILabel *browseLabel;
//全部评论
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *allCommentLabel;
@property (weak, nonatomic) IBOutlet UIButton *collectionButton;
@property (nonatomic, strong)ShareMenuView * shareMenuView;
@property (nonatomic, strong)QDKeyboardCustomViewController * customViewController;
@property (nonatomic, assign)NSInteger currentPage;
@property (nonatomic, strong)NSMutableArray * dataArray;
@property (nonatomic, strong)AllCommentsData * dataModel;
-(void)setContentWithArray:(NSArray *)array;
@end

@interface AllCommentsViewController (network)
@end

@implementation AllCommentsViewController (network)

-(void)allCommentsList
{
    [NewCommunityBLL allCommentsPostid:self.postId page:1 andshowHUDInView:self.view resultPostsWithBlock:^(AllCommentsModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                if (self.currentPage == 1) {
                    [self.dataArray removeAllObjects];
                }
                [self setContentWithArray:model.data.post];
                self.dataModel = model.data;
                self.numberLabel.text = model.data.total;
                self.allCommentLabel.text = [NSString stringWithFormat:@"全部评论（%@）", model.data.total];
            }
            else
            {
                [self showMessage:model.content];
            }
        }
        else{
            [self showError:error];
        }
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
    }];
}
//社区话题评论列表
-(void)topicAllComment
{
    [NewCommunityBLL communityTopicCommentsLifeId:self.postId page:self.currentPage andshowHUDInView:self.view resultPostsWithBlock:^(AllCommentsModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                if (self.currentPage == 1) {
                    [self.dataArray removeAllObjects];
                }
                [self setContentWithArray:model.data.post];
                self.dataModel = (AllCommentsData *)model.data;
                self.numberLabel.text = model.data.total;
                self.allCommentLabel.text = [NSString stringWithFormat:@"全部评论（%@）", model.data.total];
            }
            else
            {
                [self showMessage:model.content];
            }
        }
        else{
            [self showError:error];
        }
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
    }];
}

//添加评论
-(void)addCommentsWithText:(NSString *)text
{
    [NewCommunityBLL addCommentsMemeerId:[User sharedInstanced].ATP_acessToken postId:self.postId message:text andshowHUDInView:self.view resultPostsWithBlock:^(ModifyInformationModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                [self showMessage:@"评论成功"];
                AllCommentsPost * model = [[AllCommentsPost alloc]init];
                model.avatar = [User sharedInstanced].ATP_avatar;
                model.userName = [User sharedInstanced].ATP_nickName;
                model.message = text;
                [self.dataArray insertObject:model atIndex:0];
                self.numberLabel.text = [NSString stringWithFormat:@"%ld", [self.numberLabel.text integerValue] + 1];
                self.allCommentLabel.text = [NSString stringWithFormat:@"全部评论（%ld）", [self.numberLabel.text integerValue]];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"addComments" object:nil];
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

//添加社区话题评论
-(void)addcommunityTopicWithText:(NSString *)text
{
    [NewCommunityBLL addTopicCommentLifeId:self.postId message:text andshowHUDInView:self.view resultPostsWithBlock:^(ModifyInformationModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                [self showMessage:@"评论成功"];
                AllCommentsPost * model = [[AllCommentsPost alloc]init];
                model.avatar = [User sharedInstanced].ATP_avatar;
                model.userName = [User sharedInstanced].ATP_nickName;
                model.message = text;
                [self.dataArray insertObject:model atIndex:0];
                self.numberLabel.text = [NSString stringWithFormat:@"%ld", [self.numberLabel.text integerValue] + 1];
                self.allCommentLabel.text = [NSString stringWithFormat:@"全部评论（%ld）", [self.numberLabel.text integerValue]];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"addComments" object:nil];
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

//收藏
-(void)addCollectionType:(NSString *)type
{
    [NewCommunityBLL collectionpostId:self.postId type:type andshowHUDInView:self.view resultPostsWithBlock:^(ModifyInformationModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                [self showMessage:@"收藏成功"];
                self.collectionButton.selected = YES;
                if ([self.delegate respondsToSelector:@selector(collectionWithState:)]) {
                    [self.delegate collectionWithState:YES];
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
    [NewCommunityBLL cancelCollectionpostId:self.postId andshowHUDInView:self.view resultPostsWithBlock:^(ModifyInformationModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                [self showMessage:@"取消收藏成功"];
                self.collectionButton.selected = NO;
                if ([self.delegate respondsToSelector:@selector(collectionWithState:)]) {
                    [self.delegate collectionWithState:NO];
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

@implementation AllCommentsViewController

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

-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

-(void)setContentWithArray:(NSArray *)array
{
    [self.dataArray addObjectsFromArray:array];
}

-(void)setDataModel:(AllCommentsData *)dataModel
{
    _dataModel = dataModel;
    NSInteger count = ceil([dataModel.total integerValue] / 20.0);
    if (self.currentPage == count) {
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
        self.currentPage = count;
    }
    else
    {
        [self.tableView.mj_footer resetNoMoreData];
        [self.tableView.mj_footer endRefreshing];
    }
}

-(void)setTableView:(UITableView *)tableView
{
    _tableView = tableView;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tableFooterView = [UIView new];
    _tableView.separatorInset = UIEdgeInsetsMake(0, -20, 0, 0);
    [_tableView setSeparatorColor:getColor(@"24c789")];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.currentPage = 1;
        if (self.isCommunity) {
            [self topicAllComment];
        }
        else
        {
            [self allCommentsList];
        }
    }];
    _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        self.currentPage ++;
        [self allCommentsList];
    }];
}

-(void)setNumberLabel:(UILabel *)numberLabel
{
    _numberLabel = numberLabel;
    _numberLabel.layer.cornerRadius = 4;
    _numberLabel.layer.masksToBounds = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentPage = 1;
    if (self.isCommunity) {
        [self topicAllComment];
    }
    else
    {
       [self allCommentsList];
    }
    if (!self.isCommunity) {
        self.titleLabel.text = self.model.detail.title;
        self.timeLabel.text = self.model.detail.addTime;
        self.browseLabel.text = [NSString stringWithFormat:@"浏览量：%@", self.model.detail.click];
        self.numberLabel.text = self.model.detail.comment;
        self.allCommentLabel.text = [NSString stringWithFormat:@"全部评论（%@）", self.model.detail.comment];
        if ([self.model.detail.collectState isEqualToString:@"false"]) {
            self.collectionButton.selected = NO;
        }
        else
        {
            self.collectionButton.selected = YES;
        }
    }
    else
    {
        self.titleLabel.text = self.topicModel.topic.title;
        self.timeLabel.text = self.topicModel.topic.addTime;
        self.browseLabel.text = [NSString stringWithFormat:@"浏览量：%@", self.topicModel.topic.click];
        self.numberLabel.text = self.topicModel.topic.commentSum;
        self.allCommentLabel.text = [NSString stringWithFormat:@"全部评论（%@）", self.topicModel.topic.commentSum];
        if ([self.topicModel.topic.state isEqualToString:@"false"]) {
            self.collectionButton.selected = NO;
        }
        else
        {
            self.collectionButton.selected = YES;
        }
    }
    
    UIView * view = self.tableView.tableHeaderView;
    view.frame = CGRectMake(0, 0, SCREEN_WIDTH,[self harvestSiteLabelHeight:self.titleLabel.text width:SCREEN_WIDTH - 30] + 90);
    [self.tableView setTableHeaderView:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AllCommentsTableViewCell * cell = [AllCommentsTableViewCell cellForTableView:tableView];

    cell.model = self.dataArray[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView cellHeightForIndexPath:indexPath cellContentViewWidth:SCREEN_WIDTH tableView:tableView];
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

//收藏
- (IBAction)collectionButtonClick:(UIButton *)sender {
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
//写评论
- (IBAction)inPutButtonClick:(id)sender {
    if (!self.customViewController) {
        self.customViewController = [[QDKeyboardCustomViewController alloc] init];
        self.customViewController.delegate = self;
    }
    if (!self.customViewController.view.superview) {
        [self.customViewController showInParentViewController:self.navigationController];
    }
}
//右上角 更多
- (IBAction)moreButtonClick:(id)sender {
    [self.shareMenuView showShareMenuView];
}

-(CGFloat)harvestSiteLabelHeight:(NSString *)text width:(CGFloat)width
{
    CGRect rectToFit = [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22]} context:nil];
    return rectToFit.size.height;
}

@end

//
//  CommunityLifeDetailsViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/25.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "CommunityLifeDetailsViewController.h"
#import "IWantReleaseCollectionViewCell.h"
#import "CommunityLifeDetailsTableViewCell.h"
#import "ShareMenuView.h"
#import "DetailsViewController.h"
#import <UIImageView+WebCache.h>

@interface CommunityLifeDetailsViewController ()<UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, ShareMenuViewDelegate, QDKeyboardCustomViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic, strong)UIView * headerView;

@property (nonatomic, strong)UICollectionView * collectionView;
@property (nonatomic, strong)UIImageView * headerImageView;
@property (nonatomic, strong)UILabel * nameLabel;
@property (nonatomic, strong)UILabel * timeLabel;
@property (nonatomic, strong)UILabel * contentLabel;
@property (nonatomic, strong)QMUIButton * locationButton;
@property (nonatomic, strong)QMUIButton * thumbButton;
@property (nonatomic, strong)QMUIButton * commentsButton;
@property (nonatomic, strong)UILabel * commentsLabel;
@property (nonatomic, strong)UIView * lineView;
@property (nonatomic, strong)UIView * greenView;
@property (nonatomic, strong)UIView * view1;
@property (nonatomic, strong)QDKeyboardCustomViewController * customViewController;

@property (nonatomic, strong)NSArray * imageArray;
@property (nonatomic, assign)NSInteger currentPage;
@property (nonatomic, strong)NSMutableArray * dataArray;
@property (nonatomic, strong)CommunityLifeDetailsCommentListData * dataModel;
@property (nonatomic, strong)CommunityLifeDetailsClubLife * lifeModel;
-(void)changePosition;
-(void)setContentWithArray:(NSArray *)array;
-(void)submittedSuccessfully;
@property (nonatomic, strong)ShareMenuView * shareMenuView;
@end

@interface CommunityLifeDetailsViewController (network)
@end

@implementation CommunityLifeDetailsViewController (network)
//详情
-(void)communityLifeDetails
{
    [NewCommunityBLL communityLifeDetailsID:self.kid andshowHUDInView:self.view resultPostsWithBlock:^(CommunityLifeDetailsModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                switch ([model.clubLife.lifeType integerValue]) {
                    case 0:
                        self.navigationItem.title = @"生活杂谈";
                        break;
                    case 1:
                        self.navigationItem.title = @"突发爆料";
                        break;
                    case 2:
                        self.navigationItem.title = @"新鲜事儿";
                        break;
                    case 3:
                        self.navigationItem.title = @"邻里易物";
                        break;
                    case 4:
                        self.navigationItem.title = @"咨询求助";
                        break;
                }
                self.lifeModel = model.clubLife;
                self.imageArray = model.clubLife.photo;
                [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:model.clubLife.userthumb] placeholderImage:[UIImage imageNamed:@"PersonalCenter_default_header"]];
               self.nameLabel.text = model.clubLife.userName;
                self.timeLabel.text = model.clubLife.distanceTime;
                self.contentLabel.text = model.clubLife.content;
                [self.locationButton setTitle:model.clubLife.cludName forState:UIControlStateNormal];
                self.commentsLabel.text = [NSString stringWithFormat: @"全部评论（%@）", model.clubLife.commentSum];
                [self.thumbButton setTitle:model.clubLife.praiseSum forState:UIControlStateNormal];
                self.thumbButton.selected = model.clubLife.praiseState;
                [self.commentsButton setTitle:model.clubLife.commentSum forState:UIControlStateNormal];
                [self changePosition];
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
        [self.collectionView reloadData];
        [self.tableView reloadData];
    }];
}
//评论列表
-(void)communityLifeDetailsCommentList
{
    [NewCommunityBLL communityLifeDetailsCommentListID:self.kid page:self.currentPage andshowHUDInView:nil resultPostsWithBlock:^(CommunityLifeDetailsCommentListModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                self.dataModel = model.data;
                if (self.currentPage == 1) {
                    [self.dataArray removeAllObjects];
                }
                [self setContentWithArray:model.data.pages];
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
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    }];
}
//添加评论
-(void)communityLifeAddCommentWithText:(NSString *)text
{
    [NewCommunityBLL communityAddCommentslifeId:self.kid message:text andshowHUDInView:self.view resultPostsWithBlock:^(ModifyInformationModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                [self showMessage:@"评论成功"];
                CommunityLifeDetailsCommentListPage * pageModel = [[CommunityLifeDetailsCommentListPage alloc]init];
                pageModel.avatar = [User sharedInstanced].ATP_avatar;
                pageModel.userName = [User sharedInstanced].ATP_userName;
                pageModel.message = text;
                [self.dataArray insertObject:pageModel atIndex:0];
                
                NSInteger count = [self.commentsButton.titleLabel.text integerValue];
                count++;
                [self.commentsButton setTitle:[NSString stringWithFormat:@"%ld", count] forState:UIControlStateNormal];
                self.commentsLabel.text = [NSString stringWithFormat: @"全部评论（%ld）", count];
                if ([self.delegate respondsToSelector:@selector(commentsWithCount:indexPath:)]) {
                    [self.delegate commentsWithCount:count indexPath:self.indexPath];
                }
            }
        }
        else
        {
            [self showError:error];
        }
        [self.tableView reloadData];
    }];
}

//社区生活 点赞
-(void)addPraiseWithID:(NSString *)kid
{
    [NewCommunityBLL communityPraiseLifeId:kid andshowHUDInView:self.view resultPostsWithBlock:^(ModifyInformationModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                self.thumbButton.selected = YES;
                NSInteger count = [self.thumbButton.titleLabel.text integerValue];
                count ++;
                [self.thumbButton setTitle:[NSString stringWithFormat:@"%ld", count] forState:UIControlStateNormal];
                if ([self.delegate respondsToSelector:@selector(praiseWithState: indexPath:)]) {
                    [self.delegate praiseWithState:YES indexPath:self.indexPath];
                }
            }
            else
            {
                [self showMessage:@"点赞失败"];
            }
        }
        else
        {
            [self showError:error];
        }
    }];
}
//社区生活取消点赞
-(void)cancelPraiseWithID:(NSString *)kid
{
    [NewCommunityBLL communityCancelPraiseLifeId:kid andshowHUDInView:self.view resultPostsWithBlock:^(ModifyInformationModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                self.thumbButton.selected = NO;
                NSInteger count = [self.thumbButton.titleLabel.text integerValue];
                count --;
                [self.thumbButton setTitle:[NSString stringWithFormat:@"%ld", count] forState:UIControlStateNormal];
                if ([self.delegate respondsToSelector:@selector(praiseWithState: indexPath:)]) {
                    [self.delegate praiseWithState:NO indexPath:self.indexPath];
                }
            }
            else
            {
                [self showMessage:@"取消点赞失败"];
            }
        }
        else
        {
            [self showError:error];
        }
    }];
}

//举报
-(void)communityReport
{
    [NewCommunityBLL communityReportobjType:self.lifeModel.lifeType objId:self.kid andshowHUDInView:self.view resultPostsWithBlock:^(ModifyInformationModel *model, NSError *error) {
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
//一条评论
-(void)oneComment
{
    [NewCommunityBLL oneCommentListId:self.messageModel.idField andshowHUDInView:nil resultPostsWithBlock:^(OneCommentModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                if (self.currentPage == 1) {
                    [self.dataArray removeAllObjects];
                }
                [self.dataArray addObject:model.pages];
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
        [self.tableView reloadData];
    }];
}

//回复评论
-(void)replyToCommentMessage:(NSString *)message
{
    [NewCommunityBLL replyToCommentLifeId:self.kid message:message commentId:self.messageModel.idField andshowHUDInView:self.view resultPostsWithBlock:^(ModifyInformationModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                [self showMessage:@"回复评论成功"];
                self.currentPage = 1;
                [self oneComment];
            }
        }
        else
        {
            [self showError:error];
        }
    }];
}
//删除社区生活
-(void)deleteLife
{
    [NewCommunityBLL deletelifeId:self.kid andshowHUDInView:self.view resultPostsWithBlock:^(ModifyInformationModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                [self showMessage:@"删除成功"];
                //延时函数，1秒后执行
                [self performSelector:@selector(submittedSuccessfully) withObject:nil afterDelay:1.5f];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"deleteLife" object:nil];
            }
        }
        else
        {
            [self showError:error];
        }
    }];
}

@end

@implementation CommunityLifeDetailsViewController

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

-(void)setDataModel:(CommunityLifeDetailsCommentListData *)dataModel
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

-(void)submittedSuccessfully
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(ShareMenuView *)shareMenuView
{
    if (!_shareMenuView) {
        if (self.detailsType == CommunityLifeDetailsTypeMyState) {
            _shareMenuView = [[ShareMenuView alloc]initWithTitleArry:@[@{@"kTitle":@"朋友圈", @"kImage":@"InformationRoot_share_circleFriends_bg"},
                                                                       @{@"kTitle":@"微信好友", @"kImage":@"InformationRoot_share_weiChat_bg"},
                                                                       @{@"kTitle":@"QQ好友", @"kImage":@"InformationRoot_share_QQ_bg"},
                                                                       @{@"kTitle":@"删除", @"kImage":@"delete_bg"}]];
        }
        else
        {
            _shareMenuView = [[ShareMenuView alloc]initWithTitleArry:@[@{@"kTitle":@"朋友圈", @"kImage":@"InformationRoot_share_circleFriends_bg"},
                                                                       @{@"kTitle":@"微信好友", @"kImage":@"InformationRoot_share_weiChat_bg"},
                                                                       @{@"kTitle":@"QQ好友", @"kImage":@"InformationRoot_share_QQ_bg"},
                                                                       @{@"kTitle":@"举报", @"kImage":@"report_bg"}]];
        }
        _shareMenuView.delegate = self;
        _shareMenuView.titleLabel.hidden = YES;
        [self.navigationController.view addSubview:_shareMenuView];
    }
    return _shareMenuView;
}

-(void)initWithHeaderView
{
    _headerView = [[UIView alloc]init];
    _headerView.backgroundColor = [UIColor whiteColor];
    _headerImageView = [[UIImageView alloc]init];
    [_headerView addSubview:_headerImageView];
    
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:SCALEIPHONE6(14)];
    _nameLabel.textColor = [UIColor colorWithRed:88/255.0 green:79/255.0 blue:96/255.0 alpha:1/1.0];
    [_headerView addSubview:_nameLabel];
    
    _timeLabel = [[UILabel alloc] init];
    _timeLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    _timeLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1/1.0];
    _timeLabel.textAlignment = NSTextAlignmentRight;
    [_headerView addSubview:_timeLabel];
    
    _contentLabel = [[UILabel alloc] init];
    _contentLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
    _contentLabel.textColor = [UIColor colorWithRed:21/255.0 green:21/255.0 blue:21/255.0 alpha:1/1.0];
    [_headerView addSubview:_contentLabel];
    
    _locationButton = [QMUIButton buttonWithType:UIButtonTypeCustom];
    _locationButton.spacingBetweenImageAndTitle = 3;
    [_locationButton setImage:[UIImage imageNamed:@"location_bg"] forState:UIControlStateNormal];
    _locationButton.titleLabel.font = Define_SystemIphone6Font12;
    [_locationButton setTitleColor:getColor(@"666666") forState:UIControlStateNormal];
    _locationButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_headerView addSubview:_locationButton];
    
    _thumbButton = [QMUIButton buttonWithType:UIButtonTypeCustom];
    _thumbButton.spacingBetweenImageAndTitle = 4;
    [_thumbButton setImage:[UIImage imageNamed:@"thumbButton_normal_bg"] forState:UIControlStateNormal];
    [_thumbButton setImage:[UIImage imageNamed:@"thumbButton_selected_bg"] forState:UIControlStateSelected];
    _thumbButton.titleLabel.font = Define_SystemIphone6Font12;
    [_thumbButton setTitleColor:getColor(@"666666") forState:UIControlStateNormal];
    [_thumbButton addTarget:self action:@selector(thumbButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    _thumbButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_headerView addSubview:_thumbButton];
    
    _commentsButton = [QMUIButton buttonWithType:UIButtonTypeCustom];
    _commentsButton.spacingBetweenImageAndTitle = 4;
    [_commentsButton setImage:[UIImage imageNamed:@"comments_normal_bg"] forState:UIControlStateNormal];
    _commentsButton.titleLabel.font = Define_SystemIphone6Font12;
    [_commentsButton setTitleColor:getColor(@"666666") forState:UIControlStateNormal];
    _commentsButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_headerView addSubview:_commentsButton];
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake((SCREEN_WIDTH - 93) / 3, (SCREEN_WIDTH - 93) / 3);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumLineSpacing = 6;
    layout.minimumInteritemSpacing = 6;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 87) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [_collectionView registerNib:[UINib nibWithNibName:@"IWantReleaseCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([IWantReleaseCollectionViewCell class])];
    [_headerView addSubview:_collectionView];
    
    _lineView = [[UIView alloc]init];
    _lineView.backgroundColor = getColor(@"efefef");
    [_headerView addSubview:_lineView];
    
    _commentsLabel = [[UILabel alloc] init];
    _commentsLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    _commentsLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1/1.0];
    [_headerView addSubview:_commentsLabel];
    
    _greenView = [[UIView alloc]init];
    _greenView.backgroundColor = getColor(@"24c789");
    [_headerView addSubview:_greenView];
    
    _view1 = [[UIView alloc]init];
    _view1.backgroundColor = getColor(@"efefef");
    [_headerView addSubview:_view1];
    
    _headerImageView.sd_layout.leftSpaceToView(_headerView, 15)
    .topSpaceToView(_headerView, 12)
    .widthIs(35)
    .heightIs(35);
    
    _nameLabel.sd_layout.leftSpaceToView(_headerImageView, 16)
    .topSpaceToView(_headerView, 22)
    .rightSpaceToView(_headerView, 170)
    .autoHeightRatio(0);
    
    _timeLabel.sd_layout.rightSpaceToView(_headerView, 15)
    .topSpaceToView(_headerView, 22)
    .leftSpaceToView(_headerView, 100)
    .heightIs(13);
    
    _contentLabel.sd_layout.leftSpaceToView(_headerView, 66)
    .topSpaceToView(_nameLabel, 10)
    .rightSpaceToView(_headerView, 15)
    .autoHeightRatio(0);
    
    NSInteger coutent = ceil(_imageArray.count / 3.0);
    _collectionView.sd_layout.leftSpaceToView(self.headerView, 66)
    .topSpaceToView(_contentLabel, 12)
    .rightSpaceToView(self.headerView, 15)
    .heightIs((SCREEN_WIDTH - 93) / 3 * coutent + (coutent - 1) * 6 + 30);
    
    _locationButton.sd_layout.leftSpaceToView(_headerView, 66)
    .topSpaceToView(_collectionView, 12)
    .rightSpaceToView(_headerView, 15)
    .heightIs(13);
    
    _thumbButton.sd_layout.leftSpaceToView(_headerView, 66)
    .topSpaceToView(_locationButton, 24)
    .widthIs(60)
    .heightIs(16);
    
    _commentsButton.sd_layout.leftSpaceToView(_thumbButton, 24)
    .topSpaceToView(_locationButton, 24)
    .widthIs(60)
    .heightIs(16);
    
    _lineView.sd_layout.leftEqualToView(_headerView)
    .rightEqualToView(_headerView)
    .topSpaceToView(_thumbButton, 18)
    .heightIs(12);
    
    _commentsLabel.sd_layout.leftSpaceToView(_headerView, 15)
    .topSpaceToView(_lineView, 12)
    .autoWidthRatio(100)
    .heightIs(15);
    
    _greenView.sd_layout.leftSpaceToView(_headerView, 15)
    .topSpaceToView(_commentsLabel, 8)
    .widthIs(90)
    .heightIs(1);
    
    _view1.sd_layout.leftSpaceToView(_greenView, 0)
    .topSpaceToView(_commentsLabel, 8)
    .rightEqualToView(_headerView)
    .heightIs(1);
}

-(void)changePosition
{
    NSInteger coutent = ceil(self.imageArray.count / 3.0);
    _collectionView.sd_layout.leftSpaceToView(self.headerView, 66)
    .topSpaceToView(_contentLabel, 12)
    .rightSpaceToView(self.headerView, 15)
    .heightIs((SCREEN_WIDTH - 93) / 3 * coutent + (coutent - 1) * 6);
}

-(void)setTableView:(UITableView *)tableView
{
    _tableView = tableView;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tableFooterView = [UIView new];
    if (@available(iOS 11.0, *)) {
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
    }
    else
    {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.currentPage = 1;
        [self communityLifeDetailsCommentList];
    }];
    _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        self.currentPage ++;
        [self communityLifeDetailsCommentList];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWithHeaderView];
    [self communityLifeDetails];
    if (self.detailsType == CommunityLifeDetailsTypeMyMessage) {
        [self oneComment];
        self.textField.placeholder = [NSString stringWithFormat:@"回复%@", self.messageModel.nickName];
        self.tableView.mj_header = nil;
        self.tableView.mj_footer = nil;
    }
    else
    {
        [self communityLifeDetailsCommentList];
        self.textField.placeholder = @"发布评论";
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    IWantReleaseCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([IWantReleaseCollectionViewCell class]) forIndexPath:indexPath];
    CommunityLifeDetailsPhoto * model = self.imageArray[indexPath.row];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.url]];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray * viewsArray = [NSMutableArray array];
    NSMutableArray * imagesArray = [NSMutableArray array];
    for (int index = 0; index < _imageArray.count; index ++) {
        NSIndexPath * path = [NSIndexPath indexPathForItem:index inSection:0];
        CommunityLifeListPhoto * model = _imageArray[index];
        IWantReleaseCollectionViewCell *cell = (IWantReleaseCollectionViewCell*)[collectionView cellForItemAtIndexPath:path];
        [viewsArray addObject:cell.imageView];
        [imagesArray addObject:model.url];
    }
    [self showImageWithPhotoURLsArray:imagesArray startIndex:indexPath.item fromViews:viewsArray];
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommunityLifeDetailsTableViewCell * cell = [CommunityLifeDetailsTableViewCell cellForTableView:tableView];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView cellHeightForIndexPath:indexPath cellContentViewWidth:SCREEN_WIDTH tableView:tableView];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 229 +[self harvestSiteLabelHeight:self.contentLabel.text width:SCREEN_WIDTH - 81] + self.collectionView.height;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

//点赞
-(void)thumbButtonClick:(QMUIButton *)sender
{
    if (sender.selected) {
        [self cancelPraiseWithID:self.kid];
    }
    else
    {
        [self addPraiseWithID:self.kid];
    }
}

- (IBAction)moreButtonClick:(id)sender {
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

#pragma mark - ShareMenuViewDelegate
-(void)shareButtonWithTitle:(NSString *)title
{
    if ([title isEqualToString:@"朋友圈"]) {
        [self shareWithImage:[UIImage imageNamed:@"icon_bg"] Title:@"智慧沈阳新社区" content:self.contentLabel.text url:shareUrl SSDKPlatformType:SSDKPlatformSubTypeWechatTimeline];
    }
    if ([title isEqualToString:@"微信好友"]) {
        [self shareWithImage:[UIImage imageNamed:@"icon_bg"] Title:@"智慧沈阳新社区" content:self.contentLabel.text url:shareUrl SSDKPlatformType:SSDKPlatformSubTypeWechatSession];
    }
    if ([title isEqualToString:@"QQ好友"]) {
        [self shareWithImage:[UIImage imageNamed:@"icon_bg"] Title:@"智慧沈阳新社区" content:self.contentLabel.text url:shareUrl SSDKPlatformType:SSDKPlatformSubTypeQQFriend];
    }
    if ([title isEqualToString:@"举报"]) {
        [self communityReport];
    }
    if ([title isEqualToString:@"删除"]) {
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil message:@"确定删除吗？" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * enterAction = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
             [self deleteLife];
        }];
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:enterAction];
        [alert addAction:cancelAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

#pragma mark - QDKeyboardCustomViewControllerDelegate
-(void)publishButtonClickWithText:(NSString *)text
{
    if (text.length <= 0) {
        [self showMessage:@"内容不能为空"];
        return;
    }
    if (self.detailsType == CommunityLifeDetailsTypeMyMessage) {
        [self replyToCommentMessage:text];
    }
    else
    {
        [self communityLifeAddCommentWithText:text];
    }
}

-(CGFloat)harvestSiteLabelHeight:(NSString *)text width:(CGFloat)width
{
    CGRect rectToFit = [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil];
    return rectToFit.size.height;
}

@end

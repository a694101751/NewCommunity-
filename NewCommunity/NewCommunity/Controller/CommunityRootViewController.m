//
//  CommunityRootViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/23.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "CommunityRootViewController.h"
#import "IWantReleaseViewController.h"
#import "CommunityLifeViewController.h"
#import "TitleMenuView.h"
#import "CommunityShareTableViewCell.h"
#import "CommunityShareDetailsViewController.h"
#import "StayTunedViewController.h"
#import "CommunityServiceTableViewCell.h"
#import "CommunityServiceViewController.h"
#import "CommunityTopicViewController.h"
#import "CommunityServiceDetailsViewController.h"
#import "CommunityLifeTopTableViewCell.h"
#import "CommunityLifeDownTableViewCell.h"
#import "CommunityLifeCollectionTableViewCell.h"
#import "CommunityLifeDetailsViewController.h"
#import "CommunityLifeTableViewCell.h"
#import "PersonalInformationViewController.h"
#import "DetailsViewController.h"

static NSInteger kBaseTag = 400;

@interface CommunityRootViewController ()<UIScrollViewDelegate, TitleMenuViewDelegate, UITableViewDelegate, UITableViewDataSource, CommunityLifeTableViewCellDelegate, SDCycleScrollViewDelegate, CommunityLifeDetailsViewControllerDelegate>
{
    UIButton * currentSelectedButton;
}
@property (strong, nonatomic) UIScrollView *scrollView;
@property (nonatomic, strong)UIView * headerView;
@property (nonatomic, strong)SDCycleScrollView * sdCyScrollView;
@property (nonatomic, strong)UIButton * noticeButton;
@property (nonatomic, strong)TitleMenuView * titleMenuView;
@property (nonatomic, strong)CommunityShareModel * shareModel;
@property (nonatomic, strong)UIButton *loginButton;
//共享Array
@property (nonatomic, strong)NSArray * shareArray;
@property (nonatomic, strong)NSArray * shareImageArray;
//服务Array
@property (nonatomic, strong)NSMutableArray * serviceArray;
//生活Array
@property (nonatomic, strong)NSMutableArray * lifeArray;
@property (nonatomic, strong)NSMutableArray * imageArray;
@property (nonatomic, strong)NSArray * lifeDataArray;

// 记录scrollView.contentInset.top
@property (nonatomic, assign)CGFloat marginTop;
@property (nonatomic, assign)CGFloat oldOffset;

@property (nonatomic, strong)UIView * backView;
@property (nonatomic, strong)UILabel * sdcyLabel;
@property (nonatomic, strong)NSMutableArray * sdcyTitleArray;
@end

@interface CommunityRootViewController (network)
@end

@implementation CommunityRootViewController (network)
//社区共享
-(void)communityShare
{
    [NewCommunityBLL communityShareandshowHUDInView:self.view resultPostsWithBlock:^(CommunityShareModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                self.shareModel = model;
                self.shareImageArray = model.data.postList;
                for (CommunityShareAdvList * advModel in model.data.advList) {
                    [self.imageArray addObject:advModel.thumb];
                }
                self.sdCyScrollView.imageURLStringsGroup = self.imageArray;
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
        UITableView * tableView = [(UITableView *)self.scrollView viewWithTag:kBaseTag + 2];
        [tableView reloadData];
    }];
}
//社区生活
-(void)communityLife
{
    [NewCommunityBLL communityLifeandshowHUDInView:self.view resultPostsWithBlock:^(CommunityLifeModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                [self.lifeArray removeAllObjects];
                [self.imageArray removeAllObjects];
                [self.lifeArray addObjectsFromArray:model.data.postList];
                for (CommunityLifeAdvList * advModel in model.data.advList) {
                    [self.imageArray addObject:advModel.thumb];
                    NSDictionary * dic = @{@"kTitle":advModel.title, @"kID":advModel.objectId};
                    [self.sdcyTitleArray addObject:dic];
                }
                self.sdCyScrollView.imageURLStringsGroup = self.imageArray;
                [self.noticeButton setTitle:model.notice forState:UIControlStateNormal];
                NSDictionary * dic = self.sdcyTitleArray[0];
                self.sdcyLabel.text = dic[@"kTitle"];
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
        UITableView * tableView = [(UITableView *)self.scrollView viewWithTag:kBaseTag];
        [tableView.mj_header endRefreshing];
        [tableView reloadData];
    }];
}
//社区服务
-(void)communityService
{
    [NewCommunityBLL communityServiceandshowHUDInView:self.view resultPostsWithBlock:^(CommunityServiceModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                self.serviceArray = [NSMutableArray arrayWithArray:@[@[@"社区超市"]]];
                [self.serviceArray addObject:model.data.postList];
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
        UITableView * tableView = [(UITableView *)self.scrollView viewWithTag:kBaseTag + 1];
        [tableView.mj_header endRefreshing];
        [tableView reloadData];
    }];
}

//社区生活 点赞
-(void)addPraiseWithModel:(CommunityLifeListPage *)dataModel indexPath:(NSIndexPath *)indexPath
{
    [NewCommunityBLL communityPraiseLifeId:dataModel.idField andshowHUDInView:self.view resultPostsWithBlock:^(ModifyInformationModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                dataModel.praiseState = YES;
                NSInteger count = [dataModel.praiseSum integerValue];
                count ++;
                dataModel.praiseSum = [NSString stringWithFormat:@"%ld", count];
                [self.lifeArray replaceObjectAtIndex:indexPath.row withObject:dataModel];
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
        UITableView * tableView = (UITableView *)[self.scrollView viewWithTag:kBaseTag];
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
    }];
}
//社区生活取消点赞
-(void)cancelPraiseWithModel:(CommunityLifeListPage *)dataModel ndexPath:(NSIndexPath *)indexPath
{
    [NewCommunityBLL communityCancelPraiseLifeId:dataModel.idField andshowHUDInView:self.view resultPostsWithBlock:^(ModifyInformationModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                dataModel.praiseState = NO;
                NSInteger count = [dataModel.praiseSum integerValue];
                count --;
                dataModel.praiseSum = [NSString stringWithFormat:@"%ld", count];
                [self.lifeArray replaceObjectAtIndex:indexPath.row withObject:dataModel];
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
        UITableView * tableView = (UITableView *)[self.scrollView viewWithTag:kBaseTag];
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
    }];
}

@end

@implementation CommunityRootViewController

-(NSMutableArray *)sdcyTitleArray
{
    if (!_sdcyTitleArray) {
        _sdcyTitleArray = [NSMutableArray array];
    }
    return _sdcyTitleArray;
}

-(NSMutableArray *)imageArray
{
    if (!_imageArray) {
        _imageArray = [NSMutableArray array];
    }
    return _imageArray;
}

-(NSMutableArray *)serviceArray
{
    if (!_serviceArray) {
        _serviceArray = [NSMutableArray arrayWithObject:@[@"社区超市"]];
    }
    return _serviceArray;
}

-(NSMutableArray *)lifeArray
{
    if (!_lifeArray) {
        _lifeArray = [NSMutableArray array];
    }
    return _lifeArray;
}

-(void)headerViewWithTag:(NSInteger)tag
{
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH / 1.367)];
    _headerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_headerView];
    
    _scrollView = [[UIScrollView alloc]init];
     _scrollView.frame = CGRectMake(0, CGRectGetMaxY(_headerView.frame) + 1, SCREEN_WIDTH, SCREEN_HEIGHT - SCREEN_WIDTH / 1.367 - tabbarHeight - statusBarAndNavigationBarHeight);
    _scrollView.backgroundColor = [UIColor clearColor];
    _scrollView.bounces = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_scrollView];
    
    self.oldOffset = 0;
    
    NSArray * titleArray = @[@"社区生活", @"社区服务"];
    
    for (int i = 0; i < titleArray.count; i ++) {
        UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectMake(i * SCREEN_WIDTH, 0, SCREEN_WIDTH, _scrollView.height) style:UITableViewStyleGrouped];
        tableView.backgroundColor = [UIColor clearColor];
        tableView.tag = kBaseTag + i;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.showsVerticalScrollIndicator = NO;
        [_scrollView addSubview:tableView];
        tableView.sd_layout.leftSpaceToView(_scrollView, i * SCREEN_WIDTH)
        .widthIs(SCREEN_WIDTH)
        .topEqualToView(_scrollView)
        .bottomEqualToView(_scrollView);
        if (i != 2) {
            tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
                if (i == 0) {
                    [self communityLife];
                }
                else
                {
                    [self communityService];
                }
            }];
        }
        if (@available(iOS 11.0, *)) {
            tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            tableView.estimatedRowHeight = 0;
            tableView.estimatedSectionHeaderHeight = 0;
            tableView.estimatedSectionFooterHeight = 0;
        }
        else
        {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * titleArray.count, 0);
    
    _sdCyScrollView = [[SDCycleScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH / 2.038)];
    _sdCyScrollView.autoScrollTimeInterval = 3.0f;
    _sdCyScrollView.delegate = self;
    _sdCyScrollView.pageControlDotSize = CGSizeMake(3, 3);
    _sdCyScrollView.pageControlRightOffset = 15;
    _sdCyScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    [_headerView addSubview:_sdCyScrollView];
    
    _backView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_sdCyScrollView.frame) - 30, SCREEN_WIDTH, 30)];
    _backView.backgroundColor = [UIColor blackColor];
    _backView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.6];
    [_sdCyScrollView addSubview:_backView];
    _sdcyLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH - 50, 30)];
    _sdcyLabel.font = Define_SystemIphone6Font14;
    _sdcyLabel.textColor = [UIColor whiteColor];
    [_backView addSubview:_sdcyLabel];
    
    UIView * greenLineView = [[UIView alloc]init];
    greenLineView.backgroundColor = getColor(@"efefef");
    [_headerView addSubview:greenLineView];
    
    UILabel * noticeLabel = [[UILabel alloc]init];
    noticeLabel.text = @"通知";
    noticeLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    noticeLabel.textAlignment = NSTextAlignmentCenter;
    noticeLabel.textColor = [UIColor whiteColor];
    noticeLabel.backgroundColor = getColor(@"34c789");
    [_headerView addSubview:noticeLabel];
    
    _noticeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_noticeButton setTitleColor:getColor(@"666666") forState:UIControlStateNormal];
    [self.noticeButton setTitle:self.shareModel.notice forState:UIControlStateNormal];
    _noticeButton.titleLabel.font = Define_SystemIphone6Font14;
    [_noticeButton addTarget:self action:@selector(noticeButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [_headerView addSubview:_noticeButton];
    
    UIView * lineView = [[UIView alloc]init];
    lineView.backgroundColor = getColor(@"efefef");
    [_headerView addSubview:lineView];
    
    noticeLabel.sd_layout.leftSpaceToView(_headerView, 15)
    .topSpaceToView(_sdCyScrollView, 9)
    .widthIs(38)
    .heightIs(21);
    
    greenLineView.sd_layout.leftSpaceToView(noticeLabel, 15)
    .topSpaceToView(_sdCyScrollView, 6)
    .widthIs(1)
    .heightIs(26);
    
    _noticeButton.sd_layout.leftSpaceToView(greenLineView, 15)
    .topSpaceToView(_sdCyScrollView, 9)
    .rightSpaceToView(_headerView, 15)
    .heightIs(20);
    
    lineView.sd_layout.leftSpaceToView(_headerView, 0)
    .topSpaceToView(_noticeButton, 9)
    .rightSpaceToView(_headerView, 0)
    .heightIs(13);
    
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * titleArray.count, 0);
    _titleMenuView = [[TitleMenuView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40) titles:titleArray];
    _titleMenuView.backgroundColor = [UIColor clearColor];
    _titleMenuView.delegate = self;
    [_headerView addSubview:_titleMenuView];
    
    UIButton * button = [_titleMenuView viewWithTag:tag];
    [self buttonClick:button];
    
    self.titleMenuView.indicatorView.center = CGPointMake(button.center.x, self.titleMenuView.indicatorView.center.y);
    
    _titleMenuView.sd_layout.leftEqualToView(_headerView)
    .rightEqualToView(_headerView)
    .topSpaceToView(lineView, 0)
    .heightIs(40);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self headerViewWithTag:200];
    
    _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_loginButton setFrame:CGRectMake(0, 0, SCALE(28), SCALE(28))];
    [_loginButton sd_setImageWithURL:[NSURL URLWithString:[User sharedInstanced].ATP_avatar] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"login_default_bg"]];
    _loginButton.layer.cornerRadius = _loginButton.height / 2;
    _loginButton.layer.masksToBounds = YES;
    [_loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    UIView * containView = [[UIView alloc]initWithFrame:_loginButton.bounds];
    [containView addSubview:_loginButton];
    UIBarButtonItem * loginItem = [[UIBarButtonItem alloc] initWithCustomView:containView];
    self.navigationItem.leftBarButtonItem = loginItem;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginSuccess:) name:@"loginSuccess" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(iWantRelease:) name:@"iWantRelease" object:nil];
    
    [self communityLife];
    _shareArray = @[@"社区食堂", @"社区球场"];
    _lifeDataArray = @[@"#生活杂谈#", @"#突发爆料#", @"#二手闲置#", @"#车位租售#", @"#咨询求助#"];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}

-(void)iWantRelease:(NSNotification *)noti
{
    UITableView * tableView = [(UITableView *)self.scrollView viewWithTag:kBaseTag];
    [tableView.mj_header beginRefreshing];
}

-(void)loginSuccess:(NSNotification *)noti
{
    [_loginButton sd_setImageWithURL:[NSURL URLWithString:[User sharedInstanced].ATP_avatar] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"login_default_bg"]];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"loginSuccess" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView.tag == kBaseTag) {
        return 2;
    }
    if (tableView.tag == kBaseTag + 1) {
        return self.serviceArray.count;
    }
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == kBaseTag + 2) {
        if (section == 0) {
            return 2;
        }
        return self.shareImageArray.count;
    }
    if (tableView.tag == kBaseTag + 1) {
//        if (section == 0) {
            return 1;
//        }
//        return [self.serviceArray[section] count];
    }
    if (section == 0) {
        return 1;
    }
    return [self.lifeArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    if (tableView.tag == kBaseTag + 2) {
        CommunityShareTableViewCell * cell = [CommunityShareTableViewCell cellForTableView:tableView];
        if (indexPath.section == 0) {
//            cell.titleLabel.text = _shareArray[indexPath.row];
            cell.headerImageView.image = [UIImage imageNamed:_shareArray[indexPath.row]];
        }
        else
        {
            CommunitySharePostList * model = self.shareImageArray[indexPath.row];
            [cell.headerImageView sd_setImageWithURL:[NSURL URLWithString:model.thumb]];
        }
        
        return cell;
    }
    if (tableView.tag == kBaseTag + 1) {
        if (indexPath.section == 0) {
            CommunityShareTableViewCell * cell = [CommunityShareTableViewCell cellForTableView:tableView];
            cell.titleLabel.text = self.serviceArray[indexPath.section][indexPath.row];
            cell.headerImageView.image = [UIImage imageNamed:_serviceArray[indexPath.section][indexPath.row]];
            return cell;
        }
        CommunityServiceTableViewCell * cell = [CommunityServiceTableViewCell cellForTableView:tableView];
        cell.array = self.serviceArray[indexPath.section];
        return cell;
    }
    if (indexPath.section == 0) {
        CommunityLifeTopTableViewCell * cell = [CommunityLifeTopTableViewCell cellForTableView:tableView];
        cell.dataArray = self.lifeDataArray;
        cell.block = ^(NSInteger index) {
            [self pushCommenityLifeType:index];
        };
        return cell;
    }
    CommunityLifeTableViewCell * cell = [CommunityLifeTableViewCell cellForTableView:tableView];
    cell.model = self.lifeArray[indexPath.row];
    cell.delegate = self;
    cell.block = ^(NSArray * photoUrlsArray, NSInteger startIndex, NSArray * views)
    {
        [self showImageWithPhotoURLsArray:photoUrlsArray startIndex:startIndex fromViews:views];
    };
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == kBaseTag + 2) {
        return (SCREEN_WIDTH - 30) / 1.778 + 15;
    }
    if (tableView.tag == kBaseTag + 1) {
        if (indexPath.section == 0) {
            return (SCREEN_WIDTH - 30) / 1.778 + 15;
        }
        NSInteger count = ceil([self.serviceArray[indexPath.section] count] / 2.0);
        return 100 * count + (count - 1) * 5 + 28;
    }
    if (indexPath.section == 0) {
        return (SCREEN_WIDTH - 85) / 2 / 1.8125 + 20;
    }
    return [tableView cellHeightForIndexPath:indexPath cellContentViewWidth:SCREEN_WIDTH tableView:tableView];
//    if (self.lifeArray.count > 0) {
//        NSArray * array = self.lifeArray[indexPath.section];
//        NSInteger count = ceil(array.count / 2.0);
//        if (count <= 0) {
//            return 16;
//        }
//        return 167 * count + 16 * (count - 1);
//    }
    return 167;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        if (tableView.tag == kBaseTag) {
            return 0.1;
        }
        return 43;
    }
    return 0.1;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (tableView.tag == kBaseTag + 2) {
        if (section == 1) {
            UILabel *label = [[UILabel alloc] init];
            label.frame = CGRectMake(15, 0, SCREEN_WIDTH, 43);
            label.backgroundColor = [UIColor whiteColor];
            label.text = @"   互联网家";
            label.font = [UIFont fontWithName:@"PingFangSC-Medium" size:16];
            label.textColor = [UIColor colorWithRed:88/255.0 green:79/255.0 blue:96/255.0 alpha:1/1.0];
            return label;
        }
    }
    if (tableView.tag == kBaseTag + 1) {
        if (section == 1) {
            UIView * view = [[UIView alloc]init];
            view.backgroundColor = [UIColor whiteColor];
            
            UILabel *label = [[UILabel alloc] init];
            label.frame = CGRectMake(15, 0, SCREEN_WIDTH, 43);
            label.backgroundColor = [UIColor whiteColor];
            label.text = @"社区话题";
            label.font = [UIFont fontWithName:@"PingFangSC-Medium" size:16];
            label.textColor = [UIColor colorWithRed:88/255.0 green:79/255.0 blue:96/255.0 alpha:1/1.0];
            [view addSubview:label];
            
            QMUIButton * button = [QMUIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:@"更多" forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"right_bg"] forState:UIControlStateNormal];
            [button setTitleColor:getColor(@"999999") forState:UIControlStateNormal];
            button.titleLabel.font = Define_SystemIphone6Font14;
            button.imagePosition = QMUIButtonImagePositionRight;
            button.spacingBetweenImageAndTitle = 4;
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
            [button addTarget:self action:@selector(topicMoreButtonClick) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:button];
            
            button.sd_layout.rightSpaceToView(view, 15)
            .topSpaceToView(view, 0)
            .heightIs(43)
            .widthIs(100);
            
            return view;
        }
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (tableView.tag == kBaseTag) {
        if (section == 1) {
            return 84;
        }
    }
    return 0.1;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (tableView.tag == kBaseTag) {
        if (section == 1) {
            UIView * view = [[UIView alloc]init];
            view.backgroundColor = [UIColor whiteColor];
            
            UIButton * releaseButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [releaseButton setTitle:@"我要发布" forState:UIControlStateNormal];
            [releaseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            releaseButton.titleLabel.font = Define_SystemIphone6Font16;
            releaseButton.backgroundColor = getColor(@"24c789");
            [releaseButton addTarget:self action:@selector(releaseButtonClick) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:releaseButton];
            releaseButton.sd_layout.leftSpaceToView(view, 15)
            .widthIs((SCREEN_WIDTH - 43) / 2)
            .topSpaceToView(view, 10)
            .heightIs(48);
            
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:@"查看更多" forState:UIControlStateNormal];
            [button setTitleColor:getColor(@"24c789") forState:UIControlStateNormal];
            button.titleLabel.font = Define_SystemIphone6Font16;
            button.backgroundColor = getColor(@"ffffff");
            button.layer.borderWidth = 1;
            button.layer.borderColor = getColor(@"24c789").CGColor;
            [button addTarget:self action:@selector(lifeMoreButtonClick) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:button];
            button.sd_layout.leftSpaceToView(releaseButton, 13)
            .widthIs((SCREEN_WIDTH - 43) / 2)
            .topSpaceToView(view, 10)
            .heightIs(48);
            return view;
        }
    }
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == kBaseTag + 2) {
        if (indexPath.section == 0) {
            StayTunedViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([StayTunedViewController class])];
            VC.hidesBottomBarWhenPushed = YES;
            VC.imageString = @"stayTunedFor_bg";
            VC.title = _shareArray[indexPath.row];
            [self.navigationController pushViewController:VC animated:YES];
        }
        else
        {
            CommunityShareTableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
            CommunitySharePostList * model = self.shareImageArray[indexPath.row];
            [self showImageWithImageURL:model.thumb fromView:cell.headerImageView];
        }
    }
    if (tableView.tag == kBaseTag + 1) {
        if (indexPath.section == 0) {
            StayTunedViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([StayTunedViewController class])];
            VC.hidesBottomBarWhenPushed = YES;
            VC.imageString = @"communitySupermarket_bg";
            VC.title = _serviceArray[indexPath.section][indexPath.row];
            [self.navigationController pushViewController:VC animated:YES];
        }
    }
    if (tableView.tag == kBaseTag) {
        if (indexPath.section == 1) {
            CommunityLifePostList * model = self.lifeArray[indexPath.row];
            [self pushCommunityLifeDetailsWithModel:model.idField indexPath:indexPath];
        }
    }
}

#pragma mark - CommunityLifeTableViewCellDelegate
-(void)thumbButtonSelected:(QMUIButton *)sender WithCell:(CommunityLifeTableViewCell *)cell
{
    UITableView * tableView = (UITableView *)[self.scrollView viewWithTag:kBaseTag];
    NSIndexPath * indexPath = [tableView indexPathForCell:cell];
    CommunityLifeListPage * model;
    if (tableView.tag == kBaseTag) {
        model = self.lifeArray[indexPath.row];
    }
    if (sender.selected) {
        [self cancelPraiseWithModel:model ndexPath:indexPath];
    }
    else
    {
        [self addPraiseWithModel:model indexPath:indexPath];
    }
}

#pragma mark - CommunityLifeDetailsViewControllerDelegate
-(void)praiseWithState:(BOOL)state indexPath:(NSIndexPath *)indexPath
{
    UITableView * tableView = (UITableView *)[self.scrollView viewWithTag:kBaseTag];
    CommunityLifeListPage * dataModel;
    if (tableView.tag == kBaseTag) {
        dataModel = self.lifeArray[indexPath.row];
    }
    if (state) {
        dataModel.praiseState = YES;
        NSInteger count = [dataModel.praiseSum integerValue];
        count ++;
        dataModel.praiseSum = [NSString stringWithFormat:@"%ld", count];
        [self.lifeArray replaceObjectAtIndex:indexPath.section withObject:dataModel];
    }
    else
    {
        dataModel.praiseState = NO;
        NSInteger count = [dataModel.praiseSum integerValue];
        count --;
        dataModel.praiseSum = [NSString stringWithFormat:@"%ld", count];
        [self.lifeArray replaceObjectAtIndex:indexPath.section withObject:dataModel];
    }
    
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
}

-(void)commentsWithCount:(NSInteger)count indexPath:(NSIndexPath *)indexPath
{
    UITableView * tableView = (UITableView *)[self.scrollView viewWithTag:kBaseTag];
    CommunityLifeListPage * dataModel;
    if (tableView.tag == kBaseTag) {
        dataModel = self.lifeArray[indexPath.row];
    }
    dataModel.commentSum = [NSString stringWithFormat:@"%ld", count];
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
}

#pragma mark - SDCycleScrollViewDelegate
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSDictionary * dic = self.sdcyTitleArray[index];
    DetailsViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([DetailsViewController class])];
    VC.kid = [dic[@"kID"] integerValue];
    VC.isCommunity = YES;
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:VC animated:YES];
}

/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index
{
    NSDictionary * dic = self.sdcyTitleArray[index];
    self.sdcyLabel.text = dic[@"kTitle"];
}

#pragma mark - TitleMenuViewDelegate
-(void)buttonClick:(UIButton *)button
{
    [self resetIndicatorViewFrameWithButton:button animation:YES];
}

//点击一个按钮其他按钮为非选中状态和collectionView页面联动方法
-(void)resetIndicatorViewFrameWithButton:(UIButton *)button animation:(BOOL)isAnimation
{
    if (currentSelectedButton)
    {
        currentSelectedButton.selected = NO;
    }
    
    currentSelectedButton = button;
    currentSelectedButton.selected = YES;
    
    if (isAnimation)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:[UIApplication sharedApplication].statusBarOrientationAnimationDuration animations:^{
                self.titleMenuView.indicatorView.center = CGPointMake(button.center.x, self.titleMenuView.indicatorView.center.y);
            }];
        });
    }
    else
    {
        self.titleMenuView.indicatorView.center = CGPointMake(button.center.x, self.titleMenuView.indicatorView.center.y);
    }
    [self resetCollectionViewContentOffsetWithIndex:button.tag - 200];
}

- (void) resetCollectionViewContentOffsetWithIndex:(NSInteger)index{
    if (index == 2) {
        if (self.shareImageArray.count <= 0) {
//            [self communityShare];
        }
    }
    if (index == 1) {
        if (self.serviceArray.count <= 1) {
            [self communityService];
        }
    }
    [self.scrollView setContentOffset:CGPointMake(index * SCREEN_WIDTH, 0)animated:YES];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if ([scrollView isKindOfClass:[UITableView class]]) {
        
        return;
    }
    NSInteger currentIndex = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    UIButton *button = (UIButton*)[self.titleMenuView viewWithTag:200 + currentIndex];
    [self resetIndicatorViewFrameWithButton:button animation:YES];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.scrollView) {
        return;
    }
    if (self.marginTop != scrollView.contentInset.top) {
        self.marginTop = scrollView.contentInset.top;
    }
    
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat newoffsetY = offsetY + self.marginTop;
    if (newoffsetY == 0) {
        return;
    }
    // 临界值150，向上拖动时变透明
    if (newoffsetY > 0) {
        NSLog(@"上");
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.5 animations:^{
                self.headerView.frame = CGRectMake(0, -(SCREEN_WIDTH / 1.367 - 40), SCREEN_WIDTH, SCREEN_WIDTH / 1.367);
                self.scrollView.frame = CGRectMake(0, 41, SCREEN_WIDTH, SCREEN_HEIGHT - 41 - tabbarHeight - statusBarAndNavigationBarHeight);
            }];
        });
        self.oldOffset = newoffsetY;
        
    }else if(newoffsetY < self.oldOffset){
        NSLog(@"下");
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.75 animations:^{
                self.headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH / 1.367);
                self.scrollView.frame = CGRectMake(0, CGRectGetMaxY(self.headerView.frame) + 1, SCREEN_WIDTH, SCREEN_HEIGHT - 41 - tabbarHeight - statusBarAndNavigationBarHeight);
            }];
        });
    }
}

//通知按钮
-(void)noticeButtonClick
{
    CommunityShareDetailsViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CommunityShareDetailsViewController class])];
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:VC animated:YES];
}
//话题更多
-(void)topicMoreButtonClick
{
    CommunityTopicViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CommunityTopicViewController class])];
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:VC animated:YES];
}
//我要发布
-(void)releaseButtonClick
{
    UINavigationController * nav = [self.storyboard instantiateViewControllerWithIdentifier:@"IWantReleaseNav"];
    [self presentViewController:nav animated:YES completion:nil];
}
//社区生活 更多
-(void)lifeMoreButtonClick
{
    [self pushCommenityLifeType:-1];
}

//跳转到发帖列表
- (void)pushCommenityLifeType:(NSInteger)lifeType {
    CommunityLifeViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CommunityLifeViewController class])];
    VC.lifeType = lifeType;
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:VC animated:YES];
}
//跳转到详情
-(void)pushCommunityLifeDetailsWithModel:(NSString *)kid indexPath:(NSIndexPath *)indexPath;
{
    CommunityLifeDetailsViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CommunityLifeDetailsViewController class])];
    VC.hidesBottomBarWhenPushed = YES;
    VC.delegate = self;
    VC.indexPath = indexPath;
    VC.kid = kid;
    [self.navigationController pushViewController:VC animated:YES];
}
//左上角登录
-(void)loginButtonClick
{
    PersonalInformationViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([PersonalInformationViewController class])];
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:VC animated:YES];
}

@end

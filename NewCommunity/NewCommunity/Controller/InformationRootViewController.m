//
//  InformationRootViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/20.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "InformationRootViewController.h"
#import "InformationRootTableViewCell.h"
#import "InformationRootBigTableViewCell.h"
#import "InformationRootMoreTableViewCell.h"
#import "SearchViewController.h"
#import "DetailsViewController.h"
#import "EventDetailsViewController.h"
#import "TitleMenuView.h"
#import "InformationActivitiesTableViewCell.h"
#import "ProjectDetailsViewController.h"
#import "PersonalInformationViewController.h"

static const NSInteger kBaseTag = 200;
static const NSInteger kSdTag = 300;
static const NSInteger kBaseViewTag = 400;

@interface InformationRootViewController ()<TitleMenuViewDelegate, UITableViewDelegate, UITableViewDataSource, SDCycleScrollViewDelegate>
{
    UIButton * currentSelectedButton;
}
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (nonatomic, strong)SDCycleScrollView * sdCycleScrollView;

@property (nonatomic, strong)TitleMenuView * titleMenuView;
@property (nonatomic, strong)NSArray * titleArray;
@property (nonatomic, strong)NSArray * dataArray;
@property (nonatomic, assign)NSInteger scrollCurrent;
@property (nonatomic, strong)UIButton *loginButton;

@property (nonatomic, strong)NSMutableArray * newsArray;
@property (nonatomic, strong)NSMutableArray * communityArray;
@property (nonatomic, strong)NSMutableArray * activityArray;
@property (nonatomic, strong)NSMutableArray * projectArray;
@property (nonatomic, strong)InformationRootListData * dataModel;
@property (nonatomic, strong)InformationActivitiesData * activiModel;
@property (nonatomic, strong)InformationRootIstop * topModel;
@property (nonatomic, assign)NSInteger currentPage;

@property (nonatomic, strong)UIView * backView;
@property (nonatomic, strong)UILabel * sdcyLabel;
@property (nonatomic, strong)NSMutableArray * newsTitleArray;
@property (nonatomic, strong)NSMutableArray * communityTitleArray;

@property (nonatomic, strong)UITextField * searchTextFiled;

-(void)setContentWithArray:(NSMutableArray *)array array:(NSArray *)contentArray;
@end

@interface InformationRootViewController (network)
@end

@implementation InformationRootViewController (network)
//资讯要闻轮播图
-(void)InformationRoot
{
    [NewCommunityBLL importantandshowHUDInView:nil resultPostsWithBlock:^(InformationRootModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                SDCycleScrollView * scrollerView = [self.scrollView viewWithTag:kSdTag];
                if (model.data.istop.count > 0) {
                    self.topModel = model.data.istop[0];
                }
                NSMutableArray * urlArray = [NSMutableArray array];
                for (InformationRootAdvList * advModel in model.data.advList) {
                    [urlArray addObject:advModel.thumb];
                    NSDictionary * dic = @{@"kTitle":advModel.title, @"kID":advModel.objectId};
                    [self.newsTitleArray addObject:dic];
                }
                scrollerView.imageURLStringsGroup = urlArray;
                UILabel * label = [scrollerView viewWithTag:kBaseViewTag + self.scrollCurrent];
                NSDictionary * dic = self.newsTitleArray[0];
                label.text = dic[@"kTitle"];
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
//资讯 - 要闻列表
-(void)InformationRootNext
{
    [NewCommunityBLL importantListPage:self.currentPage rows:20 andshowHUDInView:self.view resultPostsWithBlock:^(InformationRootListModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                if (self.currentPage == 1) {
                    [self.newsArray removeAllObjects];
                }
                self.dataModel = model.data;
                [self setContentWithArray:self.newsArray array:model.data.post];
                if (self.topModel) {
                    if (![self.newsArray containsObject:self.topModel]) {
                        [self.newsArray insertObject:self.topModel atIndex:0];
                    }
                }
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
        UITableView *tableView = (UITableView*)[self.scrollView viewWithTag:kBaseTag];
        [tableView.mj_header endRefreshing];
        [tableView reloadData];
    }];
}
//资讯 - 社区轮播图
-(void)informationCommunityBanner
{
    [NewCommunityBLL informationCommunityBannerandshowHUDInView:nil resultPostsWithBlock:^(InformationRootModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                SDCycleScrollView * scrollerView = [self.scrollView viewWithTag:kSdTag + 1];
                NSMutableArray * urlArray = [NSMutableArray array];
                for (InformationRootAdvList * advModel in model.data.advList) {
                    [urlArray addObject:advModel.thumb];
                    NSDictionary * dic = @{@"kTitle":advModel.title, @"kID":advModel.objectId};
                    [self.communityTitleArray addObject:dic];
                }
                scrollerView.imageURLStringsGroup = urlArray;
                UILabel * label = [scrollerView viewWithTag:kBaseViewTag + self.scrollCurrent];
                NSDictionary * dic = self.communityTitleArray[0];
                label.text = dic[@"kTitle"];
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
//资讯 - 社区列表
-(void)informationCommunity
{
    [NewCommunityBLL informationCommunityPage:self.currentPage rows:20 andshowHUDInView:self.view resultPostsWithBlock:^(InformationRootListModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                if (self.currentPage == 1) {
                    [self.communityArray removeAllObjects];
                }
                self.dataModel = model.data;
                [self setContentWithArray:self.communityArray array:model.data.post];
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
        UITableView *tableView = (UITableView*)[self.scrollView viewWithTag:kBaseTag + 1];
        [tableView.mj_header endRefreshing];
        [tableView reloadData];
    }];
}
// 资讯 - 专题轮播图
-(void)informationProjectBanner
{
    [NewCommunityBLL informationProjectBannerandshowHUDInView:nil resultPostsWithBlock:^(InformationRootModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                SDCycleScrollView * scrollerView = [self.scrollView viewWithTag:kSdTag + 3];
                NSMutableArray * urlArray = [NSMutableArray array];
                for (InformationRootAdvList * advModel in model.data.advList) {
                    [urlArray addObject:advModel.thumb];
                }
                scrollerView.imageURLStringsGroup = urlArray;
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
// 资讯 - 专题列表
-(void)informationProject
{
    [NewCommunityBLL informationProjectPage:self.currentPage rows:20 andshowHUDInView:self.view resultPostsWithBlock:^(InformationRootListModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                if (self.currentPage == 1) {
                    [self.projectArray removeAllObjects];
                }
                self.dataModel = model.data;
                [self setContentWithArray:self.projectArray array:model.data.post];
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
        UITableView *tableView = (UITableView*)[self.scrollView viewWithTag:kBaseTag + 3];
        [tableView.mj_header endRefreshing];
        [tableView reloadData];
    }];
}
//资讯 - 活动
-(void)informationActivities
{
    [NewCommunityBLL informationActivitiesPage:self.currentPage andshowHUDInView:self.view resultPostsWithBlock:^(InformationActivitiesModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                if (self.currentPage == 1) {
                    [self.activityArray removeAllObjects];
                }
                self.activiModel = model.data;
                [self setContentWithArray:self.activityArray array:model.data.activityList];
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
        UITableView *tableView = (UITableView*)[self.scrollView viewWithTag:kBaseTag + 2];
        [tableView.mj_header endRefreshing];
        [tableView reloadData];
    }];
}

@end

@implementation InformationRootViewController

-(TitleMenuView *)titleMenuView
{
    if (!_titleMenuView) {
        _titleArray = @[@"要闻", @"社区", @"活动", @"专题"];
        
        _titleMenuView = [[TitleMenuView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 41) titles:_titleArray];
        _titleMenuView.backgroundColor = [UIColor clearColor];
        _titleMenuView.delegate = self;
    }
    return _titleMenuView;
}

-(NSMutableArray *)newsTitleArray
{
    if (!_newsTitleArray) {
        _newsTitleArray = [NSMutableArray array];
    }
    return _newsTitleArray;
}

-(NSMutableArray *)communityTitleArray
{
    if (!_communityTitleArray) {
        _communityTitleArray = [NSMutableArray array];
    }
    return _communityTitleArray;
}

-(NSMutableArray *)newsArray
{
    if (!_newsArray) {
        _newsArray = [NSMutableArray array];
    }
    return _newsArray;
}

-(NSMutableArray *)communityArray
{
    if (!_communityArray) {
        _communityArray = [NSMutableArray array];
    }
    return _communityArray;
}

-(NSMutableArray *)activityArray
{
    if (!_activityArray) {
        _activityArray = [NSMutableArray array];
    }
    return _activityArray;
}

-(NSMutableArray *)projectArray
{
    if (!_projectArray) {
        _projectArray = [NSMutableArray array];
    }
    return _projectArray;
}

-(void)setContentWithArray:(NSMutableArray *)array array:(NSArray *)contentArray
{
    [array addObjectsFromArray:contentArray];
}

-(void)setDataModel:(InformationRootListData *)dataModel
{
    _dataModel = dataModel;
    UITableView *tableView = (UITableView*)[self.scrollView viewWithTag:kBaseTag + self.scrollCurrent];
    NSInteger count = ceil([dataModel.total integerValue] / 20.0);
    if (self.currentPage == count) {
        [tableView.mj_footer endRefreshingWithNoMoreData];
        self.currentPage = count;
    }
    else
    {
        [tableView.mj_footer resetNoMoreData];
        [tableView.mj_footer endRefreshing];
    }
}

-(void)setActiviModel:(InformationActivitiesData *)activiModel
{
    _activiModel = activiModel;
    UITableView *tableView = (UITableView*)[self.scrollView viewWithTag:kBaseTag + self.scrollCurrent];
    NSInteger count = ceil([activiModel.total integerValue] / 20.0);
    if (self.currentPage == count) {
        [tableView.mj_footer endRefreshingWithNoMoreData];
        self.currentPage = count;
    }
    else
    {
        [tableView.mj_footer resetNoMoreData];
        [tableView.mj_footer endRefreshing];
    }
}

-(void)setScrollView:(UIScrollView *)scrollView
{
    _scrollView = scrollView;
    _scrollView.bounces = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollCurrent = 0;
    self.currentPage = 1;
    
    [self.titleView addSubview:self.titleMenuView];
    
    UIButton * btn = (UIButton *)[self.titleView viewWithTag:200];
    [self buttonClick:btn];
    [self initViews];
    [self createSearchView];
    
    _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_loginButton setFrame:CGRectMake(0, 0, SCALE(28), SCALE(28))];
    [_loginButton sd_setImageWithURL:[NSURL URLWithString:[User sharedInstanced].ATP_avatar] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"login_default_bg"]];
    [_loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    _loginButton.layer.cornerRadius = _loginButton.height / 2;
    _loginButton.layer.masksToBounds = YES;
    UIView * containView = [[UIView alloc]initWithFrame:_loginButton.bounds];
    [containView addSubview:_loginButton];
    
    UIBarButtonItem * loginItem = [[UIBarButtonItem alloc] initWithCustomView:containView];
    
    self.navigationItem.leftBarButtonItem = loginItem;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginSuccess:) name:@"loginSuccess" object:nil];
    
    [self InformationRoot];
    [self InformationRootNext];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(unreadMessageNoti:) name:@"unreadMessage" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addCommentsListNoti:) name:@"addCommentsList" object:nil];
    
    [[[[[self tabBarController] tabBar] items] objectAtIndex:3] setBadgeValue:[User sharedInstanced].unreadMessages.length > 0 ? [User sharedInstanced].unreadMessages : nil];
}

-(void)addCommentsListNoti:(NSNotification *)noti
{
    NSIndexPath * indexPath = [noti object];
    UITableView * tableView = (UITableView *)[self.scrollView viewWithTag:kBaseTag + self.scrollCurrent];
    InformationRootListPost * model;
    if (tableView.tag == kBaseTag) {
        model = self.newsArray[indexPath.row];
    }
    if (tableView.tag == kBaseTag + 1) {
        model = self.communityArray[indexPath.row];
    }
    model.comment = [NSString stringWithFormat:@"%ld", [model.comment integerValue] + 1];
    NSIndexSet * indexSet = [[NSIndexSet alloc]initWithIndex:indexPath.section];
    [tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    
}

-(void)unreadMessageNoti:(NSNotification *)noti
{
    [[[[[self tabBarController] tabBar] items] objectAtIndex:3] setBadgeValue:[User sharedInstanced].unreadMessages.length > 0 ? [User sharedInstanced].unreadMessages : nil];
}

-(void)loginSuccess:(NSNotification *)noti
{
    [_loginButton sd_setImageWithURL:[NSURL URLWithString:[User sharedInstanced].ATP_avatar] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"login_default_bg"]];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"loginSuccess" object:nil];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [_loginButton sd_setImageWithURL:[NSURL URLWithString:[User sharedInstanced].ATP_avatar] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"login_default_bg"]];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}

/**
 *  创建搜索框
 */
- (void)createSearchView{
    
    UIView *titelView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200*SCREEN_WIDTH/320, 31)];
    _searchTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(-10, 0, titelView.frame.size.width +60, titelView.frame.size.height)];
    _searchTextFiled.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"输入关键字，找找看" attributes:@{NSForegroundColorAttributeName:getColor(@"cccccc")}];
    _searchTextFiled.font = [UIFont systemFontOfSize:14];
    _searchTextFiled.returnKeyType = UIReturnKeySearch;
    _searchTextFiled.backgroundColor = getColor(@"f5f5f5");
    _searchTextFiled.layer.cornerRadius = 15;
    _searchTextFiled.layer.masksToBounds = YES;
    UIView * leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 36, 16)];
    
    UIImageView *leftImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"InformationRoot_search_bg"]];
    leftImage.frame = CGRectMake(10, 0, 16, 16);
    [leftView addSubview:leftImage];
    _searchTextFiled.leftView = leftView;
    _searchTextFiled.leftViewMode = UITextFieldViewModeAlways;
    [titelView addSubview:_searchTextFiled];
    
    UIButton * searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    searchButton.frame = CGRectMake(0, 0, 200*SCREEN_WIDTH/320, 31);
    [searchButton addTarget:self action:@selector(searchButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [titelView addSubview:searchButton];
    
    self.navigationItem.titleView = titelView;
}

-(void)initViews
{
    WS(weakSelf);
    for (int i = 0; i < self.titleArray.count; i ++) {
        UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectMake(i * SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT - statusBarAndNavigationBarHeight - tabbarHeight - 41) style:UITableViewStyleGrouped];
        tableView.backgroundColor = [UIColor clearColor];
        tableView.tag = kBaseTag + i;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.showsVerticalScrollIndicator = NO;
        [_scrollView addSubview:tableView];
        if (@available(iOS 11.0, *)) {
            tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            tableView.estimatedRowHeight = 0;
            tableView.estimatedSectionHeaderHeight = 0.1;
            tableView.estimatedSectionFooterHeight = 0.1;
        }
        else
        {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        if (i == 0 || i == 1) {
            _sdCycleScrollView = [[SDCycleScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH / 2.038)];
            _sdCycleScrollView.autoScrollTimeInterval = 3.0f;
            _sdCycleScrollView.delegate = self;
            _sdCycleScrollView.tag = kSdTag + i;
            _sdCycleScrollView.pageControlDotSize = CGSizeMake(3, 3);
            _sdCycleScrollView.pageControlRightOffset = 15;
            _sdCycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
            tableView.tableHeaderView = _sdCycleScrollView;
            
            _backView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_sdCycleScrollView.frame) - 30, SCREEN_WIDTH, 30)];
            _backView.backgroundColor = [UIColor blackColor];
            _backView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.6];
            [_sdCycleScrollView addSubview:_backView];
            _sdcyLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH - 50, 30)];
            _sdcyLabel.tag = kBaseViewTag + i;
            _sdcyLabel.font = Define_SystemIphone6Font14;
            _sdcyLabel.textColor = [UIColor whiteColor];
            _sdcyLabel.text = @"中央共产党第十九次全国代表大会";
            [_backView addSubview:_sdcyLabel];
        }
        switch (tableView.tag - kBaseTag) {
            case 0:
            {
                tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
                    self.currentPage = 1;
                    [weakSelf InformationRootNext];
                    [weakSelf InformationRoot];
                }];
                tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
                    self.currentPage ++;
                    [weakSelf InformationRootNext];
                }];
            }
                break;
            case 1:
            {
                tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
                    self.currentPage = 1;
                    [self informationCommunity];
                    [self informationCommunityBanner];
                }];
                tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
                    self.currentPage ++;
                    [self informationCommunity];
                }];
            }
                break;
            case 2:
            {
                tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
                    self.currentPage = 1;
                    [self informationActivities];
                }];
                tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
                    self.currentPage ++;
                    [self informationActivities];
                }];
            }
                break;
            case 3:
            {
                tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
                    self.currentPage = 1;
                    [self informationProject];
                    [self informationProjectBanner];
                }];
                tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
                    self.currentPage ++;
                    [self informationProject];
                }];
            }
                break;
        }
    }
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * self.titleArray.count, 0);
}

//创建 要闻类Cell
-(UITableViewCell *)tableView:(UITableView *)tableView withNewscellForRowAtIndexPath:(NSIndexPath *)indexPath dataArray:(NSArray *)dataArray
{
    InformationRootListPost * model = dataArray[indexPath.row];

    if ([model.showcase isEqualToString:@"normal"]) {
        InformationRootTableViewCell * cell = [InformationRootTableViewCell cellForTableView:tableView];
        if (tableView.tag - kBaseTag == 0) {
            if (self.topModel) {
                if (indexPath.row == 0) {
                    cell.isTop = YES;
                }
                else
                {
                    cell.isTop = NO;
                }
            }
            else
            {
                cell.isTop = NO;
            }
        }
        else
        {
            cell.isTop = NO;
        }
        cell.model = model;
        return cell;
    }
    else if ([model.showcase isEqualToString:@"thumb"])
    {
        InformationRootBigTableViewCell * cell = [InformationRootBigTableViewCell cellForTableView:tableView];
        cell.model = model;
        if (tableView.tag - kBaseTag == 3) {
            cell.isProject = YES;
        }
        else
        {
            cell.isProject = NO;
        }
        return cell;
    }
    InformationRootMoreTableViewCell * cell = [InformationRootMoreTableViewCell cellForTableView:tableView];
    cell.model = model;
    return cell;
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (tableView.tag - kBaseTag) {
        case 0:
            return self.newsArray.count;
            break;
        case 1:
            return self.communityArray.count;
            break;
        case 2:
            return self.activityArray.count;
            break;
        default:
            return self.projectArray.count;
            break;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag - kBaseTag == 0) {
        return [self tableView:tableView withNewscellForRowAtIndexPath:indexPath dataArray:self.newsArray];
    }
    if (tableView.tag - kBaseTag == 1) {
        return [self tableView:tableView withNewscellForRowAtIndexPath:indexPath dataArray:self.communityArray];
    }
    if (tableView.tag - kBaseTag == 2) {
        InformationActivitiesTableViewCell * cell = [InformationActivitiesTableViewCell cellForTableView:tableView];
        InformationActivitiesActivityList * model = self.activityArray[indexPath.row];
        [cell.headerImageView sd_setImageWithURL:[NSURL URLWithString:model.thumb]];
        return cell;
    }
    return [self tableView:tableView withNewscellForRowAtIndexPath:indexPath dataArray:self.projectArray];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView cellHeightForIndexPath:indexPath cellContentViewWidth:SCREEN_WIDTH tableView:tableView];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 203) {
        ProjectDetailsViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([ProjectDetailsViewController class])];
        InformationRootListPost * model = self.projectArray[indexPath.row];
        VC.kId = model.idField;
        VC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:VC animated:YES];
        return;
    }
    if (tableView.tag == 202) {
        InformationActivitiesActivityList * model = self.activityArray[indexPath.row];
        EventDetailsViewController * VC = [[EventDetailsViewController alloc]init];
        VC.kid = model.idField;
        VC.title = model.title;
        VC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:VC animated:YES];
        return;
    }
    InformationRootListPost * model;
    if (tableView.tag == kBaseTag) {
        model = self.newsArray[indexPath.row];
    }
    else if (tableView.tag == 201)
    {
        model = self.communityArray[indexPath.row];
    }
    else
    {
        model = self.projectArray[indexPath.row];
    }
    DetailsViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([DetailsViewController class])];
    VC.kid = [model.idField integerValue];
    VC.indexPath = indexPath;
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:VC animated:YES];
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
    [self.scrollView setContentOffset:CGPointMake(index * SCREEN_WIDTH, 0)animated:YES];
    self.scrollCurrent = index;
    switch (index) {
        case 1:
            if (self.communityArray.count <= 0) {
                self.currentPage = 1;
                [self informationCommunityBanner];
                [self informationCommunity];
            }
            break;
        case 2:
            if (self.activityArray.count <= 0) {
                self.currentPage = 1;
                [self informationActivities];
            }
            break;
        case 3:
            if (self.projectArray.count <= 0) {
                self.currentPage = 1;
                [self informationProjectBanner];
                [self informationProject];
            }
            break;
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if ([scrollView isKindOfClass:[UITableView class]]) {
        return;
    }
    NSInteger currentIndex = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    UIButton *button = (UIButton*)[self.titleMenuView viewWithTag:kBaseTag + currentIndex];
    [self resetIndicatorViewFrameWithButton:button animation:YES];
}

#pragma mark - SDCycleScrollViewDelegate
//点击轮播图
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSDictionary * dic;
    if (self.scrollCurrent == 0) {
        dic = self.newsTitleArray[index];
    }
    else
    {
        dic = self.communityTitleArray[index];
    }
    DetailsViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([DetailsViewController class])];
    VC.kid = [dic[@"kID"] integerValue];
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:VC animated:YES];
}

/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index
{
    if (self.scrollCurrent > 1) {
        return;
    }
    UILabel * label = [cycleScrollView viewWithTag:kBaseViewTag + self.scrollCurrent];
    if (self.scrollCurrent == 0) {
        NSDictionary * dic = self.newsTitleArray[index];
        label.text = dic[@"kTitle"];
    }
    else
    {
        if (self.communityTitleArray.count <= 0) {
            return;
        }
        NSDictionary * dic = self.communityTitleArray[index];
        label.text = dic[@"kTitle"];
    }
}

//左上角登录
-(void)loginButtonClick
{
    if ([User sharedInstanced].ATP_acessToken.length <= 0) {
        [self presentLogin];
    }
    else
    {
        PersonalInformationViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([PersonalInformationViewController class])];
        VC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:VC animated:YES];
    }
}
//搜索
- (void)searchButtonClick {
    SearchViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([SearchViewController class])];
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:VC animated:YES];
}

@end

//
//  FocusCommunityDetailsViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/25.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "FocusCommunityDetailsViewController.h"
#import "CommunityShareDetailsTableViewCell.h"
#import "ShareMenuView.h"

@interface FocusCommunityDetailsViewController ()<UITableViewDelegate, UITableViewDataSource, CommunityShareDetailsTableViewCellDelegate, ShareMenuViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSMutableArray * dataArray;
@property (nonatomic, assign)NSInteger currentPage;
@property (nonatomic, strong)ShareMenuView * shareMenuView;
@property (nonatomic, strong)CommunityNotificationData * dataModel;
-(void)setContentWithArray:(NSArray *)array;
@end

@interface FocusCommunityDetailsViewController (network)
@end

@implementation FocusCommunityDetailsViewController (network)

//用户关注社区通知
-(void)focusCommunityNotification
{
    [NewCommunityBLL focusCommunityNotificationPage:self.currentPage andshowHUDInView:nil resultPostsWithBlock:^(CommunityNotificationModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                self.dataModel = model.data;
                if (self.currentPage == 1) {
                    [self.dataArray removeAllObjects];
                }
                [self setContentWithArray:model.data.post];
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

@end

@implementation FocusCommunityDetailsViewController

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

-(void)setDataModel:(CommunityNotificationData *)dataModel
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
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.currentPage = 1;
        [self focusCommunityNotification];
    }];
    _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        self.currentPage ++;
        [self focusCommunityNotification];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentPage = 1;
    [self focusCommunityNotification];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommunityShareDetailsTableViewCell * cell = [CommunityShareDetailsTableViewCell cellForTableView:tableView];
    cell.model = self.dataArray[indexPath.section];
    cell.delegate = self;
    cell.focuString = @"0";
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView cellHeightForIndexPath:indexPath cellContentViewWidth:SCREEN_WIDTH tableView:tableView];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 53;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view = [[UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(153, 20, 94, 24);
    label.backgroundColor = getColor(@"d8d8d8");
    label.layer.cornerRadius = 12;
    label.layer.masksToBounds = YES;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    label.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1/1.0];
    label.centerX = SCREEN_WIDTH / 2;
    CommunityNotificationPost * model = self.dataArray[section];
    label.text = model.addTime;
    [view addSubview:label];
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

#pragma mark - CommunityShareDetailsTableViewCellDelegate

-(void)shareButtonClick
{
    [self.shareMenuView showShareMenuView];
}

#pragma mark - ShareMenuViewDelegate
-(void)shareButtonWithTitle:(NSString *)title
{
    if ([title isEqualToString:@"朋友圈"]) {
        [self shareWithImage:[UIImage imageNamed:@"icon_bg"] Title:@"智慧沈阳新社区" content:@"智慧社区 智慧生活" url:shareUrl SSDKPlatformType:SSDKPlatformSubTypeWechatTimeline];
    }
    if ([title isEqualToString:@"微信好友"]) {
        [self shareWithImage:[UIImage imageNamed:@"icon_bg"] Title:@"智慧沈阳新社区" content:@"智慧社区 智慧生活" url:shareUrl SSDKPlatformType:SSDKPlatformSubTypeWechatSession];
    }
    if ([title isEqualToString:@"QQ好友"]) {
        [self shareWithImage:[UIImage imageNamed:@"icon_bg"] Title:@"智慧沈阳新社区" content:@"智慧社区 智慧生活" url:shareUrl SSDKPlatformType:SSDKPlatformSubTypeQQFriend];
    }
}

@end

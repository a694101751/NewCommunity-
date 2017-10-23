//
//  CommunityShareDetailsViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/25.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "CommunityShareDetailsViewController.h"
#import "CommunityShareDetailsTableViewCell.h"
#import "FocusCommunityDetailsViewController.h"
#import "ShareMenuView.h"

@interface CommunityShareDetailsViewController ()<UITableViewDelegate, UITableViewDataSource, CommunityShareDetailsTableViewCellDelegate, ShareMenuViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSMutableArray * dataArray;
@property (nonatomic, strong)ShareMenuView * shareMenuView;
@property (nonatomic, assign)NSInteger focusIndex;
@end

@interface CommunityShareDetailsViewController (network)
@end

@implementation CommunityShareDetailsViewController (network)
//当前社区通知
-(void)communityNotification
{
    [NewCommunityBLL communityNotificationListandshowHUDInView:self.view resultPostsWithBlock:^(CommunityNotificationModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                [self.dataArray addObjectsFromArray:model.data.post];
                self.focusIndex = self.dataArray.count;
                [self focusCommunityNotification];
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
//用户关注社区通知
-(void)focusCommunityNotification
{
    [NewCommunityBLL focusCommunityNotificationPage:1 andshowHUDInView:nil resultPostsWithBlock:^(CommunityNotificationModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                [self.dataArray addObjectsFromArray:model.data.post];
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

@end

@implementation CommunityShareDetailsViewController

-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

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

-(void)setTableView:(UITableView *)tableView
{
    _tableView = tableView;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tableFooterView = [UIView new];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self communityNotification];
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
    cell.model = _dataArray[indexPath.section];
    if (indexPath.section == self.focusIndex) {
        cell.focuString = @"1";
    }
    else
    {
        cell.focuString = @"0";
    }
    cell.delegate = self;
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
-(void)focusButtonClick
{
    FocusCommunityDetailsViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([FocusCommunityDetailsViewController class])];
    [self.navigationController pushViewController:VC animated:YES];
}

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

//
//  PersonalCenterViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/20.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "PersonalCenterViewController.h"
#import "PersonalCenterTableViewCell.h"
#import "PersonalInformationViewController.h"
#import "CommunityInViewController.h"
#import "AttentionCommunityViewController.h"
#import "MyStateViewController.h"
#import "MyCollectionViewController.h"
#import "ShareMenuView.h"
#import "SetUpViewController.h"

@interface PersonalCenterViewController ()<UITableViewDelegate, UITableViewDataSource, ShareMenuViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (nonatomic, strong)UIImageView * headerImageView;
@property (nonatomic, strong)ShareMenuView * shareMenuView;
@property (nonatomic, strong)NSArray * dataArray;
@property (nonatomic, strong)UILabel * nameLabel;
@property (nonatomic, strong)UILabel * addressLabel;
@end

@implementation PersonalCenterViewController

-(ShareMenuView *)shareMenuView
{
    if (!_shareMenuView) {
        _shareMenuView = [[ShareMenuView alloc]initWithTitleArry:@[@{@"kTitle":@"朋友圈", @"kImage":@"InformationRoot_share_circleFriends_bg"},
                                                                   @{@"kTitle":@"微信好友", @"kImage":@"InformationRoot_share_weiChat_bg"},
                                                                   @{@"kTitle":@"QQ好友", @"kImage":@"InformationRoot_share_QQ_bg"}]];
        _shareMenuView.delegate = self;
        [self.tabBarController.view addSubview:_shareMenuView];
    }
    return _shareMenuView;
}

-(void)setHeaderView:(UIView *)headerView
{
    _headerView = headerView;
    _headerView.backgroundColor = [UIColor whiteColor];
    
    _headerImageView = [[UIImageView alloc]init];
    [_headerImageView sd_setImageWithURL:[NSURL URLWithString:[User sharedInstanced].ATP_avatar] placeholderImage:[UIImage imageNamed:@"PersonalCenter_default_header"]];
    _headerImageView.layer.cornerRadius = 5;
    _headerImageView.layer.masksToBounds = YES;
    [_headerView addSubview:_headerImageView];
    
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.font = Define_SystemIphone6Font20;
    _nameLabel.textColor = getColor(@"333333");
    [_headerView addSubview:_nameLabel];
    
    _addressLabel = [[UILabel alloc]init];
    _addressLabel.font = Define_SystemIphone6Font14;
    _addressLabel.textColor = getColor(@"999999");
    [_headerView addSubview:_addressLabel];
    
    if ([User sharedInstanced].ATP_acessToken.length > 0) {
        _nameLabel.text = [User sharedInstanced].ATP_userName.length > 0 ? [User sharedInstanced].ATP_nickName : [User sharedInstanced].ATP_Phone;
    }
    else
    {
        _nameLabel.text = @"点击登录";
        _addressLabel.text = @"1秒登录，体验更多功能";
    }
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [_headerView addSubview:button];
    
    _headerImageView.sd_layout.rightSpaceToView(_headerView, 24)
    .centerYEqualToView(_headerView)
    .widthIs(72)
    .heightIs(72);
    
    _nameLabel.sd_layout.leftSpaceToView(_headerView, 36)
    .heightIs(22)
    .topSpaceToView(_headerView, 42)
    .autoWidthRatio(200);
    
    _addressLabel.sd_layout.leftSpaceToView(_headerView, 36)
    .rightSpaceToView(_headerImageView, 54)
    .topSpaceToView(_nameLabel, 12)
    .autoHeightRatio(0);
    
    button.sd_layout.rightEqualToView(_headerView)
    .topEqualToView(_headerView)
    .bottomEqualToView(_headerView)
    .leftEqualToView(_headerView);
}

-(void)setTableView:(UITableView *)tableView
{
    _tableView = tableView;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
    _tableView.backgroundColor = getColor(@"efefef");
    _tableView.separatorInset = UIEdgeInsetsMake(0, -20, 0, 0);
    _tableView.separatorColor = getColor(@"dbdbdb");
}

-(void)setStatusBarBackgroundColor:(UIColor *)color
{
    UIView * statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setStatusBarBackgroundColor:[UIColor whiteColor]];
    self.view.backgroundColor = [UIColor whiteColor];
    _dataArray = @[@[@{@"kImage":@"", @"kTitle":@"我的状态"},
                     @{@"kImage":@"", @"kTitle":@"社区入住"},
                     @{@"kImage":@"", @"kTitle":@"关注社区"},
                     @{@"kImage":@"", @"kTitle":@"我的收藏"},
                     @{@"kImage":@"", @"kTitle":@"邀请邻友"}],
                   @[@{@"kImage":@"", @"kTitle":@"设置"}]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginSuccess:) name:@"loginSuccess" object:nil];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

-(void)loginSuccess:(NSNotification *)noti
{
    _nameLabel.text = [User sharedInstanced].ATP_userName.length > 0 ? [User sharedInstanced].ATP_nickName : [User sharedInstanced].ATP_Phone;
    _addressLabel.text = [User sharedInstanced].ATP_address;
    [_headerImageView sd_setImageWithURL:[NSURL URLWithString:[User sharedInstanced].ATP_avatar] placeholderImage:[UIImage imageNamed:@"PersonalCenter_default_header"]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self setStatusBarBackgroundColor:[UIColor whiteColor]];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    if ([User sharedInstanced].ATP_acessToken.length > 0) {
        _nameLabel.text =  [User sharedInstanced].ATP_nickName;
        _addressLabel.text = [User sharedInstanced].ATP_address.length > 0 ? [User sharedInstanced].ATP_address : @"点击查看或编辑个人信息";
    }
    else
    {
        _nameLabel.text = @"点击登录";
        _addressLabel.text = @"1秒登录，体验更多功能";
    }
    [_headerImageView sd_setImageWithURL:[NSURL URLWithString:[User sharedInstanced].ATP_avatar] placeholderImage:[UIImage imageNamed:@"PersonalCenter_default_header"]];
    [self.tableView reloadData];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    [self setStatusBarBackgroundColor:nil];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray[section] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PersonalCenterTableViewCell * cell = [PersonalCenterTableViewCell cellForTableView:tableView];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            if ([[User sharedInstanced].unreadMessages integerValue] > 0) {
                cell.bageLabel.hidden = NO;
                 cell.accessoryType = UITableViewCellAccessoryNone;
            }
            else
            {
                cell.bageLabel.hidden = YES;
            }
        }
        else
        {
            cell.bageLabel.hidden = YES;
        }
    }
    else
    {
        cell.bageLabel.hidden = YES;
    }
    cell.model = _dataArray[indexPath.section][indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView cellHeightForIndexPath:indexPath cellContentViewWidth:SCREEN_WIDTH tableView:tableView];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 24;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([User sharedInstanced].ATP_acessToken.length <= 0) {
        [self presentLogin];
        return;
    }
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                [self pushMyState];
                break;
            case 1:
                [self pushCommunityIn];
                break;
            case 2:
                [self pushAttentionCommunity];
                break;
            case 3:
                [self pushMyCollection];
                break;
            case 4:
                [self.shareMenuView removeFromSuperview];
                [self.tabBarController.view addSubview:self.shareMenuView];
                [self.shareMenuView showShareMenuView];
                break;
        }
    }
    else
    {
        [self pushSetUp];
    }
}
//入住社区
-(void)pushCommunityIn
{
    CommunityInViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CommunityInViewController class])];
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:VC animated:YES];
}

-(void)pushAttentionCommunity
{
    AttentionCommunityViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([AttentionCommunityViewController class])];
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:VC animated:YES];
}

-(void)pushMyState
{
    MyStateViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([MyStateViewController class])];
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:VC animated:YES];
}

-(void)pushMyCollection
{
    MyCollectionViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([MyCollectionViewController class])];
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:VC animated:YES];
}

-(void)pushSetUp
{
    SetUpViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([SetUpViewController class])];
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:VC animated:YES];
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

//个人信息点击事件
-(void)buttonClick
{
    if ([User sharedInstanced].ATP_acessToken.length > 0) {
        PersonalInformationViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([PersonalInformationViewController class])];
        VC.hidesBottomBarWhenPushed = YES;
    VC.block = ^{
       [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:[User sharedInstanced].ATP_avatar] placeholderImage:[UIImage imageNamed:@"PersonalCenter_default_header"]];
        self.nameLabel.text = [User sharedInstanced].ATP_nickName;
        self.addressLabel.text = [User sharedInstanced].ATP_address;
    };
        [self.navigationController pushViewController:VC animated:YES];
    }
    else
    {
        [self presentLogin];
    }

}

@end

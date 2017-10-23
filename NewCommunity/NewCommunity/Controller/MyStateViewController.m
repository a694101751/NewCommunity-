//
//  MyStateViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/23.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "MyStateViewController.h"
#import <UIImageView+AFNetworking.h>
#import "MyStateTableViewCell.h"
#import "MyMessageViewController.h"
#import "CommunityLifeDetailsViewController.h"
#import "UIBarButtonItem+SXCreate.h"

@interface MyStateViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addsLabel;
@property (nonatomic, strong)UILabel * bedgeLabel;
@property (nonatomic, strong)NSArray * dataArray;
@end

@interface MyStateViewController (network)
@end

@implementation MyStateViewController (network)

-(void)myState
{
    [NewCommunityBLL myStateandshowHUDInView:self.view resultPostsWithBlock:^(MyStateModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                self.dataArray = model.data.pages;
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

@implementation MyStateViewController

-(void)setHeaderImageView:(UIImageView *)headerImageView
{
    _headerImageView = headerImageView;
    _headerImageView.layer.cornerRadius = 36;
    _headerImageView.layer.masksToBounds = YES;
    [_headerImageView setImageWithURL:[NSURL URLWithString:[User sharedInstanced].ATP_avatar] placeholderImage:[UIImage imageNamed:@"PersonalCenter_default_header"]];
    
    _addsLabel.text = [User sharedInstanced].ATP_address;
}

-(void)setNameLabel:(UILabel *)nameLabel
{
    _nameLabel = nameLabel;
    _nameLabel.text = [User sharedInstanced].ATP_nickName;
}

-(void)setTableView:(UITableView *)tableView
{
    _tableView = tableView;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tableFooterView = [UIView new];
    _tableView.backgroundColor = getColor(@"f7f7f7");
    if (@available(iOS 11.0, *)) {
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0.1;
        _tableView.estimatedSectionFooterHeight = 0.1;
    }
    else
    {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self myState];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self myState];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(pushNews) image:[UIImage imageNamed:@"message_bg"]];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
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
    MyStateTableViewCell * cell = [MyStateTableViewCell cellForTableView:tableView];
    cell.model = self.dataArray[indexPath.section];
    if (indexPath.row != 0) {
        cell.timeLabel.hidden = YES;
    }
    else
    {
        cell.timeLabel.hidden = NO;
    }
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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(streetAreaNoti:) name:@"deleteLife" object:nil];
    
    CommunityLifeDetailsViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CommunityLifeDetailsViewController class])];
    MyStatePage * model = self.dataArray[indexPath.section];
    VC.detailsType = CommunityLifeDetailsTypeMyState;
    VC.kid = model.idField;
    [self.navigationController pushViewController:VC animated:YES];
}

-(void)streetAreaNoti:(NSNotification *)noti
{
    [self.tableView.mj_header beginRefreshing];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"deleteLife" object:nil];
}

-(void)pushNews {
    MyMessageViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([MyMessageViewController class])];
    [self.navigationController pushViewController:VC animated:YES];
}


@end

//
//  MyMessageViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/23.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "MyMessageViewController.h"
#import "MyMessageTableViewCell.h"
#import "CommunityLifeDetailsViewController.h"

@interface MyMessageViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSMutableArray * dataArray;
@property (nonatomic, strong)MyMessageData * dataModel;
@property (nonatomic, assign)NSInteger currentPage;
-(void)setContentWithArray:(NSArray *)array;
@end

@interface MyMessageViewController (network)
@end

@implementation MyMessageViewController (network)

-(void)myMessageList
{
    [NewCommunityBLL myMessagePage:self.currentPage andshowHUDInView:self.view resultPostsWithBlock:^(MyMessageModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                self.dataModel = model.data;
                if (self.currentPage == 1) {
                    [self.dataArray removeAllObjects];
                }
                [self setContentWithArray:model.data.pages];
                [[User sharedInstanced]setUnreadMessages:nil];
                [[[[[self tabBarController] tabBar] items] objectAtIndex:3] setBadgeValue:nil];
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

@implementation MyMessageViewController

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

-(void)setDataModel:(MyMessageData *)dataModel
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
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.currentPage = 1;
    [self myMessageList];
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
    MyMessageTableViewCell * cell = [MyMessageTableViewCell cellForTableView:tableView];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView cellHeightForIndexPath:indexPath cellContentViewWidth:SCREEN_WIDTH tableView:tableView];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 8;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommunityLifeDetailsViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CommunityLifeDetailsViewController class])];
    MyMessagePage * model = self.dataArray[indexPath.row];
    if ([model.type isEqualToString:@"0"]) {
        VC.detailsType = CommunityLifeDetailsTypeMyMessage;
    }
    else
    {
        VC.detailsType = CommunityLifeDetailsTypeList;
    }
    VC.messageModel = model;
    VC.kid = model.lifeId;
    [self.navigationController pushViewController:VC animated:YES];
}

@end

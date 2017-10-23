//
//  HotTopicViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/26.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "HotTopicViewController.h"
#import "InformationRootTableViewCell.h"
#import "CommunityServiceDetailsViewController.h"

@interface HotTopicViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSMutableArray * dataArray;
@property (nonatomic, assign)NSInteger currentPage;
@property (nonatomic, strong)GovernmentAffairsData * dataModel;
-(void)setContentWithArray:(NSArray *)array;
@end

@interface HotTopicViewController (network)
@end

@implementation HotTopicViewController (network)
//政务 话题
-(void)governmentAffairs
{
    [NewCommunityBLL governmentAffairsPage:self.currentPage andshowHUDInView:self.view resultPostsWithBlock:^(GovernmentAffairsModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                if (self.currentPage == 1) {
                    [self.dataArray removeAllObjects];
                }
                [self setContentWithArray:model.data.post];
                self.dataModel = model.data;
            }
            else{
                [self showMessage:model.content];
            }
        }
        else{
            [self showError:error];
        }
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    }];
}
//政务 你关心的
-(void)governmentAffairsCareAbout
{
    [NewCommunityBLL governmentAffairscareAboutPage:self.currentPage andshowHUDInView:nil resultPostsWithBlock:^(GovernmentAffairsModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                if (self.currentPage == 1) {
                    [self.dataArray removeAllObjects];
                }
                [self setContentWithArray:model.data.post];
                self.dataModel = model.data;
            }
            else{
                [self showMessage:model.content];
            }
        }
        else{
            [self showError:error];
        }
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    }];
}

@end

@implementation HotTopicViewController

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

-(void)setDataModel:(GovernmentAffairsData *)dataModel
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
        if (self.type == HotTopicTypeHotTopic) {
            [self governmentAffairs];
        }
        else
        {
            [self governmentAffairsCareAbout];
        }
    }];
    _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        self.currentPage ++;
        if (self.type == HotTopicTypeHotTopic) {
            [self governmentAffairs];
        }
        else
        {
            [self governmentAffairsCareAbout];
        }
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentPage = 1;
    if (self.type == HotTopicTypeHotTopic) {
        [self governmentAffairs];
    }
    else
    {
        [self governmentAffairsCareAbout];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    InformationRootTableViewCell * cell = [InformationRootTableViewCell cellForTableView:tableView];
    cell.topicModel = self.dataArray[indexPath.row];
    return cell;
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

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view = [[UIView alloc]init];
    view.backgroundColor = [UIColor whiteColor];
    return view;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommunityServiceDetailsViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CommunityServiceDetailsViewController class])];
    GovernmentAffairsPost * model = self.dataArray[indexPath.row];
    VC.kid = model.idField;
    VC.type = DetailsTypeHotTopic;
    [self.navigationController pushViewController:VC animated:YES];
}

@end

//
//  CommunityPublicAnnouncementViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/25.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "CommunityPublicAnnouncementViewController.h"
#import "CommunityPublicAnnouncementTableViewCell.h"
#import "CommunityServiceDetailsViewController.h"

@interface CommunityPublicAnnouncementViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSMutableArray * dataArray;
@property (nonatomic, assign)NSInteger currentPage;
@property (nonatomic, strong)CommunityPublicAnnouncementData * dataModel;
-(void)setContentWithArray:(NSArray *)array;
@end

@interface CommunityPublicAnnouncementViewController (network)
@end

@implementation CommunityPublicAnnouncementViewController (network)

-(void)communityPublicAnnouncementList
{
    [NewCommunityBLL communityPublicAnnouncementPage:self.currentPage andshowHUDInView:self.view resultPostsWithBlock:^(CommunityPublicAnnouncementModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                if (self.currentPage == 1) {
                    [self.dataArray removeAllObjects];
                }
                [self setContentWithArray:model.data.post];
                self.dataModel = model.data;
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

@implementation CommunityPublicAnnouncementViewController

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

-(void)setDataModel:(CommunityPublicAnnouncementData *)dataModel
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
    _tableView.separatorInset = UIEdgeInsetsMake(0, -20, 0, 0);
    _tableView.tableFooterView = [UIView new];
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.currentPage = 1;
        [self communityPublicAnnouncementList];
    }];
    _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        self.currentPage ++;
        [self communityPublicAnnouncementList];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentPage = 1;
    [self communityPublicAnnouncementList];
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
    CommunityPublicAnnouncementTableViewCell * cell = [CommunityPublicAnnouncementTableViewCell cellForTableView:tableView];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView cellHeightForIndexPath:indexPath cellContentViewWidth:SCREEN_WIDTH tableView:tableView];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommunityPublicAnnouncementPost * model = self.dataArray[indexPath.row];
    CommunityServiceDetailsViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CommunityServiceDetailsViewController class])];
    VC.kid = model.idField;
    VC.type = DetailsTypeCommunityPublicAnnouncement;
    [self.navigationController pushViewController:VC animated:YES];
}

@end

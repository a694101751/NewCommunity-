//
//  CommunityLifeViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/25.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "CommunityLifeViewController.h"
#import "CommunityLifeTableViewCell.h"
#import "CommunityLifeDetailsViewController.h"

@interface CommunityLifeViewController ()<UITableViewDelegate, UITableViewDataSource, CommunityLifeTableViewCellDelegate, UIScrollViewDelegate, CommunityLifeDetailsViewControllerDelegate>
{
    UIButton * currentSelectedButton;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (nonatomic, strong)NSMutableArray * latestArray;
@property (nonatomic, strong)NSMutableArray * hotArray;
@property (nonatomic, assign)NSInteger currentPage;
@property (nonatomic, assign)NSInteger scrollCurrent;
@property (nonatomic, strong)NSArray * orderArray;
@property (nonatomic, strong)CommunityLifeListData * dataModel;
-(void)setContentArray:(NSMutableArray *)dataArray withArray:(NSArray *)array;
@end

@interface CommunityLifeViewController (network)
@end

@implementation CommunityLifeViewController(network)

-(void)communityLifeListWithOrder:(NSString *)order
{
    [NewCommunityBLL communityLifeListOrder:order lifeType:self.lifeType page:self.currentPage ndshowHUDInView:self.view resultPostsWithBlock:^(CommunityLifeListModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                self.dataModel = model.data;
                if ([order isEqualToString:@"addTime"]) {
                    if (self.currentPage == 1) {
                        [self.latestArray removeAllObjects];
                    }
                    [self setContentArray:self.latestArray withArray:model.data.pages];
                }
                else
                {
                    if (self.currentPage == 1) {
                        [self.hotArray removeAllObjects];
                    }
                    [self setContentArray:self.hotArray withArray:model.data.pages];
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
      UITableView *tableView = (UITableView*)[self.scrollView viewWithTag:200 + self.scrollCurrent];
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
                if (self.scrollCurrent == 0) {
                    [self.latestArray replaceObjectAtIndex:indexPath.section withObject:dataModel];
                }
                else
                {
                    [self.hotArray replaceObjectAtIndex:indexPath.section withObject:dataModel];
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
        UITableView * tableView = (UITableView *)[self.scrollView viewWithTag:200 + self.scrollCurrent];
        NSIndexSet * indexSet = [[NSIndexSet alloc]initWithIndex:indexPath.section];
        [tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
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
                if (self.scrollCurrent == 0) {
                    [self.latestArray replaceObjectAtIndex:indexPath.section withObject:dataModel];
                }
                else
                {
                    [self.hotArray replaceObjectAtIndex:indexPath.section withObject:dataModel];
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
        UITableView * tableView = (UITableView *)[self.scrollView viewWithTag:200 + self.scrollCurrent];
        NSIndexSet * indexSet = [[NSIndexSet alloc]initWithIndex:indexPath.section];
        [tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
}

@end

@implementation CommunityLifeViewController

-(NSMutableArray *)latestArray
{
    if (!_latestArray) {
        _latestArray = [NSMutableArray array];
    }
    return _latestArray;
}

-(NSMutableArray *)hotArray
{
    if (!_hotArray) {
        _hotArray = [NSMutableArray array];
    }
    return _hotArray;
}

-(void)setContentArray:(NSMutableArray *)dataArray withArray:(NSArray *)array
{
    [dataArray addObjectsFromArray:array];
}

-(void)setDataModel:(CommunityLifeListData *)dataModel
{
    _dataModel = dataModel;
    UITableView *tableView = (UITableView*)[self.scrollView viewWithTag:200 + self.scrollCurrent];
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

-(void)setHeaderView:(UIView *)headerView
{
    _headerView = headerView;
    CGFloat buttonWidth = 70;
    NSArray * titleArray = @[@"最新", @"最热"];
    for (int i = 0; i < titleArray.count; i ++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        [button setTitleColor:getColor(@"584f60") forState:UIControlStateSelected];
        [button setTitleColor:getColor(@"a6a6a6") forState:UIControlStateNormal];
        button.titleLabel.font = Define_SystemIphone6Font16;
        button.tag = 300 + i;
        if (i == 0) {
            button.selected = YES;
            currentSelectedButton = button;
        }
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake(i * buttonWidth, 0, buttonWidth, 50);
        [headerView addSubview:button];
    }
}

-(void)setScrollView:(UIScrollView *)scrollView
{
    _scrollView = scrollView;
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 2, 0);
    _scrollView.bounces = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    for (int i = 0; i < 2; i ++) {
        UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectMake(i * SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT - statusBarAndNavigationBarHeight - 41) style:UITableViewStyleGrouped];
        tableView.backgroundColor = [UIColor clearColor];
        tableView.tag = 200 + i;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.showsVerticalScrollIndicator = NO;
        [_scrollView addSubview:tableView];
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
        tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            self.currentPage = 1;
            [self communityLifeListWithOrder:self.orderArray[self.scrollCurrent]];
        }];
        tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            self.currentPage ++;
            [self communityLifeListWithOrder:self.orderArray[self.scrollCurrent]];
        }];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentPage = 1;
    self.scrollCurrent = 0;
    [self communityLifeListWithOrder:@"addTime"];
    self.orderArray = @[@"addTime", @"clickSum"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(iWantRelease:) name:@"iWantRelease" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)iWantRelease:(NSNotification *)noti
{
    UITableView * tableView = (UITableView *)[self.scrollView viewWithTag:200 + self.scrollCurrent];
    [tableView.mj_header beginRefreshing];
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView.tag == 200) {
        return self.latestArray.count;
    }
    return self.hotArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommunityLifeTableViewCell * cell = [CommunityLifeTableViewCell cellForTableView:tableView];
    if (tableView.tag == 200) {
        cell.model = self.latestArray[indexPath.section];
    }
    else
    {
        cell.model = self.hotArray[indexPath.section];
    }
    cell.delegate = self;
    cell.block = ^(NSArray * photoUrlsArray, NSInteger startIndex, NSArray * views)
    {
        [self showImageWithPhotoURLsArray:photoUrlsArray startIndex:startIndex fromViews:views];
    };
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView cellHeightForIndexPath:indexPath cellContentViewWidth:SCREEN_WIDTH tableView:tableView];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.1;
    }
    return 12;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommunityLifeDetailsViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CommunityLifeDetailsViewController class])];
    CommunityLifeListPage * model;
    if (tableView.tag == 200) {
        model = self.latestArray[indexPath.section];
    }
    else
    {
        model = self.hotArray[indexPath.section];
    }
    VC.detailsType = CommunityLifeDetailsTypeList;
    VC.kid = model.idField;
    VC.indexPath = indexPath;
    VC.delegate = self;
    [self.navigationController pushViewController:VC animated:YES];
}

#pragma mark - CommunityLifeDetailsViewControllerDelegate
-(void)praiseWithState:(BOOL)state indexPath:(NSIndexPath *)indexPath
{
    UITableView * tableView = (UITableView *)[self.scrollView viewWithTag:200 + self.scrollCurrent];
    CommunityLifeListPage * dataModel;
    if (tableView.tag == 200) {
        dataModel = self.latestArray[indexPath.section];
    }
    else
    {
        dataModel = self.hotArray[indexPath.section];
    }
    if (state) {
        dataModel.praiseState = YES;
        NSInteger count = [dataModel.praiseSum integerValue];
        count ++;
        dataModel.praiseSum = [NSString stringWithFormat:@"%ld", count];
        if (self.scrollCurrent == 0) {
            [self.latestArray replaceObjectAtIndex:indexPath.section withObject:dataModel];
        }
        else
        {
            [self.hotArray replaceObjectAtIndex:indexPath.section withObject:dataModel];
        }
    }
    else
    {
        dataModel.praiseState = NO;
        NSInteger count = [dataModel.praiseSum integerValue];
        count --;
        dataModel.praiseSum = [NSString stringWithFormat:@"%ld", count];
        if (self.scrollCurrent == 0) {
            [self.latestArray replaceObjectAtIndex:indexPath.section withObject:dataModel];
        }
        else
        {
            [self.hotArray replaceObjectAtIndex:indexPath.section withObject:dataModel];
        }
    }
    
    NSIndexSet * indexSet = [[NSIndexSet alloc]initWithIndex:indexPath.section];
    [tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(void)commentsWithCount:(NSInteger)count indexPath:(NSIndexPath *)indexPath
{
    UITableView * tableView = (UITableView *)[self.scrollView viewWithTag:200 + self.scrollCurrent];
    CommunityLifeListPage * dataModel;
    if (tableView.tag == 200) {
        dataModel = self.latestArray[indexPath.section];
    }
    else
    {
        dataModel = self.hotArray[indexPath.section];
    }
    dataModel.commentSum = [NSString stringWithFormat:@"%ld", count];
    NSIndexSet * indexSet = [[NSIndexSet alloc]initWithIndex:indexPath.section];
    [tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - CommunityLifeTableViewCellDelegate
-(void)thumbButtonSelected:(QMUIButton *)sender WithCell:(CommunityLifeTableViewCell *)cell
{
    UITableView * tableView = (UITableView *)[self.scrollView viewWithTag:200 + self.scrollCurrent];
    NSIndexPath * indexPath = [tableView indexPathForCell:cell];
    CommunityLifeListPage * model;
    if (tableView.tag == 200) {
        model = self.latestArray[indexPath.section];
    }
    else
    {
        model = self.hotArray[indexPath.section];
    }
    if (sender.selected) {
        [self cancelPraiseWithModel:model ndexPath:indexPath];
    }
    else
    {
        [self addPraiseWithModel:model indexPath:indexPath];
    }
}

-(void)buttonClick:(UIButton *)sender
{
    [self resetIndicatorViewFrameWithButton:sender animation:YES];
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
    
    [self resetCollectionViewContentOffsetWithIndex:button.tag - 300];
}

- (void) resetCollectionViewContentOffsetWithIndex:(NSInteger)index{
    self.scrollCurrent = index;
    if (index == 1) {
        if (self.hotArray.count <= 0) {
            [self communityLifeListWithOrder:self.orderArray[index]];
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
    
    UIButton *button = (UIButton*)[self.headerView viewWithTag:300 + currentIndex];
    [self resetIndicatorViewFrameWithButton:button animation:YES];
}
- (IBAction)rightButtonClick:(id)sender {
    UINavigationController * nav = [self.storyboard instantiateViewControllerWithIdentifier:@"IWantReleaseNav"];
    [self presentViewController:nav animated:YES completion:nil];
}

@end

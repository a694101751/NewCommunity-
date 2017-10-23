//
//  MyCollectionViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/23.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "MyCollectionViewController.h"
#import "InformationRootTableViewCell.h"
#import "DetailsViewController.h"
#import "CommunityServiceDetailsViewController.h"

@interface MyCollectionViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSMutableArray * dataArray;
@property (nonatomic, assign)NSInteger currentPage;
@property (nonatomic, strong)MyCollectionData * dataModel;
-(void)setContentWithArray:(NSArray *)array;
@end

@interface MyCollectionViewController (network)
@end

@implementation MyCollectionViewController (network)

-(void)myCollectionList
{
    [NewCommunityBLL myCollectionPage:self.currentPage andshowHUDInView:self.view resultPostsWithBlock:^(MyCollectionModel *model, NSError *error) {
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

//取消收藏
-(void)cancelCollectionKid:(NSString *)kid indexPath:(NSIndexPath *)indexPath
{
    [NewCommunityBLL cancelCollectionpostId:kid andshowHUDInView:self.view resultPostsWithBlock:^(ModifyInformationModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                [self showMessage:@"取消收藏成功"];
                [self.dataArray removeObjectAtIndex:indexPath.row];
                [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            }
            else
            {
                [self showMessage:@"取消收藏失败"];
            }
        }
        else
        {
            [self showError:error];
        }
    }];
}

@end

@implementation MyCollectionViewController

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

-(void)setDataModel:(MyCollectionData *)dataModel
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
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.currentPage = 1;
        [self myCollectionList];
    }];
    _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        self.currentPage ++;
        [self myCollectionList];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentPage = 1;
    [self myCollectionList];
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
    InformationRootTableViewCell * cell = [InformationRootTableViewCell cellForTableView:tableView];
    cell.collectionModel = self.dataArray[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView cellHeightForIndexPath:indexPath cellContentViewWidth:SCREEN_WIDTH tableView:tableView];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCollectionPost * model = self.dataArray[indexPath.row];
    if ([model.type integerValue] < 2) {
        DetailsViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([DetailsViewController class])];
        if ([model.type integerValue] == 0) {
            VC.isCommunity = YES;
        }
        else
        {
            VC.isCommunity = NO;
        }
        VC.kid = [model.postId integerValue];
        [self.navigationController pushViewController:VC animated:YES];
    }
    else
    {
        CommunityServiceDetailsViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CommunityServiceDetailsViewController class])];
        VC.kid = model.postId;
        VC.type = DetailsTypeHotTopic;
        [self.navigationController pushViewController:VC animated:YES];
    }
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

//设置进入编辑状态时，Cell不会缩进
- (BOOL)tableView: (UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

// 修改cell的编辑模式 默认是删除 还可以进行添加等操作
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

// 实现删除功能
// 还自带了一个左划显示删除功能的效果
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        MyCollectionPost * model = self.dataArray[indexPath.row];
//        [self cancelCollectionKid:model.idField indexPath:indexPath];
//    }
}

-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewRowAction *deleteRoWAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        MyCollectionPost * model = self.dataArray[indexPath.row];
        [self cancelCollectionKid:model.postId indexPath:indexPath];
        // 删除操作
    }];
    return @[deleteRoWAction];
}

// 编辑
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}

@end

//
//  AttentionCommunityViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/22.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "AttentionCommunityViewController.h"
#import "AttentionCommunityTableViewCell.h"
#import "StreetAreaViewController.h"

@interface AttentionCommunityViewController ()<UITableViewDelegate, UITableViewDataSource, AttentionCommunityTableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSMutableArray * dataArray;
@property (nonatomic, strong)AttentionCommunityPage * pageModel;
@end

@interface AttentionCommunityViewController (network)
@end

@implementation AttentionCommunityViewController (network)

-(void)attentionCommunityList
{
    [NewCommunityBLL attentionCommunityandshowHUDInView:self.view resultPostsWithBlock:^(AttentionCommunityModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                self.dataArray = [NSMutableArray arrayWithArray: model.data.pages];
            }
            else{
                [self showMessage:model.content];
            }
        }
        else{
            [self showError:error];
        }
        [self.tableView reloadData];
    }];
}

//取消社区关注
-(void)deleteUserClubId:(NSString *)kid withIndexPath:(NSIndexPath *)indexPath
{
    [NewCommunityBLL deleteUserClubId:kid andshowHUDInView:self.view resultPostsWithBlock:^(ModifyInformationModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                [self.dataArray removeObjectAtIndex:indexPath.row];
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
@implementation AttentionCommunityViewController

-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

-(void)setTableView:(UITableView *)tableView
{
    _tableView = tableView;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tableFooterView = [UIView new];
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
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self attentionCommunityList];
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
    AttentionCommunityTableViewCell * cell = [AttentionCommunityTableViewCell cellForTableView:tableView];
    cell.model = self.dataArray[indexPath.row];
    cell.delegate = self;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}

#pragma mark - AttentionCommunityTableViewCellDelegate
-(void)cancelButtonClickWithCell:(AttentionCommunityTableViewCell *)cell
{
    NSIndexPath * indexPath = [self.tableView indexPathForCell:cell];
    self.pageModel = self.dataArray[indexPath.row];
    if (cell.button.selected) {
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil message:@"确定取消关注吗？" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * enterAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self deleteUserClubId:self.pageModel.idField withIndexPath:indexPath];
        }];
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"再想想" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:enterAction];
        [alert addAction:cancelAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (IBAction)addButtonClick:(id)sender {
    StreetAreaViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([StreetAreaViewController class])];
    VC.isFocus = YES;
    [self.navigationController pushViewController:VC animated:YES];
}

@end

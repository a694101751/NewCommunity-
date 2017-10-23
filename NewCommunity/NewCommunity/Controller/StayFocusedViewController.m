//
//  StayFocusedViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/10/19.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "StayFocusedViewController.h"
#import "StayFocusedTableViewCell.h"

@interface StayFocusedViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSArray * dataArray;
@property (nonatomic, strong)NSMutableArray * indexArray;
@property (nonatomic, strong)NSString * userClubId;
@end

@interface StayFocusedViewController (network)
@end

@implementation StayFocusedViewController(network)

//街道列表
-(void)theStreet
{
    [NewCommunityBLL stayFocusedAreaId:self.addId andshowHUDInView:self.view resultPostsWithBlock:^(StayFocusedModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                self.dataArray = model.data.pages;
            }
            else{
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

//添加关注
-(void)addUserClubId:(NSString *)kid withIndexPath:(NSIndexPath *)indexPath
{
    [NewCommunityBLL addUserClubId:kid andshowHUDInView:self.view resultPostsWithBlock:^(ModifyInformationModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                [self showMessage:@"保存成功"];
                [self performSelector:@selector(submittedSuccessfully) withObject:nil afterDelay:1.5f];
            }
        }
        else
        {
            [self showError:error];
        }
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationNone];
    }];
}

@end

@implementation StayFocusedViewController

-(NSMutableArray *)indexArray
{
    if (!_indexArray) {
        _indexArray = [NSMutableArray array];
    }
    return _indexArray;
}

-(void)setTableView:(UITableView *)tableView
{
    _tableView = tableView;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tableFooterView = [UIView new];
    [_tableView registerNib:[UINib nibWithNibName:@"StayFocusedTableViewCell" bundle:nil] forCellReuseIdentifier:NSStringFromClass([StayFocusedTableViewCell class])];
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
    [self theStreet];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StayFocusedTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([StayFocusedTableViewCell class])  forIndexPath:indexPath];
    StreetAreaPage * model = self.dataArray[indexPath.row];
    cell.titleLabel.text = model.name;
    if (![self.indexArray containsObject:[NSString stringWithFormat:@"%ld", indexPath.row]]) {
        cell.titleImageView.image = [UIImage imageNamed:@"focus_nomor_bg"];
    }
    else
    {
        cell.titleImageView.image = [UIImage imageNamed:@"focus_selected_bg"];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (![self.indexArray containsObject:[NSString stringWithFormat:@"%ld", indexPath.row]]) {
        [self.indexArray addObject:[NSString stringWithFormat:@"%ld", indexPath.row]];
    }
    else
    {
        [self.indexArray removeObject:[NSString stringWithFormat:@"%ld", indexPath.row]];
    }
    [self.tableView reloadData];
}

- (IBAction)saveButtonClick:(id)sender {
    if (self.indexArray.count <= 0) {
        [self showMessage:@"您还没有选择社区"];
        return;
    }
    for (int i = 0; i < self.indexArray.count; i ++) {
        NSString * index = self.indexArray[i];
        StreetAreaPage * model = self.dataArray[[index integerValue]];
        if (i == 0) {
            self.userClubId = model.idField;
        }
        else
        {
            self.userClubId = [NSString stringWithFormat:@"%@,%@", self.userClubId, model.idField];
        }
    }
    [self addUserClubId:self.userClubId withIndexPath:nil];
}

-(void)submittedSuccessfully
{
    [self.navigationController popToViewController:self.navigationController.viewControllers[1] animated:YES];
}

@end

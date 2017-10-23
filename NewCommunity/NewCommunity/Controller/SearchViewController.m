//
//  SearchViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/21.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchTableViewCell.h"
#import "UIViewController+DismissKeyboard.h"
#import "DetailsViewController.h"

@interface SearchViewController ()<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property (nonatomic, strong)UITextField * searchTextFiled;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (nonatomic, strong)NSMutableArray * dataArray;
@property (nonatomic, strong)SearchResultsData * dataModel;
@property (nonatomic, assign)NSInteger currentPage;
-(void)setContentWithArray:(NSArray *)array;
@end

@interface SearchViewController (network)
@end

@implementation SearchViewController (network)
//今日热点列表
-(void)todayHotSpots
{
    [NewCommunityBLL informationSearchListingsandshowHUDInView:self.view resultPostsWithBlock:^(SearchForInformationModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                [self.dataArray removeAllObjects];
                [self setContentWithArray:model.data.postList];
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
//搜索结果
-(void)searchForInformationWithTitle:(NSString *)title
{
    [NewCommunityBLL searchForInformationWithTitle:title page:self.currentPage andshowHUDInView:self.view resultPostsWithBlock:^(SearchResultsModel *model, NSError *error) {
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
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
    }];
}

@end

@implementation SearchViewController

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

-(void)setDataModel:(SearchResultsData *)dataModel
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
    _tableView.tableHeaderView = self.headerView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTintColor:getColor(@"24c789")];
    self.currentPage = 1;
    [self todayHotSpots];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"";
    self.navigationItem.leftBarButtonItem = backItem;
    
    [self createSearchView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/**
 *  创建搜索框
 */
- (void)createSearchView{
    
    UIView *titelView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200*SCREEN_WIDTH/320, 31)];
    _searchTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(-50, 0, titelView.frame.size.width +60, titelView.frame.size.height)];
    _searchTextFiled.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"输入关键字，找找看" attributes:@{NSForegroundColorAttributeName:getColor(@"cccccc")}];
    _searchTextFiled.font = [UIFont systemFontOfSize:14];
    _searchTextFiled.returnKeyType = UIReturnKeySearch;
    _searchTextFiled.layer.masksToBounds = YES;
    _searchTextFiled.layer.borderWidth = 1;
    _searchTextFiled.backgroundColor = [UIColor colorWithRed:244/255.0 green:245/255.0 blue:246/255.0 alpha:1/1.0];
    _searchTextFiled.layer.borderColor = getColor(@"e5e5e5").CGColor;
    _searchTextFiled.layer.cornerRadius = 5;
    _searchTextFiled.delegate = self;
    UIView * leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 36, 16)];
    
    UIImageView *leftImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"InformationRoot_search_bg"]];
    leftImage.frame = CGRectMake(10, 0, 16, 16);
    [leftView addSubview:leftImage];
    _searchTextFiled.leftView = leftView;
    _searchTextFiled.leftViewMode = UITextFieldViewModeAlways;
    [titelView addSubview:_searchTextFiled];
    self.navigationItem.titleView = titelView;
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SearchTableViewCell * cell = [SearchTableViewCell cellForTableView:tableView];
    cell.numberLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row + 1];
    SearchForInformationPostList * model = self.dataArray[indexPath.row];
    cell.contentLabel.text = model.title;
    if (indexPath.row == 0) {
        cell.numberLabel.backgroundColor = getColor(@"f65858");
        cell.stateLabel.text = @"热";
        cell.stateLabel.backgroundColor = getColor(@"f65858");
        cell.stateLabel.hidden = NO;
    }
    else if (indexPath.row == 1)
    {
        cell.numberLabel.backgroundColor = getColor(@"ff8b2f");
        cell.stateLabel.text = @"新";
        cell.stateLabel.backgroundColor = getColor(@"ff8b2f");
        cell.stateLabel.hidden = NO;
    }
    else if (indexPath.row == 2)
    {
        cell.numberLabel.backgroundColor = getColor(@"ffc11e");
        cell.stateLabel.hidden = YES;
    }
    else
    {
        cell.numberLabel.backgroundColor = getColor(@"f2f2f2");
        cell.numberLabel.textColor = getColor(@"757575");
        cell.stateLabel.hidden = YES;
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailsViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([DetailsViewController class])];
    SearchResultsPost * model = self.dataArray[indexPath.row];
    VC.kid = [model.idField integerValue];
    [self.navigationController pushViewController:VC animated:YES];
}

#pragma mark - UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    if (textField.text.length <= 0) {
        [self todayHotSpots];
        _tableView.mj_header = nil;
        _tableView.mj_footer = nil;
        return YES;
    }
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.currentPage = 1;
        [self searchForInformationWithTitle:self.searchTextFiled.text];
    }];
    _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        self.currentPage ++;
        [self searchForInformationWithTitle:self.searchTextFiled.text];
    }];
    [self searchForInformationWithTitle:textField.text];
    return YES;
}

- (IBAction)cancelButtonClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end

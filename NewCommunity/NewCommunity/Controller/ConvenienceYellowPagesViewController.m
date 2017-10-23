//
//  ConvenienceYellowPagesViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/25.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "ConvenienceYellowPagesViewController.h"
#import "ConvenienceYellowPagesTopTableViewCell.h"
#import "ConvenienceYellowPagesTableViewCell.h"
#import "CommunitySearchViewController.h"

@interface ConvenienceYellowPagesViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSArray * dataArray;
@end

@implementation ConvenienceYellowPagesViewController

-(void)setTableView:(UITableView *)tableView
{
    _tableView = tableView;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tableFooterView = [UIView new];
    [_tableView registerNib:[UINib nibWithNibName:@"ConvenienceYellowPagesTableViewCell" bundle:nil] forCellReuseIdentifier:NSStringFromClass([ConvenienceYellowPagesTableViewCell class])];
    [_tableView registerNib:[UINib nibWithNibName:@"ConvenienceYellowPagesTopTableViewCell" bundle:nil] forCellReuseIdentifier:NSStringFromClass([ConvenienceYellowPagesTopTableViewCell class])];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArray = @[@[@{@"kName":@"社区服务"},@{@"kName":@"客服电话", @"kPhone":@"4008116080"}], @[@{@"kName":@"居家常用"},@{@"kName":@"歌华有线", @"kPhone":@"96196"}, @{@"kName":@"歌华有线", @"kPhone":@"96196"}, @{@"kName":@"宽带通", @"kPhone":@"96007"}, @{@"kName":@"长城宽带", @"kPhone":@"95079"}, @{@"kName":@"电力系统客服电话", @"kPhone":@"95598"}, @{@"kName":@"邮政特快专递", @"kPhone":@"11185"}], @[@{@"kName":@"其他信息"},@{@"kName":@"消费者投诉举报专线电话", @"kPhone":@"12315"}, @{@"kName":@"质量监督电话", @"kPhone":@"12365"}, @{@"kName":@"环保局监督电话", @"kPhone":@"12369"}, @{@"kName":@"市民服务热线", @"kPhone":@"12345"}, @{@"kName":@"价格家督举报电话", @"kPhone":@"12358"}, @{@"kName":@"环保局监督电话", @"kPhone":@"12369"}]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

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
    if (indexPath.row == 0) {
        ConvenienceYellowPagesTopTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ConvenienceYellowPagesTopTableViewCell class]) forIndexPath:indexPath];
        NSDictionary * model = _dataArray[indexPath.section][indexPath.row];
        cell.titleLabel.text = model[@"kName"];
        return cell;
    }
    ConvenienceYellowPagesTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ConvenienceYellowPagesTableViewCell class]) forIndexPath:indexPath];
    NSDictionary * model = _dataArray[indexPath.section][indexPath.row];
    cell.nameLabel.text = model[@"kName"];
    cell.phoneLabel.text = model[@"kPhone"];
    cell.block = ^{
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel://"]]) {
            NSString * tel = [NSString stringWithFormat:@"tel://%@",model[@"kPhone"]];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:tel]];
        }
    };
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 40;
    }
    return 61;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

- (IBAction)searchButtonClick:(id)sender {
    CommunitySearchViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CommunitySearchViewController class])];
    VC.type = SearchRootTypeConvenienceYellowPages;
    [self.navigationController pushViewController:VC animated:YES];
}

@end

//
//  StreetAreaViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/22.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "StreetAreaViewController.h"
#import "StreetViewController.h"
#import "StayFocusedViewController.h"

@interface StreetAreaViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSArray * dataArray;
@end

@interface StreetAreaViewController (network)
@end

@implementation StreetAreaViewController(network)

-(void)streetAreaList
{
    [NewCommunityBLL streetAreaandshowHUDInView:self.view resultPostsWithBlock:^(StreetAreaModel *model, NSError *error) {
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

@end

@implementation StreetAreaViewController

-(void)setTableView:(UITableView *)tableView
{
    _tableView = tableView;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tableFooterView = [UIView new];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
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
    [self streetAreaList];
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
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])  forIndexPath:indexPath];
    cell.textLabel.textColor = getColor(@"333333");
    cell.textLabel.font = Define_SystemIphone6Font16;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor whiteColor];
    StreetAreaPage * model = self.dataArray[indexPath.row];
    cell.textLabel.text = model.name;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.isFocus) {
        StayFocusedViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([StayFocusedViewController class])];
        StreetAreaPage * model = self.dataArray[indexPath.row];
        VC.addId = model.idField;
        [self.navigationController pushViewController:VC animated:YES];
        return;
    }
    StreetViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([StreetViewController class])];
    VC.title = self.titleString;
    StreetAreaPage * model = self.dataArray[indexPath.row];
    VC.addsString = model.name;
    VC.addID = model.idField;
    [self.navigationController pushViewController:VC animated:YES];
}

@end

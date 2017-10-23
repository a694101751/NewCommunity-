//
//  StreetViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/23.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "StreetViewController.h"
#import "AddressChangesViewController.h"
#import "CommunityInViewController.h"

@interface StreetViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSArray * dataArray;
@end

@interface StreetViewController (network)
@end

@implementation StreetViewController (network)

-(void)streetList
{
    [NewCommunityBLL streetAreaId:self.addID andshowHUDInView:self.view resultPostsWithBlock:^(StreetAreaModel *model, NSError *error) {
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
//街道列表
-(void)theStreet
{
    [NewCommunityBLL theStreetAreaId:self.addID andshowHUDInView:self.view resultPostsWithBlock:^(StreetAreaModel *model, NSError *error) {
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

@implementation StreetViewController

-(void)setTableView:(UITableView *)tableView
{
    _tableView = tableView;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tableFooterView = [UIView new];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self.title isEqualToString:@"社区"]) {
        [self streetList];
    }
    else
    {
        [self theStreet];
    }
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
    StreetAreaPage * model = self.dataArray[indexPath.row];
    NSDictionary * dic = @{@"kAdds":self.addsString, @"kAddsID":self.addID, @"kStreet":model.name, @"kStreetID":model.idField};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"streetArea" object:dic];
    for (UIViewController * VC in self.navigationController.viewControllers) {
        if ([VC isKindOfClass:[AddressChangesViewController class]]) {
            [self.navigationController popToViewController:VC animated:YES];
            return;
        }
        if ([VC isKindOfClass:[CommunityInViewController class]]) {
            [self.navigationController popToViewController:VC animated:YES];
            return;
        }
    }
    
}

@end

//
//  AddressChangesViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/22.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "AddressChangesViewController.h"
#import "AddressChangesTableViewCell.h"
#import "StreetAreaViewController.h"

@interface AddressChangesViewController ()<UITableViewDelegate, UITableViewDataSource, IQActionSheetPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSMutableArray * dataArray;
@property (nonatomic, strong)NSString * addsString;

@property (nonatomic, strong)NSString * clubID;
@property (nonatomic, strong)NSString * areaID;

@property (nonatomic, strong)UITextField * textField;
@end

@interface AddressChangesViewController (network)
@end

@implementation AddressChangesViewController (network)

-(void)saveAddress
{
    [NewCommunityBLL modifyTheInformationID:[User sharedInstanced].ATP_acessToken areaId:nil clubId:nil nickName:nil userName:nil avatar:nil address:self.textField.text subdistrictId:self.clubID addressAareaId:self.areaID andshowHUDInView:self.view resultPostsWithBlock:^(ModifyInformationModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                [[User sharedInstanced]setATP_address:self.textField.text];
                [self.navigationController popViewControllerAnimated:YES];
            }
            else
            {
                [self showMessage:@"保存失败"];
                [[User sharedInstanced]setATP_areaName:nil];
                [[User sharedInstanced]setATP_clubName:nil];
            }
        }
        else
        {
            [self showError:error];
        }
    }];
}

@end

@implementation AddressChangesViewController

-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithArray:@[[User sharedInstanced].ATP_areaName.length > 0 ? [NSString stringWithFormat:@"%@ %@", [User sharedInstanced].ATP_areaName, [User sharedInstanced].ATP_clubName] : @"请选择"]];
    }
    return _dataArray;
}

-(void)setTableView:(UITableView *)tableView
{
    _tableView = tableView;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
    _tableView.separatorInset = UIEdgeInsetsMake(0, -20, 0, 0);
    _tableView.separatorColor = getColor(@"dbdbdb");
    [_tableView registerNib:[UINib nibWithNibName:@"AddressChangesTableViewCell" bundle:nil] forCellReuseIdentifier:@"AddressChangesTableViewCell"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.addsString = [User sharedInstanced].ATP_clubName;
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
    AddressChangesTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"AddressChangesTableViewCell" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.nameLabel.text = @"区域街道";
        if (self.addsString.length <= 0) {
            cell.titleLabel.textColor = getColor(@"24c789");
        }
        else
        {
            cell.titleLabel.textColor = getColor(@"333333");
        }
    }
    cell.titleLabel.text = _dataArray[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 58;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 58)];
    view.backgroundColor = [UIColor whiteColor];
    
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH - 15, 1)];
    lineView.backgroundColor = getColor(@"efefef");
    [view addSubview:lineView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 65, 17)];
    label.centerY = view.centerY;
    label.text = @"详细地址";
    label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
    label.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1/1.0];
    [view addSubview:label];
    
    _textField = [[UITextField alloc]initWithFrame:CGRectMake(112, 2, SCREEN_WIDTH - 127, 58)];
    if ([User sharedInstanced].ATP_address.length <= 0) {
        _textField.placeholder = @"例：柏林小区16号楼427室";
    }
    else
    {
        _textField.text = [User sharedInstanced].ATP_address;
    }
    _textField.font = Define_SystemIphone6Font14;
    [view addSubview:_textField];
    return view;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(streetAreaNoti:) name:@"streetArea" object:nil];
    StreetAreaViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([StreetAreaViewController class])];
    VC.titleString = @"街道";
    [self.navigationController pushViewController:VC animated:YES];
}

-(void)streetAreaNoti:(NSNotification *)noti
{
    NSDictionary * dic = [noti object];
    self.areaID = dic[@"kAddsID"];
    self.clubID = dic[@"kStreetID"];
    self.addsString = [NSString stringWithFormat:@"%@ %@", dic[@"kAdds"], dic[@"kStreet"]];
    [[User sharedInstanced]setATP_areaName:dic[@"kAdds"]];
    [[User sharedInstanced]setATP_clubName:dic[@"kStreet"]];
    [_dataArray replaceObjectAtIndex:0 withObject:self.addsString];
    [self.tableView reloadData];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"streetArea" object:nil];
}

- (IBAction)saveButtonClick:(id)sender {
    if (self.addsString.length <= 0) {
        [self showMessage:@"区域街道不能为空"];
        return;
    }
    if (self.textField.text.length <= 0) {
        [self showMessage:@"详细地址不能为空"];
        return;
    }
    [self saveAddress];
}

@end

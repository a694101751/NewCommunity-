//
//  CommunityInViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/22.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "CommunityInViewController.h"
#import "AddressChangesTableViewCell.h"
#import "StreetAreaViewController.h"
#import "CommunitySearchViewController.h"

@interface CommunityInViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSMutableArray * dataArray;
@property (nonatomic, strong)NSString * addsString;
@property (nonatomic, strong)NSString * clubID;
@property (nonatomic, strong)NSString * areaID;
-(void)returnButtonClick;
-(void)submittedSuccessfully;
@end

@interface CommunityInViewController (network)
@end

@implementation CommunityInViewController (network)

-(void)saveAdds
{
    [NewCommunityBLL modifyTheInformationID:[User sharedInstanced].ATP_acessToken areaId:[User sharedInstanced].ATP_areaID clubId:[User sharedInstanced].ATP_clubID nickName:nil userName:nil avatar:nil address:nil subdistrictId:nil addressAareaId:nil andshowHUDInView:self.view resultPostsWithBlock:^(ModifyInformationModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                [self showMessage:@"保存成功"];
                [self performSelector:@selector(submittedSuccessfully) withObject:nil afterDelay:1.5f];
            }
            else
            {
                [[User sharedInstanced]setCommunityInAreaName:@""];
                [[User sharedInstanced]setCommunityInClubName:@""];
                [[User sharedInstanced]setATP_areaID:@""];
                [[User sharedInstanced]setATP_clubID:@""];
            }
        }
        else
        {
            [self showError:error];
        }
    }];
}

@end

@implementation CommunityInViewController

-(void)submittedSuccessfully
{
    [self returnButtonClick];
}

-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithArray:@[@"请选择"]];
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
    
    self.addsString = [NSString stringWithFormat:@"%@ %@", [User sharedInstanced].communityInAreaName, [User sharedInstanced].communityInClubName];
    self.areaID = [User sharedInstanced].ATP_areaID;
    self.clubID = [User sharedInstanced].ATP_clubID;
    
    UIBarButtonItem * barItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"all_backItem"] style:UIBarButtonItemStyleDone target:self action:@selector(returnButtonClick)];
    self.navigationItem.leftBarButtonItem = barItem;
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
        cell.nameLabel.text = @"区域社区";
        if ([User sharedInstanced].communityInAreaName.length <= 0) {
            cell.titleLabel.textColor = getColor(@"24c789");
        }
        else
        {
            cell.titleLabel.textColor = getColor(@"333333");
        }
    }
    cell.titleLabel.text = [User sharedInstanced].communityInAreaName.length <= 0 ? _dataArray[indexPath.row] : [NSString stringWithFormat:@"%@ %@", [User sharedInstanced].communityInAreaName, [User sharedInstanced].communityInClubName];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(streetAreaNoti:) name:@"streetArea" object:nil];
    StreetAreaViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([StreetAreaViewController class])];
    VC.titleString = @"社区";
    [self.navigationController pushViewController:VC animated:YES];
}

-(void)streetAreaNoti:(NSNotification *)noti
{
    NSDictionary * dic = [noti object];
    self.areaID = dic[@"kAddsID"];
    self.clubID = dic[@"kStreetID"];
    [[User sharedInstanced] setATP_areaID:dic[@"kAddsID"]];
    [[User sharedInstanced] setATP_clubID: dic[@"kStreetID"]];
    self.addsString = [NSString stringWithFormat:@"%@ %@", dic[@"kAdds"], dic[@"kStreet"]];
    [[User sharedInstanced]setCommunityInAreaName:dic[@"kAdds"]];
    [[User sharedInstanced]setCommunityInClubName:dic[@"kStreet"]];
    
    [_dataArray replaceObjectAtIndex:0 withObject:self.addsString];
    [self.tableView reloadData];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"streetArea" object:nil];
}

- (IBAction)saveButtonClick:(id)sender {
    if (self.addsString.length <= 0) {
        [self showMessage:@"请选择区域社区"];
        return;
    }
    [self saveAdds];
}

-(void)returnButtonClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

@end

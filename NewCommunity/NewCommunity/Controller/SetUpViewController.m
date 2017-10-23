//
//  SetUpViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/23.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "SetUpViewController.h"
#import "SetUpTableViewCell.h"
#import "FeedbackViewController.h"

@interface SetUpViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSArray * dataArray;
@end

@implementation SetUpViewController

-(void)setTableView:(UITableView *)tableView
{
    _tableView = tableView;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tableFooterView = [UIView new];
    [_tableView registerNib:[UINib nibWithNibName:@"SetUpTableViewCell" bundle:nil] forCellReuseIdentifier:NSStringFromClass([SetUpTableViewCell class])];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArray = @[@{@"kTitle":@"微信公众号", @"kContent": @"synewsq"},
                   @{@"kTitle":@"当前版本", @"kContent": @"版本 1.0"},
                   @{@"kTitle":@"清理缓存", @"kContent": [NSString stringWithFormat:@"%.2fM",[self filePath]]},
                   @{@"kTitle":@"意见反馈", @"kContent": @""}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SetUpTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SetUpTableViewCell class]) forIndexPath:indexPath];
    NSDictionary * dic = _dataArray[indexPath.row];
    cell.titleLabel.text = dic[@"kTitle"];
    cell.contentLabel.text = dic[@"kContent"];
    if (indexPath.row == 0) {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 80;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 80)];
    view.backgroundColor = [UIColor clearColor];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor whiteColor];
    [button setTitle:@"退出" forState:UIControlStateNormal];
    [button setTitleColor:getColor(@"f65858") forState:UIControlStateNormal];
    [button addTarget:self action:@selector(exitButtonClick) forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.font = Define_SystemIphone6Font16;
    button.frame = CGRectMake(0, 24, SCREEN_WIDTH, 54);
    [view addSubview:button];
    return view;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/cn/app/jie-zou-da-shi/id1295570214?mt=8"]];
    }
    if (indexPath.row == 3) {
        FeedbackViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([FeedbackViewController class])];
        [self.navigationController pushViewController:VC animated:YES];
    }
    if (indexPath.row == 2) {
        [self cleanCache];
    }
}

-(void)exitButtonClick
{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil message:@"确定退出吗？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * enterAction = [UIAlertAction actionWithTitle:@"退出" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self performSelector:@selector(submittedSuccessfully) withObject:nil afterDelay:1.5f];
        [self presentLogin];
        [[User sharedInstanced]setAcessToken:nil];
        [[User sharedInstanced]setATP_userName:nil];
        [[User sharedInstanced]setATP_avatar:nil];
        [[User sharedInstanced]setATP_address:nil];
        [[User sharedInstanced]setATP_nickName:nil];
        [[User sharedInstanced]setATP_Phone:nil];
        [[User sharedInstanced]setATP_areaID:nil];
        [[User sharedInstanced]setATP_clubID:nil];
        [[User sharedInstanced]setATP_areaName:nil];
        [[User sharedInstanced]setATP_clubName:nil];
        [[User sharedInstanced]setCommunityInAreaName:nil];
        [[User sharedInstanced]setCommunityInClubName:nil];
    }];
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:enterAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)submittedSuccessfully
{
    self.tabBarController.selectedIndex = 0;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

// 显示缓存大小
- (float)filePath
{
    NSString * cachPath = [ NSSearchPathForDirectoriesInDomains ( NSCachesDirectory , NSUserDomainMask , YES ) firstObject ];
    
    return [ self folderSizeAtPath :cachPath];
}

//1:首先我们计算一下 单个文件的大小
- (long long) fileSizeAtPath:( NSString *) filePath{
    
    NSFileManager * manager = [ NSFileManager defaultManager ];
    if ([manager fileExistsAtPath :filePath]){
        return [[manager attributesOfItemAtPath :filePath error : nil ] fileSize ];
    }
    return 0 ;
}
//2:遍历文件夹获得文件夹大小，返回多少 M（提示：你可以在工程界设置（)m）
- ( float ) folderSizeAtPath:( NSString *) folderPath{
    NSFileManager * manager = [ NSFileManager defaultManager ];
    if (![manager fileExistsAtPath :folderPath]) return 0 ;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath :folderPath] objectEnumerator ];
    NSString * fileName;
    long long folderSize = 0 ;
    while ((fileName = [childFilesEnumerator nextObject ]) != nil ){
        NSString * fileAbsolutePath = [folderPath stringByAppendingPathComponent :fileName];
        folderSize += [ self fileSizeAtPath :fileAbsolutePath];
    }
    
    return folderSize/( 1024.0 * 1024.0 );
}

// 清理缓存
- (void)clearFile
{
    NSString * cachPath = [ NSSearchPathForDirectoriesInDomains ( NSCachesDirectory , NSUserDomainMask , YES ) firstObject ];
    NSArray * files = [[ NSFileManager defaultManager ] subpathsAtPath :cachPath];
    NSLog ( @"cachpath = %@" , cachPath);
    for ( NSString * p in files) {
        NSError * error = nil ;
        NSString * path = [cachPath stringByAppendingPathComponent :p];
        if ([[ NSFileManager defaultManager ] fileExistsAtPath :path]) {
            [[ NSFileManager defaultManager ] removeItemAtPath :path error :&error];
        }
    }
    
    [ self performSelectorOnMainThread:@selector(clearCachSuccess)withObject:nil waitUntilDone:YES ];
}

//清除缓存
- (void)cleanCache
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"是否清除缓存?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self filePath];
        NSLog(@"%f",[self filePath]);
        [self clearFile];
        [SDCycleScrollView clearImagesCache];
        [[SDImageCache sharedImageCache] clearDiskOnCompletion:nil];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消清除缓存");
    }];
    [alertController addAction:confirmAction];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}


-(void)clearCachSuccess
{
    [self showMessage:@"清理成功"];
    _dataArray = @[@{@"kTitle":@"微信公众号", @"kContent": @"synewsq"},
                   @{@"kTitle":@"当前版本", @"kContent": @"版本 1.0"},
                   @{@"kTitle":@"清理缓存", @"kContent": [NSString stringWithFormat:@"%.2fM",[self filePath]]},
                   @{@"kTitle":@"意见反馈", @"kContent": @""}];
    NSIndexPath *index=[NSIndexPath indexPathForRow:2 inSection:0];//刷新
    [_tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:index,nil] withRowAnimation:UITableViewRowAnimationNone];
}

@end

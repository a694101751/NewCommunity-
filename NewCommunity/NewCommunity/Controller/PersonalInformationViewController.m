//
//  PersonalInformationViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/20.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "PersonalInformationViewController.h"
#import "PersonalInformationTableViewCell.h"
#import "ModifyTheNameViewController.h"
#import "AddressChangesViewController.h"

@interface PersonalInformationViewController ()<UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSMutableArray * dataArray;
@property (nonatomic, strong)UIAlertController * alertController;
@property (nonatomic, strong)UIImagePickerController * imagePickerController;
@end

@interface PersonalInformationViewController (network)
@end

@implementation PersonalInformationViewController(network)
//上传图片
-(void)uploadAvatarWithImageArray:(NSArray *)imageArray
{
    [[NewCommunityBLL alloc]updateLoadPicDataForBaseURL:@"cms/upload/upload_files.action" paramers:nil andImageArray:imageArray andshowHUDInView:self.view resultPostsWithBlock:^(UploadAvatarModel * model, NSError *error) {
        if (!error) {
            UploadAvatarPhoto * photoModel = model.data.photo[0];
            [[User sharedInstanced]setATP_avatar:photoModel.url];
            [self saveAvatarWithUrl:photoModel.url];
            [self.tableView reloadData];
            if (self.block) {
                self.block();
            }
        }
        else
        {
            [self showError:error];
        }
    }];
}
//保存头像
-(void)saveAvatarWithUrl:(NSString *)url
{
    [NewCommunityBLL modifyTheInformationID:[User sharedInstanced].ATP_acessToken areaId:nil clubId:nil nickName:nil userName:nil avatar:url address:nil subdistrictId:nil addressAareaId:nil andshowHUDInView:self.view resultPostsWithBlock:^(ModifyInformationModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"loginSuccess" object:nil];
            }
        }
        else
        {
            [self showError:error];
        }
    }];
}

@end

@implementation PersonalInformationViewController

-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithArray:@[@{@"kTitle":@"头像", @"kImage":@"header"},
                                                      @{@"kTitle":@"姓名", @"kContent":[User sharedInstanced].ATP_userName.length > 0 ? [User sharedInstanced].ATP_userName : @"请输入姓名"},
                                                      @{@"kTitle":@"昵称", @"kContent":[User sharedInstanced].ATP_nickName.length > 0 ? [User sharedInstanced].ATP_nickName : @"请输入昵称"},
                                                      @{@"kTitle":@"住址", @"kContent": [User sharedInstanced].ATP_address.length > 0 ? [User sharedInstanced].ATP_address : @"请输入住址"}]];
        
    }
    return _dataArray;
}

-(UIAlertController *)alertController
{
    if (!_alertController) {
        _alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"从图库选取" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            self.imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:self.imagePickerController animated:YES completion:nil];
        }];
        UIAlertAction *addPhoneAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
            {
                self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
                [self presentViewController:self.imagePickerController animated:YES completion:nil];
            }
            else
            {
                [self showMessage:@"当前设备无摄像头，请从相册获取"];
            }
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [photoAction setValue:getColor(@"584f60@") forKey:@"_titleTextColor"];
        [addPhoneAction setValue:getColor(@"584f60@") forKey:@"_titleTextColor"];
        [cancelAction setValue:getColor(@"584f60@") forKey:@"_titleTextColor"];
        [_alertController addAction:photoAction];
        [_alertController addAction:addPhoneAction];
        [_alertController addAction:cancelAction];
        
    }
    return _alertController;
}

-(UIImagePickerController *)imagePickerController
{
    if (!_imagePickerController) {
        _imagePickerController = [[UIImagePickerController alloc]init];
        _imagePickerController.delegate = self;
        _imagePickerController.allowsEditing = YES;
        [_imagePickerController.navigationBar setBarTintColor:[UIColor whiteColor]];
        [_imagePickerController.navigationBar setTintColor:getColor(@"24c789")];
        [_imagePickerController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:getColor(@"584f60")}];
        _imagePickerController.navigationBar.translucent = NO;
    }
    return _imagePickerController;
}

-(void)setTableView:(UITableView *)tableView
{
    _tableView = tableView;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
    _tableView.separatorInset = UIEdgeInsetsMake(0, -20, 0, 0);
    _tableView.separatorColor = getColor(@"dbdbdb");
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataArray = [NSMutableArray arrayWithArray:@[@{@"kTitle":@"头像", @"kImage":@"header"},
                                                  @{@"kTitle":@"姓名", @"kContent":[User sharedInstanced].ATP_userName.length > 0 ? [User sharedInstanced].ATP_userName : @"请输入姓名"},
                                                  @{@"kTitle":@"昵称", @"kContent":[User sharedInstanced].ATP_nickName.length > 0 ? [User sharedInstanced].ATP_nickName : @"请输入昵称"},
                                                  @{@"kTitle":@"住址", @"kContent": [User sharedInstanced].ATP_address.length > 0 ? [User sharedInstanced].ATP_address : @"请输入住址"}]];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PersonalInformationTableViewCell * cell = [PersonalInformationTableViewCell cellForTableView:tableView];
    cell.model = self.dataArray[indexPath.row];
    if (indexPath.row != 0) {
        cell.headerImageView.hidden = YES;
    }
    else
    {
        cell.headerImageView.hidden = NO;
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 80;
    }
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            [self presentViewController:self.alertController animated:YES completion:nil];
            break;
        case 1:
            [self showModifyName:[User sharedInstanced].ATP_userName title:@"姓名"];
            break;
        case 2:
            [self showModifyName:[User sharedInstanced].ATP_nickName title:@"昵称"];
            break;
        case 3:
        {
            AddressChangesViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([AddressChangesViewController class])];
            [self.navigationController pushViewController:VC animated:YES];
            
        }
            break;
    }
}

-(void)showModifyName:(NSString *)content title:(NSString *)title
{
    ModifyTheNameViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([ModifyTheNameViewController class])];
    VC.title = title;
    VC.contentString = content;
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo NS_DEPRECATED_IOS(2_0, 3_0){
    NSArray * imageArray = [[NSArray alloc]initWithObjects:image, nil];
    [self uploadAvatarWithImageArray:imageArray];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - ModifyTheNameViewControllerDelegate
-(void)saveContentWithTitle:(NSString *)title content:(NSString *)content
{
    NSDictionary * dic;
    if ([title isEqualToString:@"姓名"]) {
        dic = @{@"kTitle":@"姓名", @"kContent":content};
        [self.dataArray replaceObjectAtIndex:1 withObject:dic];
        //某个cell刷新
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
    }
    else
    {
        dic = @{@"kTitle":@"昵称", @"kContent":content};
        [self.dataArray replaceObjectAtIndex:2 withObject:dic];
        //某个cell刷新
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:2 inSection:0];
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
    }
}

@end

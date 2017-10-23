//
//  IWantReleaseViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/23.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "IWantReleaseViewController.h"
#import "IWantReleaseCollectionViewCell.h"
#import "TZImagePickerController.h"
#import "MJPhotoBrowser.h"
#import "MJPhoto.h"
#import "IWantReleaseTableViewCell.h"

@interface IWantReleaseViewController ()<UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, TZImagePickerControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MJPhotoBrowserDelegate, IWantReleaseTableViewCellDelegate, QMUITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) QMUITextView *textView;
@property (strong, nonatomic) UICollectionView *collectionView;
@property (nonatomic, strong)NSMutableArray * imageArray;
@property (nonatomic, strong)UIAlertController * alertController;
@property (nonatomic, strong)TZImagePickerController * imagePicker;
@property (nonatomic, strong)UIImagePickerController * imagePickerController;
@property (nonatomic, strong)UIView * headerView;
@property (nonatomic, assign)NSInteger collectionHeight;
@property (nonatomic, strong)NSString * titleString;
@property (nonatomic, strong)NSString * lang;

@property (nonatomic, assign)NSInteger lifeType;
@property (nonatomic, strong)NSString * photos;
-(void)submittedSuccessfully;
@end

@interface IWantReleaseViewController (network)
@end

@implementation IWantReleaseViewController (network)
//我要发布
-(void)iWantRelease
{
    [NewCommunityBLL releaseContent:[self.textView.text substringFromIndex:6] lifeType:self.lifeType photo:self.photos andshowHUDInView:self.view resultPostsWithBlock:^(ModifyInformationModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                [self showMessage:@"发布成功"];
                [self performSelector:@selector(submittedSuccessfully) withObject:nil afterDelay:1.5f];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"iWantRelease" object:nil];
            }
        }
        else
        {
            [self showError:error];
        }
    }];
}
//上传图片
-(void)uploadImages
{
    [self.imageArray removeObjectAtIndex:self.imageArray.count - 1];
    [[NewCommunityBLL alloc]updateLoadPicDataForBaseURL:@"cms/upload/upload_files.action" paramers:nil andImageArray:self.imageArray andshowHUDInView:self.view resultPostsWithBlock:^(UploadAvatarModel * model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                NSArray * array = model.data.photo;
                for (int i = 0; i < array.count; i ++) {
                    UploadAvatarPhoto * photoModel = array[i];
                    if (i == 0) {
                        self.photos = photoModel.url;
                    }
                    else
                    {
                        self.photos = [NSString stringWithFormat:@"%@,%@", self.photos, photoModel.url];
                    }
                }
                [self iWantRelease];
            }
        }
        [self.imageArray addObject:[UIImage imageNamed:@"add_bg"]];
    }];
}

@end

@implementation IWantReleaseViewController

-(NSMutableArray *)imageArray
{
    if (!_imageArray) {
        _imageArray = [NSMutableArray arrayWithArray:@[[UIImage imageNamed:@"add_bg"]]];
    }
    return _imageArray;
}

-(UIImagePickerController *)imagePickerController
{
    if (!_imagePickerController) {
        _imagePickerController = [[UIImagePickerController alloc]init];
        _imagePickerController.delegate = self;
        _imagePickerController.allowsEditing = YES;
    }
    return _imagePickerController;
}

-(UIAlertController *)alertController
{
    if (!_alertController) {
        _alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"从图库选取" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            _imagePicker = [[TZImagePickerController alloc]initWithMaxImagesCount:10 - self.imageArray.count delegate:self];
            _imagePicker.allowPickingGif = NO;
            _imagePicker.allowPickingVideo = NO;
            _imagePicker.showSelectBtn = YES;
            _imagePicker.allowTakePicture = NO;
            _imagePicker.naviBgColor = [UIColor whiteColor];
            _imagePicker.naviTitleColor = getColor(@"584f60");
            _imagePicker.naviTitleFont = [UIFont fontWithName:@"PingFangSC-Medium" size:17];
            _imagePicker.barItemTextColor = getColor(@"24c789");
            _imagePicker.barItemTextFont = Define_SystemIphone6Font17;
            [self presentViewController:_imagePicker animated:YES completion:nil];
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

-(void)setTableView:(UITableView *)tableView
{
    _tableView = tableView;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tableFooterView = [UIView new];
    _tableView.tableHeaderView = [self headerViewWithInit];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}

-(UIView *)headerViewWithInit
{
    _headerView = [[UIView alloc]init];
    _headerView.backgroundColor = [UIColor whiteColor];
    _headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 183 + (SCREEN_WIDTH - 75) / 4 * 1 + 15);
    _textView = [[QMUITextView alloc]init];
    _textView.backgroundColor = [UIColor whiteColor];
    _textView.placeholder = @"写点什么吧…";
    _textView.placeholderColor = getColor(@"cccccc");
    _textView.font = Define_SystemIphone6Font16;
    _textView.delegate = self;
    _textView.textColor = getColor(@"151515");
    _textView.placeholderMargins = UIEdgeInsetsMake(16, 15, 0, 0);
    [_headerView addSubview:_textView];
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake((SCREEN_WIDTH - 75) / 4, (SCREEN_WIDTH - 75) / 4);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumLineSpacing = 15;
    layout.minimumInteritemSpacing = 15;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH, 0) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.collectionViewLayout = layout;
    _collectionView.showsVerticalScrollIndicator = NO;
    [_collectionView registerNib:[UINib nibWithNibName:@"IWantReleaseCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([IWantReleaseCollectionViewCell class])];
    [_headerView addSubview:_collectionView];
    _textView.sd_layout.leftEqualToView(_headerView)
    .rightEqualToView(_headerView)
    .topEqualToView(_headerView)
    .heightIs(152);
    
    _collectionView.sd_layout.leftSpaceToView(_headerView, 15)
    .topSpaceToView(_textView, 0)
    .rightSpaceToView(_headerView, 15)
    .bottomSpaceToView(_headerView, 31);
    return _headerView;
}

-(void)submittedSuccessfully
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionHeight = 1;
    self.lang = [[UIApplication sharedApplication]textInputMode].primaryLanguage;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    IWantReleaseTableViewCell * cell = [IWantReleaseTableViewCell cellForTableView:tableView];
    cell.delegate = self;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView cellHeightForIndexPath:indexPath cellContentViewWidth:SCREEN_WIDTH tableView:tableView];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
//    return 183 + (SCREEN_WIDTH - 75) / 4 * self.collectionHeight + self.collectionHeight * 15;
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

#pragma mark - UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.imageArray.count < 10) {
        return self.imageArray.count;
    }
    return self.imageArray.count - 1;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    IWantReleaseCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([IWantReleaseCollectionViewCell class]) forIndexPath:indexPath];
    cell.imageView.image = self.imageArray[indexPath.row];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.imageArray.count < 10) {
        if (indexPath.row == self.imageArray.count - 1) {
            [self presentViewController:self.alertController animated:YES completion:nil];
            return;
        }
    }
    //1.创建图片浏览器
    MJPhotoBrowser *brower = [[MJPhotoBrowser alloc] init];
    //2.告诉图片浏览器显示所有的图片
    NSMutableArray *photos = [NSMutableArray array];
    for (int i = 0 ; i < self.imageArray.count - 1; i++) {
        //传递数据给浏览器
        MJPhoto *mjPhoto = [[MJPhoto alloc] init];
        mjPhoto.image = self.imageArray[i];
        IWantReleaseCollectionViewCell *cell = (IWantReleaseCollectionViewCell*)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        mjPhoto.srcImageView = cell.imageView; //设置来源哪一个UIImageView
        [photos addObject:mjPhoto];
    }
    brower.photos = photos;
    brower.isShowDeleteButton = YES;
    brower.delegate = self;
    //3.设置默认显示的图片索引
    brower.currentPhotoIndex = indexPath.row;
    //4.显示浏览器
    [brower show];
}

-(void)changeHeaderViewFramWithContent:(NSInteger)count
{
    _headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 183 + (SCREEN_WIDTH - 75) / 4 * count + count * 15);
    [_tableView beginUpdates];
    [_tableView setTableHeaderView:_headerView];
    [_tableView endUpdates];
}

#pragma mark - MJPhotoBrowserDelegate

-(void)photoBrowser:(MJPhotoBrowser *)photoBrowser didDeletePhotoAtIndex:(NSInteger)index
{
    if (index < self.imageArray.count) {
        UIImage *image = self.imageArray[index];
        [self.imageArray removeObject:image];
        self.collectionHeight = ceil(self.imageArray.count / 4.0);
        [self changeHeaderViewFramWithContent:self.collectionHeight];
        [self.collectionView reloadData];
    }
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    if (self.imageArray.count >=10) {
        [self showMessage:@"您最多选择9张照片"];
        return;
    }
    [self.imageArray insertObject:image atIndex:self.imageArray.count - 1];
    self.collectionHeight = ceil(self.imageArray.count / 4.0);
    [self changeHeaderViewFramWithContent:self.collectionHeight];
    [_collectionView reloadData];
}

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto infos:(NSArray<NSDictionary *> *)infos
{
    if (self.imageArray.count + photos.count > 10) {
        [self showMessage:@"您最多选择9张照片"];
        return;
    }
    [self.imageArray removeObjectAtIndex:self.imageArray.count - 1];
    [self.imageArray addObjectsFromArray:photos];
    [self.imageArray addObject:[UIImage imageNamed:@"add_bg"]];
    self.collectionHeight = ceil(self.imageArray.count / 4.0);
    [self changeHeaderViewFramWithContent:self.collectionHeight];
    [_collectionView reloadData];
}

#pragma mark - IWantReleaseTableViewCellDelegate
-(void)didSelectItemWithTitle:(NSString *)title indexPathRow:(NSInteger)row
{
    self.lifeType = row;
    NSMutableAttributedString * attStr;
    if (self.titleString.length > 0) {
     attStr = [[NSMutableAttributedString alloc]initWithString: [self.textView.text stringByReplacingCharactersInRange:NSMakeRange(1, title.length) withString:title]];
    }
    else
    {
        self.titleString = [NSString stringWithFormat:@"#%@#", title];
        attStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@ %@", self.titleString, self.textView.text]];
    }
    [attStr addAttribute:NSForegroundColorAttributeName value:getColor(@"24c789") range:NSMakeRange(0, self.titleString.length)];
    [attStr addAttribute:NSForegroundColorAttributeName value:getColor(@"151515") range:NSMakeRange(self.titleString.length, attStr.length - self.titleString.length)];
    [attStr addAttribute:NSFontAttributeName value:Define_SystemIphone6Font16 range:NSMakeRange(0, attStr.length)];
    self.textView.attributedText = attStr;
}

#pragma mark - QMUITextViewDelegate
-(void)textViewDidChange:(UITextView *)textView{
    
    if ([self.lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textView markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textView positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            if (self.titleString.length > 0) {
                if (self.textView.text.length <= 0) {
                    return;
                }
                if (self.textView.text.length < self.titleString.length) {
                    self.titleString = @"";
                    return;
                }
                NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc]initWithString: self.textView.text];
                [attStr addAttribute:NSForegroundColorAttributeName value:getColor(@"24c789") range:NSMakeRange(0, self.titleString.length)];
                [attStr addAttribute:NSForegroundColorAttributeName value:getColor(@"151515") range:NSMakeRange(self.titleString.length, attStr.length - self.titleString.length)];
                [attStr addAttribute:NSFontAttributeName value:Define_SystemIphone6Font16 range:NSMakeRange(0, attStr.length)];
                self.textView.attributedText = attStr;
            }
        }
    }
    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    else{
        if (self.titleString.length > 0) {
            NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc]initWithString: self.textView.text];
            [attStr addAttribute:NSForegroundColorAttributeName value:getColor(@"24c789") range:NSMakeRange(0, self.titleString.length)];
            [attStr addAttribute:NSForegroundColorAttributeName value:getColor(@"151515") range:NSMakeRange(self.titleString.length, attStr.length - self.titleString.length)];
            [attStr addAttribute:NSFontAttributeName value:Define_SystemIphone6Font16 range:NSMakeRange(0, attStr.length)];
            self.textView.attributedText = attStr;
        }
    }
}

- (IBAction)cancelButtonClick:(id)sender {
    if (self.textView.text.length > 0 || self.imageArray.count > 1) {
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil message:@"放弃本次编辑？" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * enterAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"再想想" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:enterAction];
        [alert addAction:cancelAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
- (IBAction)wantButtonClick:(id)sender {
    if (self.textView.text.length <= 0) {
        [self showMessage:@"内容不能为空"];
        return;
    }
    if (self.titleString.length <= 0) {
        [self showMessage:@"请选择标签"];
        return;
    }
    if (self.imageArray.count <= 1) {
        [self iWantRelease];
        return;
    }
    if (self.imageArray.count > 1) {
        [self uploadImages];
    }
}

@end

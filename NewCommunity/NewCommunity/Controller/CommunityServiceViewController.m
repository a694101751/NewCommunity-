//
//  CommunityServiceViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/25.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "CommunityServiceViewController.h"
#import "ShareMenuCollectionViewCell.h"
#import "CommunityPublicAnnouncementViewController.h"
#import "ConvenienceYellowPagesViewController.h"

@interface CommunityServiceViewController ()<UICollectionViewDelegate, UICollectionViewDataSource,ShareMenuCollectionViewCellDelegate>
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (nonatomic, strong)UICollectionView * collectionView;
@property (nonatomic, strong)NSArray * titleArray;
@end

@interface CommunityServiceViewController (network)
@end

@implementation CommunityServiceViewController (network)
//社区服务
-(void)community
{
    [NewCommunityBLL communityandshowHUDInView:self.view resultPostsWithBlock:^(PropertyServiceModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                self.titleArray = model.pages;
                NSInteger count = ceil(self.titleArray.count / 4.0);
                self.collectionView.frame = CGRectMake(0, CGRectGetHeight(self.headerView.bounds) + 0, SCREEN_WIDTH, count * 87 + 36);
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
        [self.collectionView reloadData];
    }];
}

-(void)propertyService
{
    [NewCommunityBLL propertyServiceandshowHUDInView:self.view resultPostsWithBlock:^(PropertyServiceModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                self.titleArray = model.pages;
                NSInteger count = ceil(self.titleArray.count / 4.0);
                self.collectionView.frame = CGRectMake(0, CGRectGetHeight(self.headerView.bounds) + 0, SCREEN_WIDTH, count * 87 + 36);
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
        [self.collectionView reloadData];
    }];
}

@end

@implementation CommunityServiceViewController

-(void)setHeaderView:(UIView *)headerView
{
    _headerView = headerView;
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(15, 24, 28, 16);
    label.text = self.titleString;
    label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    label.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1/1.0];
    [_headerView addSubview:label];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSInteger count = ceil(_titleArray.count / 4.0);
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(SCREEN_WIDTH / 4, 87);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.headerView.bounds) + 0, SCREEN_WIDTH, count * 87 + 36) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [_collectionView registerClass:[ShareMenuCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([ShareMenuCollectionViewCell class])];
    [self.view addSubview:_collectionView];
    if ([self.titleString isEqualToString:@"社区"]) {
        [self community];
    }
    else
    {
        [self propertyService];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.titleArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ShareMenuCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ShareMenuCollectionViewCell class]) forIndexPath:indexPath];
    PropertyServicePage * dic = self.titleArray[indexPath.row];
    [cell.button setImage:[UIImage imageNamed:dic.url] forState:UIControlStateNormal];
    [cell.button setTitle:dic.title forState:UIControlStateNormal];
    cell.delegate = self;
    return cell;
}

#pragma mark - ShareMenuCollectionViewCellDelegate

-(void)shareMenuButtonClickWithCell:(ShareMenuCollectionViewCell *)cell
{
    NSIndexPath * indexPath = [self.collectionView indexPathForCell:cell];
    PropertyServicePage * model = self.titleArray[indexPath.row];
    if ([model.title isEqualToString:@"公告"]) {
        CommunityPublicAnnouncementViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CommunityPublicAnnouncementViewController class])];
        [self.navigationController pushViewController:VC animated:YES];
    }
    if ([model.title isEqualToString:@"便民黄页"]) {
        ConvenienceYellowPagesViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([ConvenienceYellowPagesViewController class])];
        [self.navigationController pushViewController:VC animated:YES];
    }
}

@end

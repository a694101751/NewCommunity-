//
//  CommunityServiceTableViewCell.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/25.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "CommunityServiceTableViewCell.h"
#import "CommunityServiceCollectionViewCell.h"
#import "UIView+ViewController.h"
#import "CommunityServiceDetailsViewController.h"
#import "CommunityServicePostList.h"
#import "DetailsViewController.h"

@interface CommunityServiceTableViewCell()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong)UICollectionView * collectionView;
@property (nonatomic, strong)UILabel * titleLabel;
@end

@implementation CommunityServiceTableViewCell

-(instancetype)initWithCellIdentifier:(NSString *)cellID
{
    self = [super initWithCellIdentifier:cellID];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake((SCREEN_WIDTH - 35) / 2, 110);
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumLineSpacing = 5;
        layout.minimumInteritemSpacing = 5;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH, 0) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.scrollEnabled = NO;
        _collectionView.collectionViewLayout = layout;
        _collectionView.showsVerticalScrollIndicator = NO;
        [self.contentView addSubview:_collectionView];
        [_collectionView registerNib:[UINib nibWithNibName:@"CommunityServiceCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([CommunityServiceCollectionViewCell class])];
        
        _collectionView.sd_layout.leftSpaceToView(self.contentView, 15)
        .rightSpaceToView(self.contentView, 15)
        .topSpaceToView(self.contentView, 0)
        .bottomSpaceToView(self.contentView, 10);
    }
    return self;
}

-(void)setArray:(NSArray *)array
{
    _array = array;
    [_collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.array.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CommunityServiceCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CommunityServiceCollectionViewCell class]) forIndexPath:indexPath];
    CommunityServicePostList * model = self.array[indexPath.item];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.thumb]];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController * viewController = [self viewController];
    CommunityServicePostList * model = self.array[indexPath.item];
    if ([self.title isEqualToString:@"政务"]) {
        CommunityServiceDetailsViewController * VC = [viewController.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CommunityServiceDetailsViewController class])];
        VC.type = DetailsTypeHotTopic;
        VC.kid = model.idField;
        VC.hidesBottomBarWhenPushed = YES;
        [viewController.navigationController pushViewController:VC animated:YES];
    }
    else
    {
        DetailsViewController * VC = [viewController.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([DetailsViewController class])];
        VC.kid = [model.idField integerValue];
        VC.isCommunity = YES;
        VC.hidesBottomBarWhenPushed = YES;
        [viewController.navigationController pushViewController:VC animated:YES];
    }
    
}

@end

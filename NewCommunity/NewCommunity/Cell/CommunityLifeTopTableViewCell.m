//
//  CommunityLifeTopTableViewCell.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/26.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "CommunityLifeTopTableViewCell.h"
#import "CommunityServiceCollectionViewCell.h"

@interface CommunityLifeTopTableViewCell()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong)UICollectionView * collectionView;
@end
@implementation CommunityLifeTopTableViewCell

-(instancetype)initWithCellIdentifier:(NSString *)cellID
{
    self = [super initWithCellIdentifier:cellID];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake((SCREEN_WIDTH - 85) / 2, (SCREEN_WIDTH - 85) / 2 / 1.8125);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//        layout.minimumLineSpacing = 6;
        layout.minimumInteritemSpacing = 10;
        layout.sectionInset = UIEdgeInsetsMake(0, 15, 0, 15);
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH, 0) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView registerNib:[UINib nibWithNibName:@"CommunityServiceCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([CommunityServiceCollectionViewCell class])];
        [self.contentView addSubview:_collectionView];
        
        _collectionView.sd_layout.leftEqualToView(self.contentView)
        .rightEqualToView(self.contentView)
        .topSpaceToView(self.contentView, 12)
        .heightIs((SCREEN_WIDTH - 85) / 2 / 1.8125);
    }
    return self;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CommunityServiceCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CommunityServiceCollectionViewCell class]) forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:self.dataArray[indexPath.item]];
//    cell.titleLabel.text = self.dataArray[indexPath.item];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.block) {
        self.block(indexPath.row);
    }
}

@end

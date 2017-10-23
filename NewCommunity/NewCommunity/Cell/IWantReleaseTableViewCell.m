//
//  IWantReleaseTableViewCell.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/24.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "IWantReleaseTableViewCell.h"
#import "IWantReleaseLabelCollectionViewCell.h"

@interface IWantReleaseTableViewCell()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong)UILabel * titleLabel;
@property (nonatomic, strong)UICollectionView * collectionView;
@property (nonatomic, strong)NSArray * dataArray;
@end

@implementation IWantReleaseTableViewCell

-(instancetype)initWithCellIdentifier:(NSString *)cellID
{
    self = [super initWithCellIdentifier:cellID];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        _dataArray = @[@"生活杂谈", @"突发爆料", @"新鲜事儿", @"邻里易物", @"咨询求助"];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"选择标签";
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:SCALEIPHONE6(16)];
        _titleLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1/1.0];
        [self.contentView addSubview:_titleLabel];

        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake((SCREEN_WIDTH - 70) / 3, 28);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing = 24;
        layout.minimumInteritemSpacing = 16;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH, 0) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.collectionViewLayout = layout;
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView registerNib:[UINib nibWithNibName:@"IWantReleaseLabelCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([IWantReleaseLabelCollectionViewCell class])];
        [self.contentView addSubview:_collectionView];
        
        _titleLabel.sd_layout.leftSpaceToView(self.contentView, 15)
        .topEqualToView(self.contentView)
        .widthIs(200)
        .heightIs(17);
        
        _collectionView.sd_layout.leftSpaceToView(self.contentView, 19)
        .topSpaceToView(_titleLabel, 24)
        .rightSpaceToView(self.contentView, 19)
        .heightIs(80);
        [self setupAutoHeightWithBottomView:_collectionView bottomMargin:1];
    }
    return self;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    IWantReleaseLabelCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([IWantReleaseLabelCollectionViewCell class]) forIndexPath:indexPath];
    cell.titleLabel.text = _dataArray[indexPath.row];
    return cell;
}

//点击选定
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    IWantReleaseLabelCollectionViewCell *cell = (IWantReleaseLabelCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.titleLabel.backgroundColor = getColor(@"24c789");
    cell.titleLabel.textColor=[UIColor whiteColor];
    if ([self.delegate respondsToSelector:@selector(didSelectItemWithTitle: indexPathRow:)]) {
        [self.delegate didSelectItemWithTitle:_dataArray[indexPath.row] indexPathRow:indexPath.row];
    }
}

//取消选定
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    IWantReleaseLabelCollectionViewCell *cell = (IWantReleaseLabelCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.titleLabel.backgroundColor = getColor(@"f6f6f6");
    cell.titleLabel.textColor = getColor(@"333333");
}


@end

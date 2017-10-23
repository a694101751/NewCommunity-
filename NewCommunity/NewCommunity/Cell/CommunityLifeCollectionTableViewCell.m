//
//  CommunityLifeCollectionTableViewCell.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/26.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "CommunityLifeCollectionTableViewCell.h"
#import "CommunityLifeCollectionViewCell.h"

@interface CommunityLifeCollectionTableViewCell()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong)UICollectionView * collectionView;
@end

@implementation CommunityLifeCollectionTableViewCell

-(instancetype)initWithCellIdentifier:(NSString *)cellID
{
    self = [super initWithCellIdentifier:cellID];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake((SCREEN_WIDTH - 45) / 2, 167);
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumLineSpacing = 12;
        layout.minimumInteritemSpacing = 15;
        layout.sectionInset = UIEdgeInsetsMake(0, 15, 0, 15);
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH, 0) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.collectionViewLayout = layout;
        _collectionView.scrollEnabled = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        [self.contentView addSubview:_collectionView];
        [_collectionView registerNib:[UINib nibWithNibName:@"CommunityLifeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([CommunityLifeCollectionViewCell class])];
        
        _collectionView.sd_layout.leftEqualToView(self.contentView)
        .rightEqualToView(self.contentView)
        .topEqualToView(self.contentView)
        .bottomEqualToView(self.contentView);
    }
    return self;
}

-(void)setDataArray:(NSArray *)dataArray
{
    _dataArray = dataArray;
    [_collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return self.dataArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CommunityLifeCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CommunityLifeCollectionViewCell class]) forIndexPath:indexPath];
    CommunityLifePostList * model = self.dataArray[indexPath.row];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.thumb]];
    cell.titleLabel.text = model.title;
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CommunityLifePostList * model = self.dataArray[indexPath.row];
    if (self.block) {
        self.block(model.idField);
    }
}

@end

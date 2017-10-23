//
//  CommunityLifeTableViewCell.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/25.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "CommunityLifeTableViewCell.h"
#import "IWantReleaseCollectionViewCell.h"

@interface CommunityLifeTableViewCell()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong)UICollectionView * collectionView;
@property (nonatomic, strong)UIImageView * headerImageView;
@property (nonatomic, strong)UILabel * nameLabel;
@property (nonatomic, strong)UILabel * timeLabel;
@property (nonatomic, strong)UILabel * contentLabel;
@property (nonatomic, strong)QMUIButton * locationButton;
@property (nonatomic, strong)QMUIButton * thumbButton;
@property (nonatomic, strong)QMUIButton * commentsButton;

@property (nonatomic, strong)NSArray * imageArray;

@property (nonatomic, strong)UICollectionViewFlowLayout * layout;
@end

@implementation CommunityLifeTableViewCell

-(instancetype)initWithCellIdentifier:(NSString *)cellID
{
    self = [super initWithCellIdentifier:cellID];
    if (self) {
        _headerImageView = [[UIImageView alloc]init];
        _headerImageView.layer.cornerRadius = 35 / 2;
        _headerImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:_headerImageView];
        
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:SCALEIPHONE6(14)];
        _nameLabel.textColor = [UIColor colorWithRed:88/255.0 green:79/255.0 blue:96/255.0 alpha:1/1.0];
        [self.contentView addSubview:_nameLabel];
        
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _timeLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1/1.0];
        _timeLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_timeLabel];
        
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
        _contentLabel.textColor = [UIColor colorWithRed:21/255.0 green:21/255.0 blue:21/255.0 alpha:1/1.0];
        [self.contentView addSubview:_contentLabel];
        
        _locationButton = [QMUIButton buttonWithType:UIButtonTypeCustom];
        _locationButton.spacingBetweenImageAndTitle = 3;
        [_locationButton setImage:[UIImage imageNamed:@"location_bg"] forState:UIControlStateNormal];
        _locationButton.titleLabel.font = Define_SystemIphone6Font12;
        [_locationButton setTitleColor:getColor(@"666666") forState:UIControlStateNormal];
        _locationButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [self.contentView addSubview:_locationButton];

        _thumbButton = [QMUIButton buttonWithType:UIButtonTypeCustom];
        _thumbButton.spacingBetweenImageAndTitle = 4;
        [_thumbButton setImage:[UIImage imageNamed:@"thumbButton_normal_bg"] forState:UIControlStateNormal];
        [_thumbButton setImage:[UIImage imageNamed:@"thumbButton_selected_bg"] forState:UIControlStateSelected];
        _thumbButton.titleLabel.font = Define_SystemIphone6Font12;
        [_thumbButton setTitleColor:getColor(@"666666") forState:UIControlStateNormal];
        [_thumbButton addTarget:self action:@selector(thumbButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        _thumbButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [self.contentView addSubview:_thumbButton];
        
        _commentsButton = [QMUIButton buttonWithType:UIButtonTypeCustom];
        _commentsButton.enabled = NO;
        _commentsButton.spacingBetweenImageAndTitle = 4;
        [_commentsButton setImage:[UIImage imageNamed:@"comments_normal_bg"] forState:UIControlStateNormal];
        _commentsButton.titleLabel.font = Define_SystemIphone6Font12;
        [_commentsButton setTitleColor:getColor(@"666666") forState:UIControlStateNormal];
        _commentsButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [self.contentView addSubview:_commentsButton];
        
        _layout = [[UICollectionViewFlowLayout alloc]init];
        _layout.itemSize = CGSizeMake((SCREEN_WIDTH - 93) / 3, (SCREEN_WIDTH - 93) / 3);
        _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _layout.minimumLineSpacing = 6;
        _layout.minimumInteritemSpacing = 6;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 87) collectionViewLayout:_layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerNib:[UINib nibWithNibName:@"IWantReleaseCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([IWantReleaseCollectionViewCell class])];
        [self.contentView addSubview:_collectionView];
        
        _headerImageView.sd_layout.leftSpaceToView(self.contentView, 15)
        .topSpaceToView(self.contentView, 12)
        .widthIs(35)
        .heightIs(35);
        
        _nameLabel.sd_layout.leftSpaceToView(_headerImageView, 16)
        .topSpaceToView(self.contentView, 22)
        .rightSpaceToView(self.contentView, 170)
        .autoHeightRatio(0);
        
        _timeLabel.sd_layout.rightSpaceToView(self.contentView, 15)
        .topSpaceToView(self.contentView, 22)
        .leftSpaceToView(self.contentView, 100)
        .heightIs(13);
        
        _contentLabel.sd_layout.leftSpaceToView(self.contentView, 66)
        .topSpaceToView(_nameLabel, 10)
        .rightSpaceToView(self.contentView, 15)
        .autoHeightRatio(0);
        
        _collectionView.sd_layout.leftSpaceToView(self.contentView, 66)
        .topSpaceToView(_contentLabel, 12)
        .rightSpaceToView(self.contentView, 15)
        .heightIs(200);
        
        _locationButton.sd_layout.leftSpaceToView(self.contentView, 66)
        .topSpaceToView(_collectionView, 12)
        .rightSpaceToView(self.contentView, 15)
        .heightIs(13);
        
        _thumbButton.sd_layout.leftSpaceToView(self.contentView, 66)
        .topSpaceToView(_locationButton, 24)
        .widthIs(42)
        .heightIs(16);
        
        _commentsButton.sd_layout.leftSpaceToView(_thumbButton, 24)
        .topSpaceToView(_locationButton, 24)
        .widthIs(60)
        .heightIs(16);
    }
    return self;
}

-(void)setModel:(CommunityLifeListPage *)model
{
    _model = model;
    [_headerImageView sd_setImageWithURL:[NSURL URLWithString:model.thumb] placeholderImage:[UIImage imageNamed:@"PersonalCenter_default_header"]];
    if (model.avatar) {
        [_headerImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar] placeholderImage:[UIImage imageNamed:@"PersonalCenter_default_header"]];
    }
    _nameLabel.text = model.userName;
    _timeLabel.text = model.distanceTime;
    _contentLabel.text = model.content;
    _imageArray = model.photo;
    [_locationButton setTitle:model.cludName forState:UIControlStateNormal];
    [_thumbButton setTitle:model.praiseSum forState:UIControlStateNormal];
    [_commentsButton setTitle:model.commentSum forState:UIControlStateNormal];
    
    if (_imageArray.count == 1) {
        _layout.itemSize = CGSizeMake(144, 144);
        _collectionView.sd_layout.leftSpaceToView(self.contentView, 66)
        .topSpaceToView(_contentLabel, 12)
        .rightSpaceToView(self.contentView, 15)
        .heightIs(144);
    }
    else
    {
        _layout.itemSize = CGSizeMake((SCREEN_WIDTH - 93) / 3, (SCREEN_WIDTH - 93) / 3);
        NSInteger coutent = ceil(_imageArray.count / 3.0);
        _collectionView.sd_layout.leftSpaceToView(self.contentView, 66)
        .topSpaceToView(_contentLabel, 12)
        .rightSpaceToView(self.contentView, 15)
        .heightIs((SCREEN_WIDTH - 93) / 3 * coutent + (coutent - 1) * 6);
    }
    
    
    [_collectionView reloadData];
    self.thumbButton.selected = model.praiseState;
    
    [self setupAutoHeightWithBottomView:_thumbButton bottomMargin:30];
}

#pragma mark - UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _imageArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    IWantReleaseCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([IWantReleaseCollectionViewCell class]) forIndexPath:indexPath];
    CommunityLifeListPhoto * model = _imageArray[indexPath.row];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.url]];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.block) {
        NSMutableArray * viewsArray = [NSMutableArray array];
        NSMutableArray * imagesArray = [NSMutableArray array];
        for (int index = 0; index < _imageArray.count; index ++) {
            NSIndexPath * path = [NSIndexPath indexPathForItem:index inSection:0];
            CommunityLifeListPhoto * model = _imageArray[index];
            IWantReleaseCollectionViewCell *cell = (IWantReleaseCollectionViewCell*)[collectionView cellForItemAtIndexPath:path];
            [viewsArray addObject:cell.imageView];
            [imagesArray addObject:model.url];
        }
        self.block(imagesArray, indexPath.item, viewsArray);
    }
}

-(void)thumbButtonClick:(QMUIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(thumbButtonSelected:WithCell:)]) {
        [self.delegate thumbButtonSelected:sender WithCell:self];
    }
}

@end

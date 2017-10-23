//
//  CommunityLifeDownTableViewCell.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/26.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "CommunityLifeDownTableViewCell.h"

@interface CommunityLifeDownTableViewCell()
@property (nonatomic, strong)UIImageView * headerImageView;
@property (nonatomic, strong)UILabel * nameLabel;
@property (nonatomic, strong)UILabel * timeLabel;
@property (nonatomic, strong)UILabel * contentLabel;
@end

@implementation CommunityLifeDownTableViewCell

-(instancetype)initWithCellIdentifier:(NSString *)cellID
{
    self = [super initWithCellIdentifier:cellID];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _headerImageView = [[UIImageView alloc]init];
        _headerImageView.layer.cornerRadius = 35 / 2;
        _headerImageView.layer.masksToBounds = YES;
        _headerImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_headerImageView];
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _nameLabel.textColor = [UIColor colorWithRed:88/255.0 green:79/255.0 blue:96/255.0 alpha:1/1.0];
        [self.contentView addSubview:_nameLabel];
        
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
        _contentLabel.textColor = getColor(@"151515");
        [self.contentView addSubview:_contentLabel];
        
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _timeLabel.textAlignment = NSTextAlignmentRight;
        _timeLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1/1.0];
        [self.contentView addSubview:_timeLabel];
        
        _headerImageView.sd_layout.leftSpaceToView(self.contentView, 15)
        .topSpaceToView(self.contentView, 12)
        .widthIs(35)
        .heightIs(35);
        
        _nameLabel.sd_layout.leftSpaceToView(_headerImageView, 16)
        .topSpaceToView(self.contentView, 22)
        .widthIs(200)
        .heightIs(15);
        
        _timeLabel.sd_layout.rightSpaceToView(self.contentView, 15)
        .topSpaceToView(self.contentView, 22)
        .widthIs(200)
        .heightIs(13);

        _contentLabel.sd_layout.leftSpaceToView(_headerImageView, 16)
        .topSpaceToView(_nameLabel, 10)
        .rightSpaceToView(self.contentView, 15)
        .autoHeightRatio(0);
    }
    return self;
}

-(void)setModel:(CommunityLifePostList *)model
{
    _model = model;
    [_headerImageView sd_setImageWithURL:[NSURL URLWithString:model.thumb]];
    _nameLabel.text = model.userName;
    _timeLabel.text = model.distanceTime;
    _contentLabel.text = model.content;
    [self setupAutoHeightWithBottomView:_contentLabel bottomMargin:1];
}

@end

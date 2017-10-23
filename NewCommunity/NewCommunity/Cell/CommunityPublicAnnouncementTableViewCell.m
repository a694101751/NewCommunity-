//
//  CommunityPublicAnnouncementTableViewCell.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/25.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "CommunityPublicAnnouncementTableViewCell.h"
@interface CommunityPublicAnnouncementTableViewCell()
@property (nonatomic, strong)UILabel * titleLabel;
@property (nonatomic, strong)UIImageView * titleImageView;
@end

@implementation CommunityPublicAnnouncementTableViewCell

-(instancetype)initWithCellIdentifier:(NSString *)cellID
{
    self = [super initWithCellIdentifier:cellID];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:14];
        _titleLabel.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1/1.0];
        [self.contentView addSubview:_titleLabel];
        
        _titleImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:_titleImageView];
        
        _titleImageView.sd_layout.rightSpaceToView(self.contentView, 15)
        .topSpaceToView(self.contentView, 15)
        .widthIs(80)
        .heightIs(80);
        
        _titleLabel.sd_layout.leftSpaceToView(self.contentView, 15)
        .topSpaceToView(self.contentView, 16)
        .rightSpaceToView(_titleImageView, 24)
        .autoHeightRatio(0);
    }
    return self;
}

-(void)setModel:(CommunityPublicAnnouncementPost *)model
{
    _model = model;
    [_titleImageView sd_setImageWithURL:[NSURL URLWithString:model.thumb]];
    _titleLabel.text = model.title;
    [self setupAutoHeightWithBottomViewsArray:@[_titleImageView, _titleLabel] bottomMargin:21];
}

@end

//
//  MyMessageTableViewCell.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/23.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "MyMessageTableViewCell.h"

@interface MyMessageTableViewCell()
@property (nonatomic, strong)UIImageView * headerImageView;
@property (nonatomic, strong)UILabel * nameLabel;
@property (nonatomic, strong)UILabel * timeLabel;
@property (nonatomic, strong)UILabel * contentLabel;
@end

@implementation MyMessageTableViewCell

-(instancetype)initWithCellIdentifier:(NSString *)cellID
{
    self = [super initWithCellIdentifier:cellID];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        _headerImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:_headerImageView];
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:SCALEIPHONE6(18)];
        _nameLabel.textColor = [UIColor colorWithRed:88/255.0 green:79/255.0 blue:96/255.0 alpha:1/1.0];
        [self.contentView addSubview:_nameLabel];
        
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:SCALEIPHONE6(14)];
        _timeLabel.textAlignment = NSTextAlignmentRight;
        _timeLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1/1.0];
        [self.contentView addSubview:_timeLabel];
        
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:SCALEIPHONE6(16)];
        _contentLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1/1.0];
        [self.contentView addSubview:_contentLabel];

        _headerImageView.sd_layout.leftSpaceToView(self.contentView, 15)
        .topSpaceToView(self.contentView, 16)
        .widthIs(44)
        .heightIs(44);
        
        _nameLabel.sd_layout.leftSpaceToView(_headerImageView, 7)
        .topSpaceToView(self.contentView, 24)
        .autoWidthRatio(150)
        .heightIs(18);
        
        _timeLabel.sd_layout.rightSpaceToView(self.contentView, 15)
        .topSpaceToView(self.contentView, 26)
        .widthIs(155)
        .heightIs(15);
        
        _contentLabel.sd_layout.leftSpaceToView(_headerImageView, 7)
        .topSpaceToView(_nameLabel, 12)
        .rightSpaceToView(self.contentView, 15)
        .autoHeightRatio(0);
    }
    return self;
}

-(void)setModel:(MyMessagePage *)model
{
    _model = model;
    [_headerImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar] placeholderImage:nil];
    _nameLabel.text = model.nickName;
    _timeLabel.text = model.addTime;
    _contentLabel.text = model.message;
    [self setupAutoHeightWithBottomView:_contentLabel bottomMargin:24];
}

@end

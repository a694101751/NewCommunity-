//
//  AllCommentsTableViewCell.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/21.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "AllCommentsTableViewCell.h"

@interface AllCommentsTableViewCell()
@property (nonatomic, strong)UIImageView * headerImageView;
@property (nonatomic, strong)UILabel * nameLabel;
@property (nonatomic, strong)UILabel * contentLabel;
@end

@implementation AllCommentsTableViewCell

-(instancetype)initWithCellIdentifier:(NSString *)cellID
{
    self = [super initWithCellIdentifier:cellID];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        _headerImageView = [[UIImageView alloc]init];
        _headerImageView.layer.cornerRadius = 35 / 2;
        _headerImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:_headerImageView];
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:SCALEIPHONE6(14)];
        _nameLabel.textColor = [UIColor colorWithRed:88/255.0 green:79/255.0 blue:96/255.0 alpha:1/1.0];
        [self.contentView addSubview:_nameLabel];
        
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _contentLabel.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1/1.0];
        [self.contentView addSubview:_contentLabel];
        
        _headerImageView.sd_layout.leftSpaceToView(self.contentView, 15)
        .topSpaceToView(self.contentView, 16)
        .widthIs(35)
        .heightIs(35);
        
        _nameLabel.sd_layout.leftSpaceToView(_headerImageView, 16)
        .centerYEqualToView(_headerImageView)
        .heightIs(15)
        .autoWidthRatio(200);
        
        _contentLabel.sd_layout.leftSpaceToView(_headerImageView, 16)
        .topSpaceToView(_nameLabel, 16)
        .rightSpaceToView(self.contentView, 15)
        .autoHeightRatio(0);
    }
    return self;
}

-(void)setModel:(AllCommentsPost *)model
{
    _model = model;
    [_headerImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar] placeholderImage:[UIImage imageNamed:@""]];
    _nameLabel.text = model.userName;
    _contentLabel.text = model.message;
    [self setupAutoHeightWithBottomView:_contentLabel bottomMargin:24];
}

@end

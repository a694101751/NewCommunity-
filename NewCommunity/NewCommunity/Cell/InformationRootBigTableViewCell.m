//
//  InformationRootBigTableViewCell.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/21.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "InformationRootBigTableViewCell.h"

@interface InformationRootBigTableViewCell()
@property (nonatomic, strong)UILabel * titleLabel;
@property (nonatomic, strong)UIImageView * titleImageView;
@property (nonatomic, strong)UILabel * commentsLabel;
@property (nonatomic, strong)UIView *lineView;
@end

@implementation InformationRootBigTableViewCell

-(instancetype)initWithCellIdentifier:(NSString *)cellID
{
    self = [super initWithCellIdentifier:cellID];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:SCALEIPHONE6(17)];
        _titleLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1/1.0];
        [self.contentView addSubview:_titleLabel];
        
        _titleImageView = [[UIImageView alloc]init];
        _titleImageView.layer.cornerRadius = 5;
        _titleImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:_titleImageView];
        
        _commentsLabel = [[UILabel alloc] init];
        _commentsLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:SCALEIPHONE6(12)];
        _commentsLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1/1.0];
        [self.contentView addSubview:_commentsLabel];
        
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1/1.0];
        [self.contentView addSubview:_lineView];
        
        _titleLabel.sd_layout.leftSpaceToView(self.contentView, 15).rightSpaceToView(self.contentView, 15).topSpaceToView(self.contentView, 16).autoHeightRatio(0);
        
        _titleImageView.sd_layout.leftSpaceToView(self.contentView, 15)
        .rightSpaceToView(self.contentView, 15)
        .topSpaceToView(_titleLabel, 8)
        .heightIs((SCREEN_WIDTH - 30) / 1.778);
        
        _commentsLabel.sd_layout.leftSpaceToView(self.contentView, 15)
        .topSpaceToView(_titleImageView, 12)
        .heightIs(13)
        .autoWidthRatio(200);
        
        _lineView.sd_layout.leftSpaceToView(self.contentView, 15)
        .rightSpaceToView(self.contentView, 15)
        .topSpaceToView(_commentsLabel, 16)
        .heightIs(1);
    }
    return self;
}

-(void)setModel:(InformationRootListPost *)model
{
    _model = model;
    _titleLabel.text = model.title;
    _commentsLabel.text = [NSString stringWithFormat:@"%@人评论", model.comment];
    [_titleImageView sd_setImageWithURL:[NSURL URLWithString:model.thumb] placeholderImage:[UIImage imageNamed:@""]];
    [self setupAutoHeightWithBottomView:_lineView bottomMargin:1];
}

-(void)setIsProject:(BOOL)isProject
{
    _isProject = isProject;
    if (isProject) {
        _commentsLabel.hidden = YES;
        _lineView.sd_layout.leftSpaceToView(self.contentView, 15)
        .rightSpaceToView(self.contentView, 15)
        .topSpaceToView(_titleImageView, 16)
        .heightIs(1);
    }
    else
    {
        _commentsLabel.hidden = NO;
        _lineView.sd_layout.leftSpaceToView(self.contentView, 15)
        .rightSpaceToView(self.contentView, 15)
        .topSpaceToView(_commentsLabel, 16)
        .heightIs(1);
    }
}

@end

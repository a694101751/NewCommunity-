//
//  InformationRootMoreTableViewCell.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/21.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "InformationRootMoreTableViewCell.h"

@interface InformationRootMoreTableViewCell()
@property (nonatomic, strong)UILabel * titleLabel;
@property (nonatomic, strong)UIImageView * leftImageView;
@property (nonatomic, strong)UIImageView * centerImageView;
@property (nonatomic, strong)UIImageView * rightImageView;
@property (nonatomic, strong)UILabel * commentsLabel;
@property (nonatomic, strong)UIView *lineView;
@end

@implementation InformationRootMoreTableViewCell

-(instancetype)initWithCellIdentifier:(NSString *)cellID
{
    self = [super initWithCellIdentifier:cellID];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:SCALEIPHONE6(17)];
        _titleLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1/1.0];
        [self.contentView addSubview:_titleLabel];
        
        _leftImageView = [[UIImageView alloc]init];
        _leftImageView.layer.cornerRadius = 5;
        _leftImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:_leftImageView];
        
        _centerImageView = [[UIImageView alloc]init];
        _centerImageView.layer.cornerRadius = 5;
        _centerImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:_centerImageView];
        
        _rightImageView = [[UIImageView alloc]init];
        _rightImageView.layer.cornerRadius = 5;
        _rightImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:_rightImageView];
        
        _commentsLabel = [[UILabel alloc] init];
        _commentsLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:SCALEIPHONE6(12)];
        _commentsLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1/1.0];
        [self.contentView addSubview:_commentsLabel];
        
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1/1.0];
        [self.contentView addSubview:_lineView];
        
        _titleLabel.sd_layout.leftSpaceToView(self.contentView, 15)
        .rightSpaceToView(self.contentView, 15)
        .topSpaceToView(self.contentView, 16)
        .autoHeightRatio(0);
        
        _leftImageView.sd_layout.leftSpaceToView(self.contentView, 15)
        .topSpaceToView(_titleLabel, 12)
        .widthIs((SCREEN_WIDTH - 42) / 3)
        .heightIs((SCREEN_WIDTH - 42) / 3.0);
        
        _centerImageView.sd_layout.leftSpaceToView(_leftImageView, 6)
        .topSpaceToView(_titleLabel, 12)
        .widthIs((SCREEN_WIDTH - 42) / 3.0)
        .heightIs((SCREEN_WIDTH - 42) / 3.0);
        
        _rightImageView.sd_layout.rightSpaceToView(self.contentView, 15)
        .topSpaceToView(_titleLabel, 12)
        .widthIs((SCREEN_WIDTH - 42) / 3.0)
        .heightIs((SCREEN_WIDTH - 42) / 3.0);
        
        _commentsLabel.sd_layout.leftSpaceToView(self.contentView, 15)
        .topSpaceToView(_leftImageView, 12)
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
    if (model.photo.count > 0) {
        InformationRootListPhoto * photoModel1 = model.photo[0];
        InformationRootListPhoto * photoModel2 = model.photo[1];
        InformationRootListPhoto * photoModel3 = model.photo[2];
        [_leftImageView sd_setImageWithURL:[NSURL URLWithString:photoModel1.url] placeholderImage:[UIImage imageNamed:@""]];
        [_centerImageView sd_setImageWithURL:[NSURL URLWithString:photoModel2.url] placeholderImage:[UIImage imageNamed:@""]];
        [_rightImageView sd_setImageWithURL:[NSURL URLWithString:photoModel3.url] placeholderImage:[UIImage imageNamed:@""]];
    }
    [self setupAutoHeightWithBottomView:_lineView bottomMargin:1];
}

@end

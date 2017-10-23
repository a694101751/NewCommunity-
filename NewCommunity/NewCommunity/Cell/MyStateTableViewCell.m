//
//  MyStateTableViewCell.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/23.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "MyStateTableViewCell.h"

@interface MyStateTableViewCell()
@property (nonatomic, strong)UILabel * contentLabel;
@property (nonatomic, strong)UIImageView * titleImageView;
@end

@implementation MyStateTableViewCell

-(instancetype)initWithCellIdentifier:(NSString *)cellID
{
    self = [super initWithCellIdentifier:cellID];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:SCALEIPHONE6(28)];
        _timeLabel.textAlignment = NSTextAlignmentRight;
        _timeLabel.textColor = getColor(@"333333");
        [self.contentView addSubview:_timeLabel];
        
        _titleImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:_titleImageView];
        
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:SCALEIPHONE6(16)];
        _contentLabel.textColor = getColor(@"333333");
        [self.contentView addSubview:_contentLabel];
        
        _timeLabel.sd_layout.leftSpaceToView(self.contentView, 10)
        .topSpaceToView(self.contentView, 0)
        .widthIs(SCALEIPHONE6(60))
        .heightIs(28);
        
        _titleImageView.sd_layout.leftSpaceToView(_timeLabel, 12)
        .topEqualToView(self.contentView)
        .heightEqualToWidth(75);
        
        _contentLabel.sd_layout.leftSpaceToView(_titleImageView, 5)
        .topEqualToView(self.contentView)
        .rightSpaceToView(self.contentView, 15)
        .autoHeightRatio(0);
    }
    return self;
}

-(void)setModel:(MyStatePage *)model
{
    _model = model;
    MyStatePhoto * photoModel;
    if (model.photo.count > 0) {
        photoModel = model.photo[0];
    }
    [_titleImageView sd_setImageWithURL:[NSURL URLWithString:photoModel.url] placeholderImage:[UIImage imageNamed:@""]];
    NSString * day = [model.addTime substringWithRange:NSMakeRange(model.addTime.length - 2, 2)];
    NSString * month = [model.addTime substringWithRange:NSMakeRange(5, 2)];
    if ([month integerValue] < 10) {
        month = [NSString stringWithFormat:@"%@月", [month substringFromIndex:1]];
    }
    else
    {
        month = [NSString stringWithFormat:@"%@月", month];
    }
    NSString * str = [NSString stringWithFormat:@"%@%@", day, month];
    NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc]initWithString:str];
    [attStr addAttribute:NSFontAttributeName value:Define_SystemIphone6Font12 range:NSMakeRange(2, month.length)];
    _timeLabel.attributedText = attStr;
    _contentLabel.text = model.content;
    [self setupAutoHeightWithBottomViewsArray:@[_titleImageView, _contentLabel] bottomMargin:8];
}

@end

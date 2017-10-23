//
//  AttentionCommunityTableViewCell.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/22.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "AttentionCommunityTableViewCell.h"

@implementation AttentionCommunityTableViewCell

-(instancetype)initWithCellIdentifier:(NSString *)cellID
{
    self = [super initWithCellIdentifier:cellID];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = Define_SystemIphone6Font16;
        _titleLabel.textColor = getColor(@"333333");
        [self.contentView addSubview:_titleLabel];
        
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setTitle:@"取消关注" forState:UIControlStateSelected];
        [_button setTitle:@"关注" forState:UIControlStateNormal];
        [_button setTitleColor:getColor(@"24c789") forState:UIControlStateNormal];
        _button.titleLabel.font = Define_SystemIphone6Font12;
        _button.layer.cornerRadius = 14;
        _button.layer.borderWidth = 1;
        _button.layer.borderColor = getColor(@"24c789").CGColor;
        _button.layer.masksToBounds = YES;
        [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_button];
        
        _titleLabel.sd_layout.leftSpaceToView(self.contentView, 15)
        .autoWidthRatio(200)
        .centerYEqualToView(self.contentView)
        .heightIs(16);
        
        _button.sd_layout.rightSpaceToView(self.contentView, 15)
        .heightIs(28)
        .widthIs(68)
        .centerYEqualToView(self.contentView);
    }
    return self;
}

-(void)setModel:(AttentionCommunityPage *)model
{
    _model = model;
    _titleLabel.text = model.name;
    _button.selected = YES;
}

-(void)buttonClick:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(cancelButtonClickWithCell:)]) {
        [self.delegate cancelButtonClickWithCell:self];
    }
}

@end

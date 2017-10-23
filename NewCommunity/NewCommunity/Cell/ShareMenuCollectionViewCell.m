//
//  ShareMenuCollectionViewCell.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/22.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "ShareMenuCollectionViewCell.h"

@implementation ShareMenuCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        _button = [QMUIButton buttonWithType:UIButtonTypeCustom];
        _button.imagePosition = QMUIButtonImagePositionTop;
        _button.spacingBetweenImageAndTitle = 10;
        _button.titleLabel.font = Define_SystemIphone6Font12;
        [_button setTitleColor:getColor(@"584f60") forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(shareButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_button];
        
        _button.sd_layout.leftEqualToView(self.contentView)
        .rightEqualToView(self.contentView)
        .topEqualToView(self.contentView)
        .bottomEqualToView(self.contentView);
    }
    return self;
}

-(void)shareButtonClick
{
    if ([self.delegate respondsToSelector:@selector(shareMenuButtonClickWithCell:)]) {
        [self.delegate shareMenuButtonClickWithCell:self];
    }
}

@end

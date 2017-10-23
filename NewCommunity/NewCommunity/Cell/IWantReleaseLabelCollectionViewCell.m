//
//  IWantReleaseLabelCollectionViewCell.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/24.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "IWantReleaseLabelCollectionViewCell.h"

@implementation IWantReleaseLabelCollectionViewCell

-(void)setTitleLabel:(UILabel *)titleLabel
{
    _titleLabel = titleLabel;
    _titleLabel.layer.cornerRadius = 14;
    [_titleLabel.layer setMasksToBounds:YES];
}

@end

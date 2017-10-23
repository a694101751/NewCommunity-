//
//  SearchTableViewCell.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/21.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "SearchTableViewCell.h"

@implementation SearchTableViewCell

-(instancetype)initWithCellIdentifier:(NSString *)cellID
{
    self = [super initWithCellIdentifier:cellID];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        _numberLabel = [[UILabel alloc]init];
        _numberLabel.font = Define_SystemIphone6Font9;
        _numberLabel.textAlignment = NSTextAlignmentCenter;
        _numberLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_numberLabel];
        
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:14];
        _contentLabel.textColor = [UIColor colorWithRed:88/255.0 green:79/255.0 blue:96/255.0 alpha:1/1.0];
        [self.contentView addSubview:_contentLabel];
        
        _stateLabel = [[UILabel alloc]init];
        _stateLabel.font = Define_SystemIphone6Font11;
        _stateLabel.layer.cornerRadius = 7;
        _stateLabel.layer.masksToBounds = YES;
        _stateLabel.textAlignment = NSTextAlignmentCenter;
        _stateLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_stateLabel];
        
        _numberLabel.sd_layout.leftSpaceToView(self.contentView, 15)
        .topSpaceToView(self.contentView, 1)
        .widthIs(15)
        .heightIs(15);
        
        _stateLabel.sd_layout.rightSpaceToView(self.contentView, 15)
        .topSpaceToView(self.contentView, 1)
        .widthIs(25)
        .heightIs(14);
        
        _contentLabel.sd_layout.leftSpaceToView(_numberLabel, 9)
        .topSpaceToView(self.contentView, 1)
        .rightSpaceToView(_stateLabel, 5)
        .heightIs(15);
    }
    return self;
}

@end

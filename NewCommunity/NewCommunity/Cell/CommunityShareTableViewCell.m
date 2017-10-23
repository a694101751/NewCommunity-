//
//  CommunityShareTableViewCell.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/25.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "CommunityShareTableViewCell.h"

@interface CommunityShareTableViewCell()
@end

@implementation CommunityShareTableViewCell

-(instancetype)initWithCellIdentifier:(NSString *)cellID
{
    self = [super initWithCellIdentifier:cellID];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _headerImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:_headerImageView];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:18];
        _titleLabel.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1/1.0];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLabel];
        
        _headerImageView.sd_layout.leftSpaceToView(self.contentView, 15)
        .rightSpaceToView(self.contentView, 15)
        .topSpaceToView(self.contentView, 12)
        .heightIs((SCREEN_WIDTH - 30) / 1.778);
        
        _titleLabel.sd_layout.centerXEqualToView(_headerImageView)
        .centerYEqualToView(_headerImageView)
        .widthIs(SCREEN_WIDTH)
        .heightIs((SCREEN_WIDTH - 30) / 1.778);
    }
    return self;
}

@end

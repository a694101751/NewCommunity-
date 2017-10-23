//
//  InformationActivitiesTableViewCell.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/30.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "InformationActivitiesTableViewCell.h"

@implementation InformationActivitiesTableViewCell

-(instancetype)initWithCellIdentifier:(NSString *)cellID
{
    self = [super initWithCellIdentifier:cellID];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _headerImageView = [[UIImageView alloc]init];
        _headerImageView.layer.cornerRadius = 5;
        _headerImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:_headerImageView];
        
        _headerImageView.sd_layout.leftSpaceToView(self.contentView, 15)
        .rightSpaceToView(self.contentView, 15)
        .topSpaceToView(self.contentView, 16)
        .heightIs((SCREEN_WIDTH - 30) / 2.40);
        
        [self setupAutoHeightWithBottomView:_headerImageView bottomMargin:1];
    }
    return self;
}

@end

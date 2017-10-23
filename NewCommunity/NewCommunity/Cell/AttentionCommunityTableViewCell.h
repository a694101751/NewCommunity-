//
//  AttentionCommunityTableViewCell.h
//  NewCommunity
//
//  Created by Aaron on 2017/9/22.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "SmartTableViewCell.h"

@class AttentionCommunityTableViewCell;

@protocol AttentionCommunityTableViewCellDelegate <NSObject>

-(void)cancelButtonClickWithCell:(AttentionCommunityTableViewCell *)cell;

@end

@interface AttentionCommunityTableViewCell : SmartTableViewCell
@property (nonatomic, strong)UILabel * titleLabel;
@property (nonatomic, strong)UIButton * button;
@property (nonatomic, strong)AttentionCommunityPage * model;
@property (nonatomic, weak)id<AttentionCommunityTableViewCellDelegate>delegate;
@end

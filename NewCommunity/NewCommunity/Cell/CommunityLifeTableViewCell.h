//
//  CommunityLifeTableViewCell.h
//  NewCommunity
//
//  Created by Aaron on 2017/9/25.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "SmartTableViewCell.h"
@class CommunityLifeTableViewCell;
typedef void(^CommunityLifeBlock)(NSArray *, NSInteger, NSArray *);
@protocol CommunityLifeTableViewCellDelegate <NSObject>

-(void)thumbButtonSelected:(QMUIButton *)sender WithCell:(CommunityLifeTableViewCell *)cell;

@end
/**
 社区生活 Cell样式
 */
@interface CommunityLifeTableViewCell : SmartTableViewCell
@property (nonatomic, strong)CommunityLifeListPage * model;
@property (nonatomic, copy)CommunityLifeBlock block;
@property (nonatomic, weak)id<CommunityLifeTableViewCellDelegate>delegate;
@end

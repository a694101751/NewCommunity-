//
//  CommunityShareDetailsTableViewCell.h
//  NewCommunity
//
//  Created by Aaron on 2017/9/25.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "SmartTableViewCell.h"

@protocol CommunityShareDetailsTableViewCellDelegate <NSObject>

-(void)focusButtonClick;
-(void)shareButtonClick;

@end

/**
 通知详情 Cell样式
 */
@interface CommunityShareDetailsTableViewCell : SmartTableViewCell
@property (nonatomic, strong)UIView * titleView;
@property (nonatomic, strong)NSString * focuString;
@property (nonatomic, strong)CommunityNotificationPost * model;
@property (nonatomic, weak)id<CommunityShareDetailsTableViewCellDelegate>delegate;
@end

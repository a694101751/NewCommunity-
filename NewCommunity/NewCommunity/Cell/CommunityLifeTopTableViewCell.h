//
//  CommunityLifeTopTableViewCell.h
//  NewCommunity
//
//  Created by Aaron on 2017/9/26.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "SmartTableViewCell.h"

typedef void(^CommunityLifeTopBlock)(NSInteger);

/**
 社区生活 上面Cell样式
 */
@interface CommunityLifeTopTableViewCell : SmartTableViewCell
@property (nonatomic, strong)NSArray * dataArray;
@property (nonatomic, copy)CommunityLifeTopBlock block;
@end

//
//  CommunityLifeCollectionTableViewCell.h
//  NewCommunity
//
//  Created by Aaron on 2017/9/26.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "SmartTableViewCell.h"

typedef void(^CommenityLifeBlock)(NSString *);

/**
 社区生活 你感兴趣的Cell样式
 */
@interface CommunityLifeCollectionTableViewCell : SmartTableViewCell
@property (nonatomic, strong)NSArray * dataArray;
@property (nonatomic, copy)CommenityLifeBlock block;
@end

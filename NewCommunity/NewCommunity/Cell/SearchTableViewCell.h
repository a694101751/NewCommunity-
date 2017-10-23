//
//  SearchTableViewCell.h
//  NewCommunity
//
//  Created by Aaron on 2017/9/21.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "SmartTableViewCell.h"

/**
 搜索 今日热点Cell样式
 */
@interface SearchTableViewCell : SmartTableViewCell
@property (nonatomic, strong)UILabel * numberLabel;
@property (nonatomic, strong)UILabel * stateLabel;
@property (nonatomic, strong)UILabel * contentLabel;
@end

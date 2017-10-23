//
//  InformationRootBigTableViewCell.h
//  NewCommunity
//
//  Created by Aaron on 2017/9/21.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "SmartTableViewCell.h"
/**
 资讯首页 大图片Cell样式
 */
@interface InformationRootBigTableViewCell : SmartTableViewCell
@property (nonatomic, assign)BOOL isProject;
@property (nonatomic, strong)InformationRootListPost * model;
@end

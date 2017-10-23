//
//  CommunitySearchViewController.h
//  NewCommunity
//
//  Created by Aaron on 2017/9/23.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "BaseViewController.h"

typedef NS_ENUM(NSInteger,SearchRootType)
{
    SearchRootTypeCommunityIn = 0,       //社区入住搜索
    SearchRootTypeConvenienceYellowPages,//便民黄页搜索
};

@interface CommunitySearchViewController : BaseViewController
@property (nonatomic, assign)SearchRootType type;
@end

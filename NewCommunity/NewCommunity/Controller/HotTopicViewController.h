//
//  HotTopicViewController.h
//  NewCommunity
//
//  Created by Aaron on 2017/9/26.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "BaseViewController.h"

typedef NS_ENUM(NSInteger,HotTopicType)
{
    HotTopicTypeHotTopic = 0,       //热点话题
    HotTopicTypeCareAbout,           //你关心的
};

@interface HotTopicViewController : BaseViewController
@property (nonatomic, assign)HotTopicType type;
@end

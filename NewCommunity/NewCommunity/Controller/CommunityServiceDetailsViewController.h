//
//  CommunityServiceDetailsViewController.h
//  NewCommunity
//
//  Created by Aaron on 2017/9/25.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "BaseViewController.h"

typedef NS_ENUM(NSInteger,DetailsType)
{
    DetailsTypeCommunityPublicAnnouncement = 0,       //社区公告详情
    DetailsTypeCommunityTopic,                        //社区话题详情
    DetailsTypeHotTopic                               //政务话题详情
};

/**
 社区公告详情
 */
@interface CommunityServiceDetailsViewController : BaseViewController
@property(nonatomic, assign)DetailsType type;
@property (nonatomic, strong)NSString * kid;
@end

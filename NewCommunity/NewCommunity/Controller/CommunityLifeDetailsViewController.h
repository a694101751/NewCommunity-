//
//  CommunityLifeDetailsViewController.h
//  NewCommunity
//
//  Created by Aaron on 2017/9/25.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "BaseViewController.h"

typedef NS_ENUM(NSInteger,CommunityLifeDetailsType)
{
    CommunityLifeDetailsTypeList = 0,  //从列表进入
    CommunityLifeDetailsTypeMyState,   //从我的状态进入
    CommunityLifeDetailsTypeMyMessage   //从我的消息进入
};

@protocol CommunityLifeDetailsViewControllerDelegate <NSObject>

-(void)praiseWithState:(BOOL)state indexPath:(NSIndexPath *)indexPath;
-(void)commentsWithCount:(NSInteger)count indexPath:(NSIndexPath *)indexPath;
@end

/**
 社区生活详情
 */
@interface CommunityLifeDetailsViewController : BaseViewController
@property (nonatomic, strong)NSDictionary * model;
@property (nonatomic, strong)NSString * kid;
@property (nonatomic, strong)NSIndexPath * indexPath;
@property (nonatomic, assign)CommunityLifeDetailsType detailsType;
@property (nonatomic, strong)MyMessagePage * messageModel;
@property (nonatomic, weak)id<CommunityLifeDetailsViewControllerDelegate>delegate;
@end

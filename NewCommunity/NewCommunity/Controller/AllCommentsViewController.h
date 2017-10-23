//
//  AllCommentsViewController.h
//  NewCommunity
//
//  Created by Aaron on 2017/9/21.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "BaseViewController.h"

@protocol AllCommentsViewControllerDelegate <NSObject>

-(void)collectionWithState:(BOOL)state;

@end

/**
 全部评论
 */
@interface AllCommentsViewController : BaseViewController
@property (nonatomic, assign)BOOL isCommunity;
@property (nonatomic, strong)DetailsModel * model;
@property (nonatomic, strong)CommunityTopicDetailsModel * topicModel;
@property (nonatomic, strong)NSString * postId;
@property (nonatomic, weak)id<AllCommentsViewControllerDelegate>delegate;
@end

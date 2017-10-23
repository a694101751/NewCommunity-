//
//  InformationRootTableViewCell.h
//  NewCommunity
//
//  Created by Aaron on 2017/9/21.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "SmartTableViewCell.h"
#import "GovernmentAffairsPost.h"
#import "CommunityTopicPage.h"
/**
 资讯首页右侧图片Cell样式
 */
@interface InformationRootTableViewCell : SmartTableViewCell
@property (nonatomic, strong)InformationRootListPost * model;
@property (nonatomic, strong)DetailsPostRecommendList * detailModel;
@property (nonatomic, strong)MyCollectionPost * collectionModel;
@property (nonatomic, strong)GovernmentAffairsPost * topicModel;
@property (nonatomic, strong)CommunityTopicPage * communityTopicModel;
@property (nonatomic, strong)ProjectDetailsPostRecommendList * projectModel;
@property (nonatomic, assign)BOOL isTop;
@end

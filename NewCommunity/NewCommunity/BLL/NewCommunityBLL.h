//
//  NewCommunityBLL.h
//  NewCommunity
//
//  Created by Aaron on 2017/9/19.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "InformationRootModel.h"
#import "InformationRootListModel.h"
#import "DetailsModel.h"
#import "SearchForInformationModel.h"
#import "AllCommentsModel.h"
#import "GovernmentAffairsModel.h"
#import "VerificationCodeModel.h"
#import "GovernmentAffairsRootModel.h"
#import "CommunityShareModel.h"
#import "CommunityLifeModel.h"
#import "CommunityLifeListModel.h"
#import "CommunityLifeDetailsModel.h"
#import "CommunityLifeDetailsCommentListModel.h"
#import "LoginModel.h"
#import "StreetAreaModel.h"
#import "ModifyInformationModel.h"
#import "CommunityServiceModel.h"
#import "CommunityTopicModel.h"
#import "CommunityTopicDetailsModel.h"
#import "CommunityPublicAnnouncementModel.h"
#import "CommunityPublicAnnouncementDetailsModel.h"
#import "PropertyServiceModel.h"
#import "MyStateModel.h"
#import "AttentionCommunityModel.h"
#import "UploadAvatarModel.h"
#import "MyCollectionModel.h"
#import "MyMessageModel.h"
#import "CommunityNotificationModel.h"
#import "OneCommentModel.h"
#import "InformationActivitiesModel.h"
#import " EventDetailsModel.h"
#import "SearchResultsModel.h"
#import "UnreadMessagesModel.h"
#import "ProjectDetailsModel.h"
#import "StayFocusedModel.h"

#pragma mark - 网络请求
@interface NewCommunityBLL : NSObject

/**
 网络请求基础类库

 @param url 接口请求地址
 @param paramers 字典类型集合
 @param view view
 @param block 块对象
 @return .
 */
+ (NSURLSessionDataTask *)bodyStringUrl:(NSString *)url paramers:(id)paramers  andShowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(id JSON, NSError *error))block;

/**
 *  网络请求基础类库(带cookie)
 *
 *  @param url      接口请求地址
 *  @param paramers 字典类型集合
 *  @param dictCookie cookie字典
 *  @param view     view
 *  @param block    块对象
 *
 *  @return .
 */
+ (NSURLSessionDataTask *)bodyStringUrl:(NSString *)url paramers:(id)paramers andNSCookieInfo:(NSDictionary *)dictCookie andShowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(id JSON, NSError *error))block;

/**
 上传图片

 @param baseUrl 接口请求地址
 @param parameter 子典型参数集合
 @param imageArray 图片数组
 @param view view
 @param block 块对象
 @return 。
 */
-(NSURLSessionDataTask *)updateLoadPicDataForBaseURL:(NSString *)baseUrl paramers:(id)parameter andImageArray:(NSArray *)imageArray andshowHUDInView:(UIView *)view  resultPostsWithBlock:(void (^)(UploadAvatarModel * model, NSError *error))block;
/**
 *  下载文件
 *
 *  @param linkUrl 下载地址
 *  @param view    当前view
 *  @param success 块对象
 *  @param failure 块对象
 *
 *  @return .
 */
+(NSURLSessionDownloadTask *)downLoadDataForRequestUrl:(NSString *)linkUrl andShowHUDInView:(UIView *)view success:(void (^)(NSURLSessionDownloadTask *task, id responseObject))success  failure:(void (^)(NSURLSessionDownloadTask *task, NSError *error))failure;

#pragma mark - 登录

/**
 获取验证码

 @param view view
 @param block 块对象
 @return 。 
 */
+(NSURLSessionDataTask *)verificationCodePhone:(NSString *)phone  andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(VerificationCodeModel * model, NSError *error))block;

/**
 登录

 @param account 手机号
 @param sms 验证码
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)loginAccount:(NSString *)account sms:(NSString *)sms andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(LoginModel * model, NSError *error))block;

#pragma mark - 资讯

/**
 资讯 - 要闻轮播图
 @param view View
 @param block 块对象
 @return .
 */
+(NSURLSessionDataTask *)importantandshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(InformationRootModel * model, NSError *error))block;

/**
 资讯 - 要闻列表

 @param page 当前页
 @param rows 每页条数
 @param view View
 @param block 块对象
 @return .
 */
+(NSURLSessionDataTask *)importantListPage:(NSInteger)page rows:(NSInteger)rows andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(InformationRootListModel * model, NSError *error))block;
/**
 资讯 - 社区轮播图
 @param view View
 @param block 块对象
 @return .
 */
+(NSURLSessionDataTask *)informationCommunityBannerandshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(InformationRootModel * model, NSError *error))block;
/**
 资讯 - 社区列表
 
 @param page 当前页
 @param rows 每页条数
 @param view View
 @param block 块对象
 @return .
 */
+(NSURLSessionDataTask *)informationCommunityPage:(NSInteger)page rows:(NSInteger)rows andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(InformationRootListModel * model, NSError *error))block;

/**
 资讯 - 专题轮播图
 @param view View
 @param block 块对象
 @return .
 */
+(NSURLSessionDataTask *)informationProjectBannerandshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(InformationRootModel * model, NSError *error))block;
/**
 资讯 - 专题列表
 
 @param page 当前页
 @param rows 每页条数
 @param view View
 @param block 块对象
 @return .
 */
+(NSURLSessionDataTask *)informationProjectPage:(NSInteger)page rows:(NSInteger)rows andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(InformationRootListModel * model, NSError *error))block;

/**
 资讯详情

 @param kid 文章ID
 @param view view
 @param block 块对象
 @return .
 */
+(NSURLSessionDataTask *)detailsListId:(NSInteger)kid Url:(NSString *)url andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(DetailsModel * model, NSError *error))block;

/**
 资讯搜索列表

 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)informationSearchListingsandshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(SearchForInformationModel * model, NSError *error))block;

/**
 搜索资讯

 @param title 关键字
 @param page 当前页
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)searchForInformationWithTitle:(NSString *)title page:(NSInteger)page andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(SearchResultsModel * model, NSError *error))block;

/**
 全部评论

 @param postid 文章ID
 @param page 当前页
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)allCommentsPostid:(NSString *)postid page:(NSInteger)page andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(AllCommentsModel * model, NSError *error))block;

/**
 资讯 添加评论

 @param kid 用户id
 @param postId 文章ID
 @param message 评论内容
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)addCommentsMemeerId:(NSString *)kid postId:(NSString *)postId message:(NSString *)message andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ModifyInformationModel * model, NSError *error))block;

/**
 资讯 收藏

 @param postId 文章ID
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)collectionpostId:(NSString *)postId type:(NSString *)type andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ModifyInformationModel * model, NSError *error))block;

/**
 取消收藏

 @param postId 文章ID
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)cancelCollectionpostId:(NSString *)postId andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ModifyInformationModel * model, NSError *error))block;

/**
 资讯活动

 @param page 当前页
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)informationActivitiesPage:(NSInteger)page andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(InformationActivitiesModel * model, NSError *error))block;

/**
 活动报名

 @param name 姓名
 @param phone 电话号码
 @param club 社区
 @param activityId 活动ID
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)enrollmentName:(NSString *)name phone:(NSString *)phone club:(NSString *)club activityId:(NSString *)activityId andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ModifyInformationModel * model, NSError *error))block;

/**
 活动详情

 @param kid 活动ID
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)eventDetailsID:(NSString *)kid andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(EventDetailsModel * model, NSError *error))block;

/**
 专题详情

 @param kid 新闻id
 @param view View
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)projectDetailsId:(NSString *)kid andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ProjectDetailsModel * model, NSError *error))block;

#pragma mark - 政务相关接口

/**
 政务相关话题

 @param page 当前页
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)governmentAffairsPage:(NSInteger)page andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(GovernmentAffairsModel * model, NSError *error))block;

/**
 政务 你关心的

 @param page 当前页
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)governmentAffairscareAboutPage:(NSInteger)page andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(GovernmentAffairsModel * model, NSError *error))block;

/**
 政务首页

 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)governmentAffairsRootandshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(GovernmentAffairsRootModel * model, NSError *error))block;

#pragma mark - 社区相关接口

/**
 社区共享接口

 @param view view
 @param block 块对象   
 */
+(NSURLSessionDataTask *)communityShareandshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(CommunityShareModel * model, NSError *error))block;

/**
 社区生活接口

 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)communityLifeandshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(CommunityLifeModel * model, NSError *error))block;

/**
 社区生活列表

 @param order 最新或最热
 @param page 当前页
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)communityLifeListOrder:(NSString *)order lifeType:(NSInteger)lifeType page:(NSInteger)page ndshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(CommunityLifeListModel * model, NSError *error))block;

/**
 社区生活详情

 @param kid 社区详情id
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)communityLifeDetailsID:(NSString *)kid andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(CommunityLifeDetailsModel * model, NSError *error))block;

/**
 社区生活评论列表

 @param kid 社区详情id
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)communityLifeDetailsCommentListID:(NSString *)kid page:(NSInteger)page andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(CommunityLifeDetailsCommentListModel * model, NSError *error))block;

/**
 社区服务

 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)communityServiceandshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(CommunityServiceModel * model, NSError *error))block;

/**
 社区话题列表

 @param areaId 区域ID
 @param clubId 社区ID
 @param page 当前页
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)communityTopicAreaId:(NSString *)areaId clubID:(NSString *)clubId page:(NSInteger)page andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(CommunityTopicModel * model, NSError *error))block;

/**
 社区话题详情

 @param kid 社区话题ID
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)communityTopicDetailsId:(NSString *)kid andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(CommunityTopicDetailsModel * model, NSError *error))block;

/**
 社区生活举报

 @param objType 举报类型0：二手交易，1：交友
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)communityReportobjType:(NSString *)objType objId:(NSString *)objId andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ModifyInformationModel * model, NSError *error))block;

/**
 社区公告

 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)communityPublicAnnouncementPage:(NSInteger)page  andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(CommunityPublicAnnouncementModel * model, NSError *error))block;

/**
 社区生活添加评论

 @param lifeId 文章ID
 @param message 评论内容
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)communityAddCommentslifeId:(NSString *)lifeId message:(NSString *)message andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ModifyInformationModel * model, NSError *error))block;

/**
 社区公告详情

 @param lifeId 公告ID
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)communityPublicAnnouncementDetailsId:(NSString *)lifeId andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(CommunityPublicAnnouncementDetailsModel * model, NSError *error))block;

/**
 社区服务

 @param view view
 @param block kuaiduix
 @return 。
 */
+(NSURLSessionDataTask *)communityandshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(PropertyServiceModel * model, NSError *error))block;

/**
 物业服务

 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)propertyServiceandshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(PropertyServiceModel * model, NSError *error))block;

/**
 社区生活点赞

 @param lifeId 文章ID
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)communityPraiseLifeId:(NSString *)lifeId andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ModifyInformationModel * model, NSError *error))block;
/**
 社区生活 取消点赞
 
 @param lifeId 文章ID
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)communityCancelPraiseLifeId:(NSString *)lifeId andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ModifyInformationModel * model, NSError *error))block;

/**
 发布社区生活

 @param content 内容
 @param lifeType 标签
 @param photo 图片
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)releaseContent:(NSString *)content lifeType:(NSInteger)lifeType photo:(NSString *)photo andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ModifyInformationModel * model, NSError *error))block;

/**
 回复评论

 @param lifeId 文章ID
 @param message 回复内容
 @param commentId 回复的评论ID
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)replyToCommentLifeId:(NSString *)lifeId message:(NSString *)message commentId:(NSString *)commentId andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ModifyInformationModel * model, NSError *error))block;

/**
 一条评论

 @param kid 评论ID
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)oneCommentListId:(NSString *)kid andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(OneCommentModel * model, NSError *error))block;

/**
 删除社区生活

 @param kid 生活ID
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)deletelifeId:(NSString *)kid andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ModifyInformationModel * model, NSError *error))block;

/**
 社区通知列表

 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)communityNotificationListandshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(CommunityNotificationModel * model, NSError *error))block;

/**
 用户关注社区通知

 @param page 当前页
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)focusCommunityNotificationPage:(NSInteger)page andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(CommunityNotificationModel * model, NSError *error))block;

/**
 社区话题添加评论

 @param lifeId 社区话题id
 @param message 内容
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)addTopicCommentLifeId:(NSString *)lifeId message:(NSString *)message andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ModifyInformationModel * model, NSError *error))block;

/**
 社区话题全部评论列表

 @param lifeId 社区话题ID
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)communityTopicCommentsLifeId:(NSString *)lifeId page:(NSInteger)page andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(AllCommentsModel * model, NSError *error))block;

#pragma mark - 个人中心

/**
 区域列表

 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)streetAreaandshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(StreetAreaModel * model, NSError *error))block;

/**
 社区列表

 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)streetAreaId:(NSString *)areaId andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(StreetAreaModel * model, NSError *error))block;

/**
 街道列表

 @param areaId 区域ID
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)theStreetAreaId:(NSString *)areaId andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(StreetAreaModel * model, NSError *error))block;

/**
 修改个人信息

 @param kid 用户id
 @param areaId 地区id
 @param clubId 社区id
 @param nickName 昵称
 @param userName 用户名字
 @param avatar 头像地址
 @param address 地址
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)modifyTheInformationID:(NSString *)kid areaId:(NSString *)areaId clubId:(NSString *)clubId nickName:(NSString *)nickName userName:(NSString *)userName avatar:(NSString *)avatar address:(NSString *)address subdistrictId:(NSString *)subdistrictId addressAareaId:(NSString *)addressAareaId andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ModifyInformationModel * model, NSError *error))block;

/**
 我的状态

 @param view view
 @param block kuaiduix
 @return 。
 */
+(NSURLSessionDataTask *)myStateandshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(MyStateModel * model, NSError *error))block;

/**
 意见反馈

 @param content 反馈内容
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)feedbackContent:(NSString *)content ndshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ModifyInformationModel * model, NSError *error))block;

/**
 个人中心 关注社区

 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)attentionCommunityandshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(AttentionCommunityModel * model, NSError *error))block;

/**
 添加关注社区

 @param clubId 社区ID
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)addUserClubId:(NSString *)clubId andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ModifyInformationModel * model, NSError *error))block;

/**
 取消社区关注

 @param clubId 社区ID
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)deleteUserClubId:(NSString *)clubId andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ModifyInformationModel * model, NSError *error))block;

/**
 我的收藏

 @param page 当前页
 @param view view
 @param block 。
 @return 。
 */
+(NSURLSessionDataTask *)myCollectionPage:(NSInteger)page andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(MyCollectionModel * model, NSError *error))block;

/**
 我的消息

 @param page 当前页
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)myMessagePage:(NSInteger)page andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(MyMessageModel * model, NSError *error))block;

/**
 查询未读消息数

 @param view View
 @param block 块对象
 @return .
 */
+(NSURLSessionDataTask *)unreadMessagesandshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(UnreadMessagesModel * model, NSError *error))block;

/**
 未关注社区列表

 @param areaId 区域ID
 @param view view
 @param block 块对象
 @return 。
 */
+(NSURLSessionDataTask *)stayFocusedAreaId:(NSString *)areaId andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(StayFocusedModel * model, NSError *error))block;
@end

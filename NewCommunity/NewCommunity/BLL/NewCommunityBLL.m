//
//  NewCommunityBLL.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/19.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "NewCommunityBLL.h"

@implementation NewCommunityBLL
//网络请求基础
+ (NSURLSessionDataTask *)bodyStringUrl:(NSString *)url paramers:(id)paramers andShowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(id JSON, NSError *error))block{
    
    MBProgressHUD *HUD;
    
    if (view) {
        HUD  = [MBProgressHUD showHUDAddedTo:view animated:YES];
        HUD.userInteractionEnabled = YES;
    }
    
    return [[AFAppDotNetAPIClient sharedClient]POST:url parameters:paramers progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable JSON) {
        [MBProgressHUD hideHUDForView:view animated:YES];
        if (block) {
            block(JSON,nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [MBProgressHUD hideHUDForView:view animated:YES];
        if (block) {
            block(nil,error);
        }
    }];
}

//网络请求基础（带cookie）
+ (NSURLSessionDataTask *)bodyStringUrl:(NSString *)url paramers:(id)paramers andNSCookieInfo:(NSDictionary *)dictCookie andShowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(id JSON, NSError *error))block{
    
    MBProgressHUD *HUD;
    
    if (view) {
        HUD  = [MBProgressHUD showHUDAddedTo:view animated:YES];
        HUD.userInteractionEnabled = YES;
    }
    
    
    AFHTTPSessionManager *manager =[AFAppDotNetAPIClient sharedClient];
    //此处必须默认为yes
    [manager.requestSerializer setHTTPShouldHandleCookies:YES];
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"%@=%@",@"usertoken",@"57386290b42bd82cee08dd25d5adff5a146ea691"] forHTTPHeaderField:@"Cookie"];
    
    return [[AFAppDotNetAPIClient sharedClient]POST:url parameters:paramers progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable JSON) {
        [MBProgressHUD hideHUDForView:view animated:YES];
        if (block) {
            block(JSON,nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [MBProgressHUD hideHUDForView:view animated:YES];
        if (block) {
            block(nil,error);
        }
    }];
    
}
//上传视频文件
-(NSURLSessionDataTask *)updateLoadPicDataForBaseURL:(NSString *)baseUrl paramers:(id)parameter
                                     andFileNameData:(NSData *)data andshowHUDInView:(UIView *)view andNSDictionary:(NSDictionary *)Info  resultPostsWithBlock:(void (^)(id responseObject, NSError *error))block{
    NSMutableURLRequest *request =
    [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST"//请求方法为post
                                                               URLString:baseUrl//上传文件URL
                                                              parameters:parameter//上传的其他参数
                                               constructingBodyWithBlock:^(id<AFMultipartFormData> formData)//设置请求体
     {
         [formData appendPartWithFileData:data//音乐媒体文件的data对象
                                     name:@"multipartFile"//与数据关联的参数名称，不能为nil
                                 fileName:@"fileName.mp4"//上传的文件名，不能为nil
                                 mimeType:@"audio/mp4"];//MIME类型(例如：图片为image/jpeg.) 可以参照 http://www.iana.org/assignments/media-types/. ，不能为nil
     } error:nil];
    
    return   [self updateLoadDataForRequest:request andShowHUDInView:view success:^(NSURLSessionDataTask * __unused task, id responseObject){
        if (block) {
            block(responseObject,nil);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error){
        if (block) {
            block(nil,error);
        }
    }];
}
//上传图片
-(NSURLSessionDataTask *)updateLoadPicDataForBaseURL:(NSString *)baseUrl paramers:(id)parameter andImageArray:(NSArray *)imageArray andshowHUDInView:(UIView *)view  resultPostsWithBlock:(void (^)(UploadAvatarModel * model, NSError *error))block{
    
    MBProgressHUD *HUD;
    
    if (view) {
        HUD  = [MBProgressHUD showHUDAddedTo:view animated:YES];
        HUD.userInteractionEnabled = YES;
    }
    
    NSString *stringUrl = [[NSURL URLWithString:baseUrl relativeToURL:[AFAppDotNetAPIClient sharedClient].baseURL] absoluteString];
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:stringUrl parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        for (int i = 0 ; i < [imageArray count]; i ++) {
            UIImage *image = imageArray[i];
            NSData *data = data = UIImageJPEGRepresentation(image, 0.05);
            [formData appendPartWithFileData:data name:@"multipartFile" fileName:@"file" mimeType:@"multipart/form-data"];
        }
    } error:nil];

    return  [self updateLoadDataForRequest:request andShowHUDInView:view success:^(NSURLSessionDataTask * __unused task, id responseObject){
        [MBProgressHUD hideHUDForView:view animated:YES];
        UploadAvatarModel * model = [[UploadAvatarModel alloc]initWithDictionary:responseObject];
        if (block) {
            block(model,nil);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error){
        [MBProgressHUD hideHUDForView:view animated:YES];
        if (block) {
            block(nil,error);
        }
    }];
}
//上传文件基础类库
-(NSURLSessionDataTask *)updateLoadDataForRequest:(NSMutableURLRequest *)request andShowHUDInView:(UIView *)view success:(void (^)(NSURLSessionDataTask *task, id responseObject))success  failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionUploadTask * uploadTask = [manager uploadTaskWithStreamedRequest:request progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            if (failure) {
                failure(uploadTask, error);
            }
        } else {
            if (success) {
                success(uploadTask, responseObject);
            }
        }
    }];
    
    [uploadTask resume];
    return uploadTask;
}

//下载文件基础类库
+(NSURLSessionDownloadTask *)downLoadDataForRequestUrl:(NSString *)linkUrl andShowHUDInView:(UIView *)view success:(void (^)(NSURLSessionDownloadTask *task, id responseObject ))success  failure:(void (^)(NSURLSessionDownloadTask *task, NSError *error))failure{
    
    NSString *urlString  =[linkUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [ manager setDownloadTaskDidWriteDataBlock:^(NSURLSession * _Nonnull session, NSURLSessionDownloadTask * _Nonnull downloadTask, int64_t bytesWritten, int64_t totalBytesWritten, int64_t totalBytesExpectedToWrite) {
        
    }];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        // 指定下载文件保存的路径
        NSLog(@"%@ %@", targetPath, response.suggestedFilename);
        // 将下载文件保存在缓存路径中
        
        // 将下载文件保存在缓存路径中
        NSString *cacheDir = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
        NSString *path = [cacheDir stringByAppendingPathComponent:response.suggestedFilename];
        
        //NSString *path = [self launchVideoPathForURL:linkUrl];
        
        //URLWithString返回的是网络的URL,如果使用本地URL,需要注意
        NSURL *fileURL1 = [NSURL URLWithString:path];
        NSURL *fileURL = [NSURL fileURLWithPath:path];
        
        NSLog(@"== %@ |||| %@", fileURL1, fileURL);
        
        return fileURL;
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        NSLog(@"%@ %@", filePath, error);
        if (error) {
            if (failure) {
                failure(downloadTask, error);
            }
        } else {
            if (success) {
                success(downloadTask, filePath);
            }
        }
    }];
    [downloadTask resume];
    return downloadTask;
}

#pragma mark - 登录
+(NSURLSessionDataTask *)verificationCodePhone:(NSString *)phone  andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(VerificationCodeModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"phoneNumber":phone};
    return [self bodyStringUrl:@"cms/user/code.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            VerificationCodeModel * model = [[VerificationCodeModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//登录
+(NSURLSessionDataTask *)loginAccount:(NSString *)account sms:(NSString *)sms andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(LoginModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"account":account,
                                 @"sms":sms
                                 };
    return [self bodyStringUrl:@"cms/user/userDetail.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            LoginModel * model = [[LoginModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}

#pragma mark - 资讯
//资讯 - 要闻轮播图
+(NSURLSessionDataTask *)importantandshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(InformationRootModel * model, NSError *error))block
{
    return [self bodyStringUrl:@"cms/post/important.action" paramers:nil andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            InformationRootModel * model = [[InformationRootModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//资讯 - 要闻列表
+(NSURLSessionDataTask *)importantListPage:(NSInteger)page rows:(NSInteger)rows andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(InformationRootListModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"page":@(page),
                                 @"rows":@(rows)};
    return [self bodyStringUrl:@"cms/post/next_important.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            InformationRootListModel * model = [[InformationRootListModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//资讯 - 社区轮播图
+(NSURLSessionDataTask *)informationCommunityBannerandshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(InformationRootModel * model, NSError *error))block
{
    return [self bodyStringUrl:@"cms/post/club.action" paramers:nil andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            InformationRootModel * model = [[InformationRootModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//资讯 - 社区列表
+(NSURLSessionDataTask *)informationCommunityPage:(NSInteger)page rows:(NSInteger)rows andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(InformationRootListModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"page":@(page),
                                 @"rows":@(rows)};
    return [self bodyStringUrl:@"cms/post/next_club.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            InformationRootListModel * model = [[InformationRootListModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
// 资讯 - 专题轮播图
+(NSURLSessionDataTask *)informationProjectBannerandshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(InformationRootModel * model, NSError *error))block
{
    return [self bodyStringUrl:@"cms/post/topic.action" paramers:nil andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            InformationRootModel * model = [[InformationRootModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
// 资讯 - 专题列表
+(NSURLSessionDataTask *)informationProjectPage:(NSInteger)page rows:(NSInteger)rows andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(InformationRootListModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"page":@(page),
                                 @"rows":@(rows)};
    return [self bodyStringUrl:@"cms/post/next_topic.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            InformationRootListModel * model = [[InformationRootListModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//资讯详情
+(NSURLSessionDataTask *)detailsListId:(NSInteger)kid Url:(NSString *)url andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(DetailsModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"id":@(kid),
                                 @"userId":[User sharedInstanced].ATP_acessToken.length > 0 ? [User sharedInstanced].ATP_acessToken : @"-1"
                                 };
    return [self bodyStringUrl:url paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            DetailsModel * model = [[DetailsModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//资讯搜索列表
+(NSURLSessionDataTask *)informationSearchListingsandshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(SearchForInformationModel * model, NSError *error))block
{
    return [self bodyStringUrl:@"cms/post/postClickList.action" paramers:nil andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            SearchForInformationModel * model = [[SearchForInformationModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//搜索资讯
+(NSURLSessionDataTask *)searchForInformationWithTitle:(NSString *)title page:(NSInteger)page andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(SearchResultsModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"title":title,
                                 @"page":@(page)
                                 };
    return [self bodyStringUrl:@"cms/post/search.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            SearchResultsModel * model = [[SearchResultsModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//全部评论
+(NSURLSessionDataTask *)allCommentsPostid:(NSString *)postid page:(NSInteger)page andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(AllCommentsModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"postId":postid,
                                 @"page":@(page)
                                 };
    return [self bodyStringUrl:@"cms/comment/commentList.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            AllCommentsModel * model = [[AllCommentsModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//资讯 添加评论
+(NSURLSessionDataTask *)addCommentsMemeerId:(NSString *)kid postId:(NSString *)postId message:(NSString *)message andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ModifyInformationModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"postId":postId,
                                 @"memberId":kid,
                                 @"message":message
                                 };
    return [self bodyStringUrl:@"cms/comment/add.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            ModifyInformationModel * model = [[ModifyInformationModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//资讯 收藏
+(NSURLSessionDataTask *)collectionpostId:(NSString *)postId type:(NSString *)type andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ModifyInformationModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"postId":postId,
                                 @"userId":[User sharedInstanced].ATP_acessToken,
                                 @"type":type
                                 };
    return [self bodyStringUrl:@"cms/user/addUserPost.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            ModifyInformationModel * model = [[ModifyInformationModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//资讯 取消收藏
+(NSURLSessionDataTask *)cancelCollectionpostId:(NSString *)postId andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ModifyInformationModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"postId":postId,
                                 @"userId":[User sharedInstanced].ATP_acessToken
                                 };
    return [self bodyStringUrl:@"cms/user/deleteUserPost.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            ModifyInformationModel * model = [[ModifyInformationModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//资讯活动
+(NSURLSessionDataTask *)informationActivitiesPage:(NSInteger)page andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(InformationActivitiesModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"page":@(page)
                                 };
    return [self bodyStringUrl:@"cms/activity/activityList.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            InformationActivitiesModel * model = [[InformationActivitiesModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//活动报名
+(NSURLSessionDataTask *)enrollmentName:(NSString *)name phone:(NSString *)phone club:(NSString *)club activityId:(NSString *)activityId andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ModifyInformationModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"name":name,
                                 @"phone":phone,
                                 @"club":club,
                                 @"activityId":activityId
                                 };
    return [self bodyStringUrl:@"cms/activity/add.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            ModifyInformationModel * model = [[ModifyInformationModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//活动详情
+(NSURLSessionDataTask *)eventDetailsID:(NSString *)kid andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(EventDetailsModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"id":kid
                                 };
    return [self bodyStringUrl:@"/cms/activity/detail.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            EventDetailsModel * model = [[EventDetailsModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//专题详情
+(NSURLSessionDataTask *)projectDetailsId:(NSString *)kid andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ProjectDetailsModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"id":kid, @"userId":[User sharedInstanced].ATP_acessToken.length <= 0 ? @"-1" : [User sharedInstanced].ATP_acessToken
                                 };
    return [self bodyStringUrl:@"/cms/post/detail.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            ProjectDetailsModel * model = [[ProjectDetailsModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}

#pragma mark - 政务相关接口
//政务相关话题
+(NSURLSessionDataTask *)governmentAffairsPage:(NSInteger)page andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(GovernmentAffairsModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"page":@(page)
                                 };
    return [self bodyStringUrl:@"cms/post/next_correlationTopic.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            GovernmentAffairsModel * model = [[GovernmentAffairsModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//政务 你关心的
+(NSURLSessionDataTask *)governmentAffairscareAboutPage:(NSInteger)page andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(GovernmentAffairsModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"page":@(page)
                                 };
    return [self bodyStringUrl:@"cms/post/next_correlationAffairs.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            GovernmentAffairsModel * model = [[GovernmentAffairsModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//政务首页
+(NSURLSessionDataTask *)governmentAffairsRootandshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(GovernmentAffairsRootModel * model, NSError *error))block
{
    return [self bodyStringUrl:@"cms/post/correlationTopic.action" paramers:nil andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            GovernmentAffairsRootModel * model = [[GovernmentAffairsRootModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}

#pragma mark - 社区相关接口
//社区共享
+(NSURLSessionDataTask *)communityShareandshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(CommunityShareModel * model, NSError *error))block
{
    return [self bodyStringUrl:@"cms/club/iIthome.action" paramers:nil andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            CommunityShareModel * model = [[CommunityShareModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//社区生活
+(NSURLSessionDataTask *)communityLifeandshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(CommunityLifeModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"userId":[User sharedInstanced].ATP_acessToken,
                                 @"clubId":[User sharedInstanced].ATP_clubID
                                 };
    return [self bodyStringUrl:@"cms/club/communityLife.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            CommunityLifeModel * model = [[CommunityLifeModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//社区生活列表
+(NSURLSessionDataTask *)communityLifeListOrder:(NSString *)order lifeType:(NSInteger)lifeType page:(NSInteger)page ndshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(CommunityLifeListModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"page":@(page),
                                 @"order":order,
                                 @"userId":[User sharedInstanced].ATP_acessToken,
                                 @"clubId":[User sharedInstanced].ATP_clubID,
                                 @"lifeType":@(lifeType)
                                 };
    return [self bodyStringUrl:@"cms/club/clubLife.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            CommunityLifeListModel * model = [[CommunityLifeListModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//社区生活详情
+(NSURLSessionDataTask *)communityLifeDetailsID:(NSString *)kid andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(CommunityLifeDetailsModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"id":kid,
                                 @"userId":[User sharedInstanced].ATP_acessToken
                                 };
    return [self bodyStringUrl:@"cms/club/clubLife_Detail.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            CommunityLifeDetailsModel * model = [[CommunityLifeDetailsModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//社区生活详情评论列表
+(NSURLSessionDataTask *)communityLifeDetailsCommentListID:(NSString *)kid page:(NSInteger)page andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(CommunityLifeDetailsCommentListModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"lifeId":kid,
                                 @"page":@(page)
                                 };
    return [self bodyStringUrl:@"cms/club/lifeList.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            CommunityLifeDetailsCommentListModel * model = [[CommunityLifeDetailsCommentListModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//社区服务
+(NSURLSessionDataTask *)communityServiceandshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(CommunityServiceModel * model, NSError *error))block
{
    return [self bodyStringUrl:@"cms/club/communityService.action" paramers:nil andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            CommunityServiceModel * model = [[CommunityServiceModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//社区话题列表
+(NSURLSessionDataTask *)communityTopicAreaId:(NSString *)areaId clubID:(NSString *)clubId page:(NSInteger)page andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(CommunityTopicModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"areaId":areaId,
                                 @"page":@(page),
                                 @"clubId":clubId
                                 };
    return [self bodyStringUrl:@"cms/club/clubTopic.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            CommunityTopicModel * model = [[CommunityTopicModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//社区话题详情
+(NSURLSessionDataTask *)communityTopicDetailsId:(NSString *)kid andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(CommunityTopicDetailsModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"id":kid, @"userId":[User sharedInstanced].ATP_acessToken};
    return [self bodyStringUrl:@"cms/club/detail.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            CommunityTopicDetailsModel * model = [[CommunityTopicDetailsModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}

//社区生活举报
+(NSURLSessionDataTask *)communityReportobjType:(NSString *)objType objId:(NSString *)objId andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ModifyInformationModel * model, NSError *error))block
{
    NSMutableDictionary * parameters = [NSMutableDictionary dictionaryWithDictionary:@{@"memberId":[User sharedInstanced].ATP_acessToken, @"objId":objId}];
    if (objType) {
        [parameters setObject:objType forKey:@"objType"];
    }
    return [self bodyStringUrl:@"cms/club/report.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            ModifyInformationModel * model = [[ModifyInformationModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//社区公告
+(NSURLSessionDataTask *)communityPublicAnnouncementPage:(NSInteger)page  andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(CommunityPublicAnnouncementModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"page":@(page)};
    return [self bodyStringUrl:@"cms/club/afficheList.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            CommunityPublicAnnouncementModel * model = [[CommunityPublicAnnouncementModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//社区生活添加评论
+(NSURLSessionDataTask *)communityAddCommentslifeId:(NSString *)lifeId message:(NSString *)message andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ModifyInformationModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"lifeId":lifeId,
                                 @"memberId":[User sharedInstanced].ATP_acessToken,
                                 @"message":message
                                 };
    return [self bodyStringUrl:@"cms/club/addCommentaries.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            ModifyInformationModel * model = [[ModifyInformationModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//社区公告详情
+(NSURLSessionDataTask *)communityPublicAnnouncementDetailsId:(NSString *)lifeId andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(CommunityPublicAnnouncementDetailsModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"id":lifeId
                                 };
    return [self bodyStringUrl:@"cms/club/affiche_Detail.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            CommunityPublicAnnouncementDetailsModel * model = [[CommunityPublicAnnouncementDetailsModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//社区服务
+(NSURLSessionDataTask *)communityandshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(PropertyServiceModel * model, NSError *error))block
{
    return [self bodyStringUrl:@"cms/club/clubServList.action" paramers:nil andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            PropertyServiceModel * model = [[PropertyServiceModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}

//物业服务
+(NSURLSessionDataTask *)propertyServiceandshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(PropertyServiceModel * model, NSError *error))block
{
    return [self bodyStringUrl:@"cms/club/propertyServsList.action" paramers:nil andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            PropertyServiceModel * model = [[PropertyServiceModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//社区生活 点赞
+(NSURLSessionDataTask *)communityPraiseLifeId:(NSString *)lifeId andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ModifyInformationModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"lifeId":lifeId,
                                 @"userId":[User sharedInstanced].ATP_acessToken
                                 };
    return [self bodyStringUrl:@"cms/user/addPraise.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            ModifyInformationModel * model = [[ModifyInformationModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//社区生活 取消点赞
+(NSURLSessionDataTask *)communityCancelPraiseLifeId:(NSString *)lifeId andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ModifyInformationModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"lifeId":lifeId,
                                 @"userId":[User sharedInstanced].ATP_acessToken
                                 };
    return [self bodyStringUrl:@"cms/user/deletePraise.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            ModifyInformationModel * model = [[ModifyInformationModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//发布社区生活
+(NSURLSessionDataTask *)releaseContent:(NSString *)content lifeType:(NSInteger)lifeType photo:(NSString *)photo andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ModifyInformationModel * model, NSError *error))block
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithDictionary:@{@"lifeType":@(lifeType),
                                 @"userId":[User sharedInstanced].ATP_acessToken,
                                 @"clubId":[User sharedInstanced].ATP_clubID,
                                                                                      @"content":content
                                 }];
    if (photo) {
        [parameters setObject:photo forKey:@"photo"];
    }
    return [self bodyStringUrl:@"cms/club/clubLifeAdd.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            ModifyInformationModel * model = [[ModifyInformationModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//回复评论
+(NSURLSessionDataTask *)replyToCommentLifeId:(NSString *)lifeId message:(NSString *)message commentId:(NSString *)commentId andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ModifyInformationModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"lifeId":lifeId,
                                 @"memberId":[User sharedInstanced].ATP_acessToken,
                                 @"message":message,
                                 @"commentId":commentId
                                 };
    return [self bodyStringUrl:@"cms/club/addCommentaries.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            ModifyInformationModel * model = [[ModifyInformationModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//一条评论
+(NSURLSessionDataTask *)oneCommentListId:(NSString *)kid andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(OneCommentModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"id":kid};
    return [self bodyStringUrl:@"cms/club/getLife.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            OneCommentModel * model = [[OneCommentModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//删除社区生活
+(NSURLSessionDataTask *)deletelifeId:(NSString *)kid andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ModifyInformationModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"id":kid};
    return [self bodyStringUrl:@"cms/club/clubLifeDelete.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            ModifyInformationModel * model = [[ModifyInformationModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//社区通知列表
+(NSURLSessionDataTask *)communityNotificationListandshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(CommunityNotificationModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"clubId":[User sharedInstanced].ATP_clubID};
    return [self bodyStringUrl:@"cms/notice/noticeList.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            CommunityNotificationModel * model = [[CommunityNotificationModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//用户关注社区通知
+(NSURLSessionDataTask *)focusCommunityNotificationPage:(NSInteger)page andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(CommunityNotificationModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"userId":[User sharedInstanced].ATP_acessToken};
    return [self bodyStringUrl:@"cms/notice/userNoticeList.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            CommunityNotificationModel * model = [[CommunityNotificationModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//社区话题添加评论
+(NSURLSessionDataTask *)addTopicCommentLifeId:(NSString *)lifeId message:(NSString *)message andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ModifyInformationModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"memberId":[User sharedInstanced].ATP_acessToken,
                                 @"topicId":lifeId,
                                 @"message":message
                                 };
    return [self bodyStringUrl:@"cms/club/addTopicComment.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            ModifyInformationModel * model = [[ModifyInformationModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//社区话题评论列表
+(NSURLSessionDataTask *)communityTopicCommentsLifeId:(NSString *)lifeId page:(NSInteger)page andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(AllCommentsModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"topicId":lifeId, @"page":@(page)};
    return [self bodyStringUrl:@"cms/club/topicCommentList.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            AllCommentsModel * model = [[AllCommentsModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}

#pragma mark - 个人中心
//区域列表
+(NSURLSessionDataTask *)streetAreaandshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(StreetAreaModel * model, NSError *error))block
{
    return [self bodyStringUrl:@"cms/user/area.action" paramers:nil andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            StreetAreaModel * model = [[StreetAreaModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}

//社区列表
+(NSURLSessionDataTask *)streetAreaId:(NSString *)areaId andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(StreetAreaModel * model, NSError *error))block
{
    NSDictionary * paramers = @{@"areaId":areaId};
    return [self bodyStringUrl:@"cms/user/club.action" paramers:paramers andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            StreetAreaModel * model = [[StreetAreaModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//街道列表
+(NSURLSessionDataTask *)theStreetAreaId:(NSString *)areaId andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(StreetAreaModel * model, NSError *error))block
{
    NSDictionary * paramers = @{@"areaId":areaId};
    return [self bodyStringUrl:@"cms/user/business.action" paramers:paramers andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            StreetAreaModel * model = [[StreetAreaModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}

//修改个人信息
+(NSURLSessionDataTask *)modifyTheInformationID:(NSString *)kid areaId:(NSString *)areaId clubId:(NSString *)clubId nickName:(NSString *)nickName userName:(NSString *)userName avatar:(NSString *)avatar address:(NSString *)address subdistrictId:(NSString *)subdistrictId addressAareaId:(NSString *)addressAareaId andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ModifyInformationModel * model, NSError *error))block
{
    NSMutableDictionary * parameters = [NSMutableDictionary dictionaryWithDictionary:@{@"id":kid}];
    if (areaId) {
        [parameters setObject:areaId forKey:@"areaId"];
    }
    if (clubId) {
        [parameters setObject:clubId forKey:@"clubId"];
    }
    if (nickName) {
        [parameters setObject:nickName forKey:@"nickName"];
    }
    if (userName) {
        [parameters setObject:userName forKey:@"userName"];
    }
    if (avatar) {
        [parameters setObject:avatar forKey:@"avatar"];
    }
    if (address) {
        [parameters setObject:address forKey:@"address"];
    }
    if (subdistrictId) {
        [parameters setObject:subdistrictId forKey:@"subdistrictId"];
    }
    if (addressAareaId) {
        [parameters setObject:addressAareaId forKey:@"addressAareaId"];
    }
    return [self bodyStringUrl:@"cms/user/userUpdate.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            ModifyInformationModel * model = [[ModifyInformationModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//我的状态
+(NSURLSessionDataTask *)myStateandshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(MyStateModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"userId":[User sharedInstanced].ATP_acessToken};
    return [self bodyStringUrl:@"cms/user/userClubList.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            MyStateModel * model = [[MyStateModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//意见反馈
+(NSURLSessionDataTask *)feedbackContent:(NSString *)content ndshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ModifyInformationModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"userId":[User sharedInstanced].ATP_acessToken, @"content":content};
    return [self bodyStringUrl:@"club/feedback.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            ModifyInformationModel * model = [[ModifyInformationModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//关注社区
+(NSURLSessionDataTask *)attentionCommunityandshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(AttentionCommunityModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"userId":[User sharedInstanced].ATP_acessToken};
    return [self bodyStringUrl:@"cms/user/getUserClubList.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            AttentionCommunityModel * model = [[AttentionCommunityModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//添加关注社区
+(NSURLSessionDataTask *)addUserClubId:(NSString *)clubId andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ModifyInformationModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"userId":[User sharedInstanced].ATP_acessToken, @"userClubId":clubId};
    return [self bodyStringUrl:@"cms/user/addUserClub.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            ModifyInformationModel * model = [[ModifyInformationModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}

//取消社区关注
+(NSURLSessionDataTask *)deleteUserClubId:(NSString *)clubId andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(ModifyInformationModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"userId":[User sharedInstanced].ATP_acessToken, @"clubId":clubId};
    return [self bodyStringUrl:@"cms/user/deleteUserClub.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            ModifyInformationModel * model = [[ModifyInformationModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//我的收藏
+(NSURLSessionDataTask *)myCollectionPage:(NSInteger)page andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(MyCollectionModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"userId":[User sharedInstanced].ATP_acessToken, @"page":@(page)};
    return [self bodyStringUrl:@"cms/user/userPostList.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            MyCollectionModel * model = [[MyCollectionModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//我的消息
+(NSURLSessionDataTask *)myMessagePage:(NSInteger)page andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(MyMessageModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"memberId":[User sharedInstanced].ATP_acessToken, @"page":@(page)};
    return [self bodyStringUrl:@"cms/user/lifeComment.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            MyMessageModel * model = [[MyMessageModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//未读消息数
+(NSURLSessionDataTask *)unreadMessagesandshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(UnreadMessagesModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"memberId":[User sharedInstanced].ATP_acessToken};
    return [self bodyStringUrl:@"cms/user/readLifeComment.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            UnreadMessagesModel * model = [[UnreadMessagesModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}
//未关注社区列表
+(NSURLSessionDataTask *)stayFocusedAreaId:(NSString *)areaId andshowHUDInView:(UIView *)view resultPostsWithBlock:(void (^)(StayFocusedModel * model, NSError *error))block
{
    NSDictionary *parameters = @{@"userId":[User sharedInstanced].ATP_acessToken,
                                 @"areaId":areaId
                                 };
    return [self bodyStringUrl:@"cms/user/noClubList.action" paramers:parameters andShowHUDInView:view resultPostsWithBlock:^(id JSON, NSError *error) {
        if (!error) {
            StayFocusedModel * model = [[StayFocusedModel alloc]initWithDictionary:JSON];
            if (block) {
                block (model, nil);
            }
        }
        else
        {
            block (nil, error);
        }
    }];
}

@end

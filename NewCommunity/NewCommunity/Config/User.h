//
//  User.h
//  TianjinBoHai
//
//  Created by 李莹 on 15/1/22.
//  Copyright (c) 2015年 Binky Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
+ (User*)sharedInstanced;
//用户信息
@property (nonatomic, strong, readonly) NSString *ATP_sessionID;
@property (nonatomic, strong, readonly) NSString *ATP_acessToken;
@property (nonatomic, strong, readonly) NSString *ATP_UserID;
@property (nonatomic, strong, readonly) NSString *ATP_userName;
@property (nonatomic, strong, readonly) NSString *ATP_avatar;
@property (nonatomic, strong, readonly) NSString *ATP_address;
@property (nonatomic, strong, readonly) NSString *ATP_nickName;
@property (nonatomic, strong, readonly) NSString *ATP_Phone;
@property (nonatomic, strong, readonly) NSString *unreadMessages;
/**
 区域ID
 */
@property (nonatomic, strong, readonly) NSString *ATP_areaID;

/**
 社区ID
 */
@property (nonatomic, strong, readonly) NSString *ATP_clubID;
@property (nonatomic, strong, readonly) NSString *ATP_areaName;
@property (nonatomic, strong, readonly) NSString *ATP_clubName;

@property (nonatomic, strong, readonly) NSString *communityInAreaName;
@property (nonatomic, strong, readonly) NSString *communityInClubName;

- (void) setATP_sessionID:(NSString *)ATP_sessionID;
- (void) setATP_UserID:(NSString *)ATP_UserID;
- (void)setAcessToken:(NSString *)accessToken;
- (void) setATP_clubID:(NSString *)ATP_clubID;
- (void) setATP_areaID:(NSString *)ATP_areaID;
- (void) setATP_avatar:(NSString *)ATP_avatar;
- (void) setATP_userName:(NSString *)ATP_userName;
- (void) setATP_address:(NSString *)ATP_address;
- (void) setATP_clubName:(NSString *)ATP_clubName;
- (void) setATP_areaName:(NSString *)ATP_areaName;
- (void) setATP_nickName:(NSString *)ATP_nickName;
- (void) setATP_Phone:(NSString *)ATP_Phone;
- (void) setCommunityInClubName:(NSString *)communityInClubName;
- (void) setCommunityInAreaName:(NSString *)communityInAreaName;
- (void) setUnreadMessages:(NSString *)unreadMessages;
@end

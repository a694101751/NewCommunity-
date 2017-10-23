//
//  User.m
//  TianjinBoHai
//
//  Created by 李莹 on 15/1/22.
//  Copyright (c) 2015年 Binky Lee. All rights reserved.
//

#import "User.h"

static NSString * const kATPSessionID = @"NewCommunity_ATPSessionID";
static NSString * const kATPCookie = @"NewCommunity_ATPCookie";
static NSString * const kATPUserID = @"NewCommunity_ATPUserID";
static NSString * const kATPAreaID = @"NewCommunity_AreaID";
static NSString * const kATPClubID = @"NewCommunity_ClubID";
static NSString * const kATPUserName = @"NewCommunity_UserName";
static NSString * const kATPAvatar = @"NewCommunity_Avatar";
static NSString * const kATPAddress = @"NewCommunity_Address";
static NSString * const kATPAreaName = @"NewCommunity_AreaName";
static NSString * const kATPClubName = @"NewCommunity_ClubName";
static NSString * const kATPNickName = @"NewCommunity_NickName";
static NSString * const kATPPhone = @"NewCommunity_Phone";
static NSString * const kATPUnreadMessages = @"NewCommunity_unreadMessages";
static NSString * const kCommunityInAreaName= @"NewCommunity_CommunityInAreaName";
static NSString * const kCommunityInClubName = @"NewCommunity_communityInClubName";
@implementation User

+ (User*)sharedInstanced{
    static User *_sharedInstanced = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstanced = [[User alloc] init];
    });
    return _sharedInstanced;
}

- (instancetype)init{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void) setATP_sessionID:(NSString *)ATP_sessionID{
    if (!ATP_sessionID || ATP_sessionID.length == 0) {
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:kATPSessionID];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return;
    }
    NSString *localATPSectionID = [[NSUserDefaults standardUserDefaults] objectForKey:kATPSessionID];
    
    if ([localATPSectionID isEqualToString:ATP_sessionID]) {
        return;
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:ATP_sessionID forKey:kATPSessionID];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString*)ATP_sessionID{
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{kATPSessionID:@""}];
    return [[NSUserDefaults standardUserDefaults] objectForKey:kATPSessionID];
}

- (void)setAcessToken:(NSString *)accessToken{
    if (!accessToken || accessToken.length == 0) {
       [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:kATPCookie];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return;
    }
    
    NSString *localATP_Cookie = [[NSUserDefaults standardUserDefaults] objectForKey:kATPCookie];
    
    if ([localATP_Cookie isEqualToString:accessToken]) {
        return;
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:accessToken forKey:kATPCookie];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString*)ATP_acessToken{
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{kATPCookie:@""}];
    NSLog(@"ATP_cookie %@", [[NSUserDefaults standardUserDefaults] objectForKey:kATPCookie]);
    return [[NSUserDefaults standardUserDefaults] objectForKey:kATPCookie];
}

- (void) setATP_UserID:(NSString *)ATP_UserID{
    if (!ATP_UserID || ATP_UserID.length == 0) {
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:kATPUserID];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return;
    }
    
    NSString *localATP_UserID = [[NSUserDefaults standardUserDefaults] objectForKey:kATPUserID];
    
    if ([localATP_UserID isEqualToString:ATP_UserID]) {
        return;
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:ATP_UserID forKey:kATPUserID];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString*)ATP_UserID{
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{kATPUserID:@""}];
    return [[NSUserDefaults standardUserDefaults] objectForKey:kATPUserID];
}

- (void) setATP_areaID:(NSString *)ATP_areaID{
    if (!ATP_areaID || ATP_areaID.length == 0) {
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:kATPAreaID];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return;
    }
    
    NSString *localATP_UserID = [[NSUserDefaults standardUserDefaults] objectForKey:kATPAreaID];
    
    if ([localATP_UserID isEqualToString:ATP_areaID]) {
        return;
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:ATP_areaID forKey:kATPAreaID];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString*)ATP_areaID{
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{kATPAreaID:@""}];
    return [[NSUserDefaults standardUserDefaults] objectForKey:kATPAreaID];
}

- (void) setATP_clubID:(NSString *)ATP_clubID{
    if (!ATP_clubID || ATP_clubID.length == 0) {
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:kATPClubID];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return;
    }
    
    NSString *localATP_UserID = [[NSUserDefaults standardUserDefaults] objectForKey:kATPClubID];
    
    if ([localATP_UserID isEqualToString:ATP_clubID]) {
        return;
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:ATP_clubID forKey:kATPClubID];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString*)ATP_clubID{
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{kATPClubID:@""}];
    return [[NSUserDefaults standardUserDefaults] objectForKey:kATPClubID];
}

- (void) setATP_userName:(NSString *)ATP_userName{
    if (!ATP_userName || ATP_userName.length == 0) {
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:kATPUserName];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return;
    }
    
    NSString *localATP_UserID = [[NSUserDefaults standardUserDefaults] objectForKey:kATPUserName];
    
    if ([localATP_UserID isEqualToString:ATP_userName]) {
        return;
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:ATP_userName forKey:kATPUserName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString*)ATP_userName{
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{kATPUserName:@""}];
    return [[NSUserDefaults standardUserDefaults] objectForKey:kATPUserName];
}

- (void) setATP_avatar:(NSString *)ATP_avatar{
    if (!ATP_avatar || ATP_avatar.length == 0) {
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:kATPAvatar];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return;
    }
    
    NSString *localATP_UserID = [[NSUserDefaults standardUserDefaults] objectForKey:kATPAvatar];
    
    if ([localATP_UserID isEqualToString:ATP_avatar]) {
        return;
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:ATP_avatar forKey:kATPAvatar];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString*)ATP_avatar{
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{kATPAvatar:@""}];
    return [[NSUserDefaults standardUserDefaults] objectForKey:kATPAvatar];
}

- (void) setATP_address:(NSString *)ATP_address{
    if (!ATP_address || ATP_address.length == 0) {
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:kATPAddress];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return;
    }
    
    NSString *localATP_UserID = [[NSUserDefaults standardUserDefaults] objectForKey:kATPAddress];
    
    if ([localATP_UserID isEqualToString:ATP_address]) {
        return;
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:ATP_address forKey:kATPAddress];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString*)ATP_address{
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{kATPAddress:@""}];
    return [[NSUserDefaults standardUserDefaults] objectForKey:kATPAddress];
}

- (void) setATP_areaName:(NSString *)ATP_areaName{
    if (!ATP_areaName || ATP_areaName.length == 0) {
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:kATPAreaName];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return;
    }
    
    NSString *localATP_UserID = [[NSUserDefaults standardUserDefaults] objectForKey:kATPAreaName];
    
    if ([localATP_UserID isEqualToString:ATP_areaName]) {
        return;
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:ATP_areaName forKey:kATPAreaName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString*)ATP_areaName{
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{kATPAreaName:@""}];
    return [[NSUserDefaults standardUserDefaults] objectForKey:kATPAreaName];
}

- (void) setATP_clubName:(NSString *)ATP_clubName{
    if (!ATP_clubName || ATP_clubName.length == 0) {
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:kATPClubName];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return;
    }
    
    NSString *localATP_UserID = [[NSUserDefaults standardUserDefaults] objectForKey:kATPClubName];
    
    if ([localATP_UserID isEqualToString:ATP_clubName]) {
        return;
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:ATP_clubName forKey:kATPClubName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString*)ATP_clubName{
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{kATPClubName:@""}];
    return [[NSUserDefaults standardUserDefaults] objectForKey:kATPClubName];
}

- (void) setATP_nickName:(NSString *)ATP_nickName{
    if (!ATP_nickName || ATP_nickName.length == 0) {
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:kATPNickName];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return;
    }
    
    NSString *localATP_UserID = [[NSUserDefaults standardUserDefaults] objectForKey:kATPNickName];
    
    if ([localATP_UserID isEqualToString:ATP_nickName]) {
        return;
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:ATP_nickName forKey:kATPNickName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString*)ATP_nickName{
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{kATPNickName:@""}];
    return [[NSUserDefaults standardUserDefaults] objectForKey:kATPNickName];
}

- (void) setATP_Phone:(NSString *)ATP_Phone{
    if (!ATP_Phone || ATP_Phone.length == 0) {
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:kATPPhone];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return;
    }
    
    NSString *localATP_UserID = [[NSUserDefaults standardUserDefaults] objectForKey:kATPPhone];
    
    if ([localATP_UserID isEqualToString:ATP_Phone]) {
        return;
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:ATP_Phone forKey:kATPPhone];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString*)ATP_Phone{
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{kATPPhone:@""}];
    return [[NSUserDefaults standardUserDefaults] objectForKey:kATPPhone];
}

- (void) setCommunityInAreaName:(NSString *)communityInAreaName{
    if (!communityInAreaName || communityInAreaName.length == 0) {
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:kCommunityInAreaName];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return;
    }
    
    NSString *localATP_UserID = [[NSUserDefaults standardUserDefaults] objectForKey:kCommunityInAreaName];
    
    if ([localATP_UserID isEqualToString:communityInAreaName]) {
        return;
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:communityInAreaName forKey:kCommunityInAreaName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString*)communityInAreaName{
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{kCommunityInAreaName:@""}];
    return [[NSUserDefaults standardUserDefaults] objectForKey:kCommunityInAreaName];
}

- (void) setCommunityInClubName:(NSString *)communityInClubName{
    if (!communityInClubName || communityInClubName.length == 0) {
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:kCommunityInClubName];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return;
    }
    
    NSString *localATP_UserID = [[NSUserDefaults standardUserDefaults] objectForKey:kCommunityInClubName];
    
    if ([localATP_UserID isEqualToString:communityInClubName]) {
        return;
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:communityInClubName forKey:kCommunityInClubName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString*)communityInClubName{
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{kCommunityInClubName:@""}];
    return [[NSUserDefaults standardUserDefaults] objectForKey:kCommunityInClubName];
}

- (void) setUnreadMessages:(NSString *)unreadMessages{
    if (!unreadMessages || unreadMessages.length == 0) {
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:kATPUnreadMessages];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return;
    }
    
    NSString *localATP_UserID = [[NSUserDefaults standardUserDefaults] objectForKey:kATPUnreadMessages];
    
    if ([localATP_UserID isEqualToString:unreadMessages]) {
        return;
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:unreadMessages forKey:kATPUnreadMessages];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString*)unreadMessages{
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{kATPUnreadMessages:@""}];
    return [[NSUserDefaults standardUserDefaults] objectForKey:kATPUnreadMessages];
}

@end

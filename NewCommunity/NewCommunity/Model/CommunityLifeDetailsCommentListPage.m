//
//	CommunityLifeDetailsCommentListPage.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityLifeDetailsCommentListPage.h"

NSString *const kCommunityLifeDetailsCommentListPageAvatar = @"avatar";
NSString *const kCommunityLifeDetailsCommentListPageClubid = @"clubid";
NSString *const kCommunityLifeDetailsCommentListPageIdField = @"id";
NSString *const kCommunityLifeDetailsCommentListPageMessage = @"message";
NSString *const kCommunityLifeDetailsCommentListPageReply = @"reply";
NSString *const kCommunityLifeDetailsCommentListPageUserName = @"nickName";

@interface CommunityLifeDetailsCommentListPage ()
@end
@implementation CommunityLifeDetailsCommentListPage




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCommunityLifeDetailsCommentListPageAvatar] isKindOfClass:[NSNull class]]){
		self.avatar = dictionary[kCommunityLifeDetailsCommentListPageAvatar];
	}	
	if(![dictionary[kCommunityLifeDetailsCommentListPageClubid] isKindOfClass:[NSNull class]]){
		self.clubid = dictionary[kCommunityLifeDetailsCommentListPageClubid];
	}	
	if(![dictionary[kCommunityLifeDetailsCommentListPageIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kCommunityLifeDetailsCommentListPageIdField];
	}	
	if(![dictionary[kCommunityLifeDetailsCommentListPageMessage] isKindOfClass:[NSNull class]]){
		self.message = dictionary[kCommunityLifeDetailsCommentListPageMessage];
	}	
	if(![dictionary[kCommunityLifeDetailsCommentListPageReply] isKindOfClass:[NSNull class]]){
		self.reply = dictionary[kCommunityLifeDetailsCommentListPageReply];
	}	
	if(![dictionary[kCommunityLifeDetailsCommentListPageUserName] isKindOfClass:[NSNull class]]){
		self.userName = dictionary[kCommunityLifeDetailsCommentListPageUserName];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.avatar != nil){
		dictionary[kCommunityLifeDetailsCommentListPageAvatar] = self.avatar;
	}
	if(self.clubid != nil){
		dictionary[kCommunityLifeDetailsCommentListPageClubid] = self.clubid;
	}
	if(self.idField != nil){
		dictionary[kCommunityLifeDetailsCommentListPageIdField] = self.idField;
	}
	if(self.message != nil){
		dictionary[kCommunityLifeDetailsCommentListPageMessage] = self.message;
	}
	if(self.reply != nil){
		dictionary[kCommunityLifeDetailsCommentListPageReply] = self.reply;
	}
	if(self.userName != nil){
		dictionary[kCommunityLifeDetailsCommentListPageUserName] = self.userName;
	}
	return dictionary;

}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
	if(self.avatar != nil){
		[aCoder encodeObject:self.avatar forKey:kCommunityLifeDetailsCommentListPageAvatar];
	}
	if(self.clubid != nil){
		[aCoder encodeObject:self.clubid forKey:kCommunityLifeDetailsCommentListPageClubid];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kCommunityLifeDetailsCommentListPageIdField];
	}
	if(self.message != nil){
		[aCoder encodeObject:self.message forKey:kCommunityLifeDetailsCommentListPageMessage];
	}
	if(self.reply != nil){
		[aCoder encodeObject:self.reply forKey:kCommunityLifeDetailsCommentListPageReply];
	}
	if(self.userName != nil){
		[aCoder encodeObject:self.userName forKey:kCommunityLifeDetailsCommentListPageUserName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.avatar = [aDecoder decodeObjectForKey:kCommunityLifeDetailsCommentListPageAvatar];
	self.clubid = [aDecoder decodeObjectForKey:kCommunityLifeDetailsCommentListPageClubid];
	self.idField = [aDecoder decodeObjectForKey:kCommunityLifeDetailsCommentListPageIdField];
	self.message = [aDecoder decodeObjectForKey:kCommunityLifeDetailsCommentListPageMessage];
	self.reply = [aDecoder decodeObjectForKey:kCommunityLifeDetailsCommentListPageReply];
	self.userName = [aDecoder decodeObjectForKey:kCommunityLifeDetailsCommentListPageUserName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityLifeDetailsCommentListPage *copy = [CommunityLifeDetailsCommentListPage new];

	copy.avatar = [self.avatar copy];
	copy.clubid = [self.clubid copy];
	copy.idField = [self.idField copy];
	copy.message = [self.message copy];
	copy.reply = [self.reply copy];
	copy.userName = [self.userName copy];

	return copy;
}
@end

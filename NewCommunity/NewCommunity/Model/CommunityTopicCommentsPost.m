//
//	CommunityTopicCommentsPost.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityTopicCommentsPost.h"

NSString *const kCommunityTopicCommentsPostAddTime = @"addTime";
NSString *const kCommunityTopicCommentsPostAvatar = @"avatar";
NSString *const kCommunityTopicCommentsPostIdField = @"id";
NSString *const kCommunityTopicCommentsPostMessage = @"message";
NSString *const kCommunityTopicCommentsPostUserName = @"userName";

@interface CommunityTopicCommentsPost ()
@end
@implementation CommunityTopicCommentsPost




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCommunityTopicCommentsPostAddTime] isKindOfClass:[NSNull class]]){
		self.addTime = dictionary[kCommunityTopicCommentsPostAddTime];
	}	
	if(![dictionary[kCommunityTopicCommentsPostAvatar] isKindOfClass:[NSNull class]]){
		self.avatar = dictionary[kCommunityTopicCommentsPostAvatar];
	}	
	if(![dictionary[kCommunityTopicCommentsPostIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kCommunityTopicCommentsPostIdField];
	}	
	if(![dictionary[kCommunityTopicCommentsPostMessage] isKindOfClass:[NSNull class]]){
		self.message = dictionary[kCommunityTopicCommentsPostMessage];
	}	
	if(![dictionary[kCommunityTopicCommentsPostUserName] isKindOfClass:[NSNull class]]){
		self.userName = dictionary[kCommunityTopicCommentsPostUserName];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.addTime != nil){
		dictionary[kCommunityTopicCommentsPostAddTime] = self.addTime;
	}
	if(self.avatar != nil){
		dictionary[kCommunityTopicCommentsPostAvatar] = self.avatar;
	}
	if(self.idField != nil){
		dictionary[kCommunityTopicCommentsPostIdField] = self.idField;
	}
	if(self.message != nil){
		dictionary[kCommunityTopicCommentsPostMessage] = self.message;
	}
	if(self.userName != nil){
		dictionary[kCommunityTopicCommentsPostUserName] = self.userName;
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
	if(self.addTime != nil){
		[aCoder encodeObject:self.addTime forKey:kCommunityTopicCommentsPostAddTime];
	}
	if(self.avatar != nil){
		[aCoder encodeObject:self.avatar forKey:kCommunityTopicCommentsPostAvatar];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kCommunityTopicCommentsPostIdField];
	}
	if(self.message != nil){
		[aCoder encodeObject:self.message forKey:kCommunityTopicCommentsPostMessage];
	}
	if(self.userName != nil){
		[aCoder encodeObject:self.userName forKey:kCommunityTopicCommentsPostUserName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.addTime = [aDecoder decodeObjectForKey:kCommunityTopicCommentsPostAddTime];
	self.avatar = [aDecoder decodeObjectForKey:kCommunityTopicCommentsPostAvatar];
	self.idField = [aDecoder decodeObjectForKey:kCommunityTopicCommentsPostIdField];
	self.message = [aDecoder decodeObjectForKey:kCommunityTopicCommentsPostMessage];
	self.userName = [aDecoder decodeObjectForKey:kCommunityTopicCommentsPostUserName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityTopicCommentsPost *copy = [CommunityTopicCommentsPost new];

	copy.addTime = [self.addTime copy];
	copy.avatar = [self.avatar copy];
	copy.idField = [self.idField copy];
	copy.message = [self.message copy];
	copy.userName = [self.userName copy];

	return copy;
}
@end
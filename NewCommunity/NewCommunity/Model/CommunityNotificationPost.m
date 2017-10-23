//
//	CommunityNotificationPost.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityNotificationPost.h"

NSString *const kCommunityNotificationPostAddTime = @"addTime";
NSString *const kCommunityNotificationPostClubId = @"clubId";
NSString *const kCommunityNotificationPostContent = @"content";
NSString *const kCommunityNotificationPostIdField = @"id";
NSString *const kCommunityNotificationPostTitle = @"title";

@interface CommunityNotificationPost ()
@end
@implementation CommunityNotificationPost




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCommunityNotificationPostAddTime] isKindOfClass:[NSNull class]]){
		self.addTime = dictionary[kCommunityNotificationPostAddTime];
	}	
	if(![dictionary[kCommunityNotificationPostClubId] isKindOfClass:[NSNull class]]){
		self.clubId = dictionary[kCommunityNotificationPostClubId];
	}	
	if(![dictionary[kCommunityNotificationPostContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kCommunityNotificationPostContent];
	}	
	if(![dictionary[kCommunityNotificationPostIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kCommunityNotificationPostIdField];
	}	
	if(![dictionary[kCommunityNotificationPostTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kCommunityNotificationPostTitle];
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
		dictionary[kCommunityNotificationPostAddTime] = self.addTime;
	}
	if(self.clubId != nil){
		dictionary[kCommunityNotificationPostClubId] = self.clubId;
	}
	if(self.content != nil){
		dictionary[kCommunityNotificationPostContent] = self.content;
	}
	if(self.idField != nil){
		dictionary[kCommunityNotificationPostIdField] = self.idField;
	}
	if(self.title != nil){
		dictionary[kCommunityNotificationPostTitle] = self.title;
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
		[aCoder encodeObject:self.addTime forKey:kCommunityNotificationPostAddTime];
	}
	if(self.clubId != nil){
		[aCoder encodeObject:self.clubId forKey:kCommunityNotificationPostClubId];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kCommunityNotificationPostContent];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kCommunityNotificationPostIdField];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:kCommunityNotificationPostTitle];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.addTime = [aDecoder decodeObjectForKey:kCommunityNotificationPostAddTime];
	self.clubId = [aDecoder decodeObjectForKey:kCommunityNotificationPostClubId];
	self.content = [aDecoder decodeObjectForKey:kCommunityNotificationPostContent];
	self.idField = [aDecoder decodeObjectForKey:kCommunityNotificationPostIdField];
	self.title = [aDecoder decodeObjectForKey:kCommunityNotificationPostTitle];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityNotificationPost *copy = [CommunityNotificationPost new];

	copy.addTime = [self.addTime copy];
	copy.clubId = [self.clubId copy];
	copy.content = [self.content copy];
	copy.idField = [self.idField copy];
	copy.title = [self.title copy];

	return copy;
}
@end
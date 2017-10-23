//
//	CommunityPublicAnnouncementPost.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityPublicAnnouncementPost.h"

NSString *const kCommunityPublicAnnouncementPostIdField = @"id";
NSString *const kCommunityPublicAnnouncementPostThumb = @"thumb";
NSString *const kCommunityPublicAnnouncementPostTitle = @"title";

@interface CommunityPublicAnnouncementPost ()
@end
@implementation CommunityPublicAnnouncementPost




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCommunityPublicAnnouncementPostIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kCommunityPublicAnnouncementPostIdField];
	}	
	if(![dictionary[kCommunityPublicAnnouncementPostThumb] isKindOfClass:[NSNull class]]){
		self.thumb = dictionary[kCommunityPublicAnnouncementPostThumb];
	}	
	if(![dictionary[kCommunityPublicAnnouncementPostTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kCommunityPublicAnnouncementPostTitle];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.idField != nil){
		dictionary[kCommunityPublicAnnouncementPostIdField] = self.idField;
	}
	if(self.thumb != nil){
		dictionary[kCommunityPublicAnnouncementPostThumb] = self.thumb;
	}
	if(self.title != nil){
		dictionary[kCommunityPublicAnnouncementPostTitle] = self.title;
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
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kCommunityPublicAnnouncementPostIdField];
	}
	if(self.thumb != nil){
		[aCoder encodeObject:self.thumb forKey:kCommunityPublicAnnouncementPostThumb];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:kCommunityPublicAnnouncementPostTitle];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.idField = [aDecoder decodeObjectForKey:kCommunityPublicAnnouncementPostIdField];
	self.thumb = [aDecoder decodeObjectForKey:kCommunityPublicAnnouncementPostThumb];
	self.title = [aDecoder decodeObjectForKey:kCommunityPublicAnnouncementPostTitle];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityPublicAnnouncementPost *copy = [CommunityPublicAnnouncementPost new];

	copy.idField = [self.idField copy];
	copy.thumb = [self.thumb copy];
	copy.title = [self.title copy];

	return copy;
}
@end
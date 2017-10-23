//
//	CommunityPublicAnnouncementDetailsModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityPublicAnnouncementDetailsModel.h"

NSString *const kCommunityPublicAnnouncementDetailsModelCode = @"code";
NSString *const kCommunityPublicAnnouncementDetailsModelContent = @"content";
NSString *const kCommunityPublicAnnouncementDetailsModelPages = @"pages";

@interface CommunityPublicAnnouncementDetailsModel ()
@end
@implementation CommunityPublicAnnouncementDetailsModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCommunityPublicAnnouncementDetailsModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kCommunityPublicAnnouncementDetailsModelCode];
	}	
	if(![dictionary[kCommunityPublicAnnouncementDetailsModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kCommunityPublicAnnouncementDetailsModelContent];
	}	
	if(![dictionary[kCommunityPublicAnnouncementDetailsModelPages] isKindOfClass:[NSNull class]]){
		self.pages = [[CommunityPublicAnnouncementDetailsPage alloc] initWithDictionary:dictionary[kCommunityPublicAnnouncementDetailsModelPages]];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.code != nil){
		dictionary[kCommunityPublicAnnouncementDetailsModelCode] = self.code;
	}
	if(self.content != nil){
		dictionary[kCommunityPublicAnnouncementDetailsModelContent] = self.content;
	}
	if(self.pages != nil){
		dictionary[kCommunityPublicAnnouncementDetailsModelPages] = [self.pages toDictionary];
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
	if(self.code != nil){
		[aCoder encodeObject:self.code forKey:kCommunityPublicAnnouncementDetailsModelCode];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kCommunityPublicAnnouncementDetailsModelContent];
	}
	if(self.pages != nil){
		[aCoder encodeObject:self.pages forKey:kCommunityPublicAnnouncementDetailsModelPages];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kCommunityPublicAnnouncementDetailsModelCode];
	self.content = [aDecoder decodeObjectForKey:kCommunityPublicAnnouncementDetailsModelContent];
	self.pages = [aDecoder decodeObjectForKey:kCommunityPublicAnnouncementDetailsModelPages];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityPublicAnnouncementDetailsModel *copy = [CommunityPublicAnnouncementDetailsModel new];

	copy.code = [self.code copy];
	copy.content = [self.content copy];
	copy.pages = [self.pages copy];

	return copy;
}
@end
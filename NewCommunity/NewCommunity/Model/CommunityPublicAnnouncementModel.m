//
//	CommunityPublicAnnouncementModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityPublicAnnouncementModel.h"

NSString *const kCommunityPublicAnnouncementModelCode = @"code";
NSString *const kCommunityPublicAnnouncementModelContent = @"content";
NSString *const kCommunityPublicAnnouncementModelData = @"data";

@interface CommunityPublicAnnouncementModel ()
@end
@implementation CommunityPublicAnnouncementModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCommunityPublicAnnouncementModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kCommunityPublicAnnouncementModelCode];
	}	
	if(![dictionary[kCommunityPublicAnnouncementModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kCommunityPublicAnnouncementModelContent];
	}	
	if(![dictionary[kCommunityPublicAnnouncementModelData] isKindOfClass:[NSNull class]]){
		self.data = [[CommunityPublicAnnouncementData alloc] initWithDictionary:dictionary[kCommunityPublicAnnouncementModelData]];
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
		dictionary[kCommunityPublicAnnouncementModelCode] = self.code;
	}
	if(self.content != nil){
		dictionary[kCommunityPublicAnnouncementModelContent] = self.content;
	}
	if(self.data != nil){
		dictionary[kCommunityPublicAnnouncementModelData] = [self.data toDictionary];
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
		[aCoder encodeObject:self.code forKey:kCommunityPublicAnnouncementModelCode];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kCommunityPublicAnnouncementModelContent];
	}
	if(self.data != nil){
		[aCoder encodeObject:self.data forKey:kCommunityPublicAnnouncementModelData];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kCommunityPublicAnnouncementModelCode];
	self.content = [aDecoder decodeObjectForKey:kCommunityPublicAnnouncementModelContent];
	self.data = [aDecoder decodeObjectForKey:kCommunityPublicAnnouncementModelData];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityPublicAnnouncementModel *copy = [CommunityPublicAnnouncementModel new];

	copy.code = [self.code copy];
	copy.content = [self.content copy];
	copy.data = [self.data copy];

	return copy;
}
@end
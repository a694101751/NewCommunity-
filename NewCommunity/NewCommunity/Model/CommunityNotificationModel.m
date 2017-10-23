//
//	CommunityNotificationModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityNotificationModel.h"

NSString *const kCommunityNotificationModelCode = @"code";
NSString *const kCommunityNotificationModelContent = @"content";
NSString *const kCommunityNotificationModelData = @"data";

@interface CommunityNotificationModel ()
@end
@implementation CommunityNotificationModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCommunityNotificationModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kCommunityNotificationModelCode];
	}	
	if(![dictionary[kCommunityNotificationModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kCommunityNotificationModelContent];
	}	
	if(![dictionary[kCommunityNotificationModelData] isKindOfClass:[NSNull class]]){
		self.data = [[CommunityNotificationData alloc] initWithDictionary:dictionary[kCommunityNotificationModelData]];
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
		dictionary[kCommunityNotificationModelCode] = self.code;
	}
	if(self.content != nil){
		dictionary[kCommunityNotificationModelContent] = self.content;
	}
	if(self.data != nil){
		dictionary[kCommunityNotificationModelData] = [self.data toDictionary];
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
		[aCoder encodeObject:self.code forKey:kCommunityNotificationModelCode];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kCommunityNotificationModelContent];
	}
	if(self.data != nil){
		[aCoder encodeObject:self.data forKey:kCommunityNotificationModelData];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kCommunityNotificationModelCode];
	self.content = [aDecoder decodeObjectForKey:kCommunityNotificationModelContent];
	self.data = [aDecoder decodeObjectForKey:kCommunityNotificationModelData];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityNotificationModel *copy = [CommunityNotificationModel new];

	copy.code = [self.code copy];
	copy.content = [self.content copy];
	copy.data = [self.data copy];

	return copy;
}
@end
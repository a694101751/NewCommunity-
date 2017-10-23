//
//	CommunityTopicModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityTopicModel.h"

NSString *const kCommunityTopicModelCode = @"code";
NSString *const kCommunityTopicModelContent = @"content";
NSString *const kCommunityTopicModelData = @"data";

@interface CommunityTopicModel ()
@end
@implementation CommunityTopicModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCommunityTopicModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kCommunityTopicModelCode];
	}	
	if(![dictionary[kCommunityTopicModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kCommunityTopicModelContent];
	}	
	if(![dictionary[kCommunityTopicModelData] isKindOfClass:[NSNull class]]){
		self.data = [[CommunityTopicData alloc] initWithDictionary:dictionary[kCommunityTopicModelData]];
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
		dictionary[kCommunityTopicModelCode] = self.code;
	}
	if(self.content != nil){
		dictionary[kCommunityTopicModelContent] = self.content;
	}
	if(self.data != nil){
		dictionary[kCommunityTopicModelData] = [self.data toDictionary];
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
		[aCoder encodeObject:self.code forKey:kCommunityTopicModelCode];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kCommunityTopicModelContent];
	}
	if(self.data != nil){
		[aCoder encodeObject:self.data forKey:kCommunityTopicModelData];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kCommunityTopicModelCode];
	self.content = [aDecoder decodeObjectForKey:kCommunityTopicModelContent];
	self.data = [aDecoder decodeObjectForKey:kCommunityTopicModelData];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityTopicModel *copy = [CommunityTopicModel new];

	copy.code = [self.code copy];
	copy.content = [self.content copy];
	copy.data = [self.data copy];

	return copy;
}
@end
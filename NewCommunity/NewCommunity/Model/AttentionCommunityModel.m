//
//	AttentionCommunityModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "AttentionCommunityModel.h"

NSString *const kAttentionCommunityModelCode = @"code";
NSString *const kAttentionCommunityModelContent = @"content";
NSString *const kAttentionCommunityModelData = @"data";

@interface AttentionCommunityModel ()
@end
@implementation AttentionCommunityModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kAttentionCommunityModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kAttentionCommunityModelCode];
	}	
	if(![dictionary[kAttentionCommunityModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kAttentionCommunityModelContent];
	}	
	if(![dictionary[kAttentionCommunityModelData] isKindOfClass:[NSNull class]]){
		self.data = [[AttentionCommunityData alloc] initWithDictionary:dictionary[kAttentionCommunityModelData]];
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
		dictionary[kAttentionCommunityModelCode] = self.code;
	}
	if(self.content != nil){
		dictionary[kAttentionCommunityModelContent] = self.content;
	}
	if(self.data != nil){
		dictionary[kAttentionCommunityModelData] = [self.data toDictionary];
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
		[aCoder encodeObject:self.code forKey:kAttentionCommunityModelCode];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kAttentionCommunityModelContent];
	}
	if(self.data != nil){
		[aCoder encodeObject:self.data forKey:kAttentionCommunityModelData];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kAttentionCommunityModelCode];
	self.content = [aDecoder decodeObjectForKey:kAttentionCommunityModelContent];
	self.data = [aDecoder decodeObjectForKey:kAttentionCommunityModelData];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	AttentionCommunityModel *copy = [AttentionCommunityModel new];

	copy.code = [self.code copy];
	copy.content = [self.content copy];
	copy.data = [self.data copy];

	return copy;
}
@end
//
//	CommunityServiceModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityServiceModel.h"

NSString *const kCommunityServiceModelCode = @"code";
NSString *const kCommunityServiceModelContent = @"content";
NSString *const kCommunityServiceModelData = @"data";

@interface CommunityServiceModel ()
@end
@implementation CommunityServiceModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCommunityServiceModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kCommunityServiceModelCode];
	}	
	if(![dictionary[kCommunityServiceModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kCommunityServiceModelContent];
	}	
	if(![dictionary[kCommunityServiceModelData] isKindOfClass:[NSNull class]]){
		self.data = [[CommunityServiceData alloc] initWithDictionary:dictionary[kCommunityServiceModelData]];
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
		dictionary[kCommunityServiceModelCode] = self.code;
	}
	if(self.content != nil){
		dictionary[kCommunityServiceModelContent] = self.content;
	}
	if(self.data != nil){
		dictionary[kCommunityServiceModelData] = [self.data toDictionary];
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
		[aCoder encodeObject:self.code forKey:kCommunityServiceModelCode];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kCommunityServiceModelContent];
	}
	if(self.data != nil){
		[aCoder encodeObject:self.data forKey:kCommunityServiceModelData];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kCommunityServiceModelCode];
	self.content = [aDecoder decodeObjectForKey:kCommunityServiceModelContent];
	self.data = [aDecoder decodeObjectForKey:kCommunityServiceModelData];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityServiceModel *copy = [CommunityServiceModel new];

	copy.code = [self.code copy];
	copy.content = [self.content copy];
	copy.data = [self.data copy];

	return copy;
}
@end
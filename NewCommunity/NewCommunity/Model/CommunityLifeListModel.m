//
//	CommunityLifeListModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityLifeListModel.h"

NSString *const kCommunityLifeListModelCode = @"code";
NSString *const kCommunityLifeListModelContent = @"content";
NSString *const kCommunityLifeListModelData = @"data";

@interface CommunityLifeListModel ()
@end
@implementation CommunityLifeListModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCommunityLifeListModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kCommunityLifeListModelCode];
	}	
	if(![dictionary[kCommunityLifeListModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kCommunityLifeListModelContent];
	}	
	if(![dictionary[kCommunityLifeListModelData] isKindOfClass:[NSNull class]]){
		self.data = [[CommunityLifeListData alloc] initWithDictionary:dictionary[kCommunityLifeListModelData]];
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
		dictionary[kCommunityLifeListModelCode] = self.code;
	}
	if(self.content != nil){
		dictionary[kCommunityLifeListModelContent] = self.content;
	}
	if(self.data != nil){
		dictionary[kCommunityLifeListModelData] = [self.data toDictionary];
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
		[aCoder encodeObject:self.code forKey:kCommunityLifeListModelCode];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kCommunityLifeListModelContent];
	}
	if(self.data != nil){
		[aCoder encodeObject:self.data forKey:kCommunityLifeListModelData];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kCommunityLifeListModelCode];
	self.content = [aDecoder decodeObjectForKey:kCommunityLifeListModelContent];
	self.data = [aDecoder decodeObjectForKey:kCommunityLifeListModelData];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityLifeListModel *copy = [CommunityLifeListModel new];

	copy.code = [self.code copy];
	copy.content = [self.content copy];
	copy.data = [self.data copy];

	return copy;
}
@end
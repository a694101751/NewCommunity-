//
//	AllCommentsModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "AllCommentsModel.h"

NSString *const kAllCommentsModelCode = @"code";
NSString *const kAllCommentsModelContent = @"content";
NSString *const kAllCommentsModelData = @"data";

@interface AllCommentsModel ()
@end
@implementation AllCommentsModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kAllCommentsModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kAllCommentsModelCode];
	}	
	if(![dictionary[kAllCommentsModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kAllCommentsModelContent];
	}	
	if(![dictionary[kAllCommentsModelData] isKindOfClass:[NSNull class]]){
		self.data = [[AllCommentsData alloc] initWithDictionary:dictionary[kAllCommentsModelData]];
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
		dictionary[kAllCommentsModelCode] = self.code;
	}
	if(self.content != nil){
		dictionary[kAllCommentsModelContent] = self.content;
	}
	if(self.data != nil){
		dictionary[kAllCommentsModelData] = [self.data toDictionary];
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
		[aCoder encodeObject:self.code forKey:kAllCommentsModelCode];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kAllCommentsModelContent];
	}
	if(self.data != nil){
		[aCoder encodeObject:self.data forKey:kAllCommentsModelData];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kAllCommentsModelCode];
	self.content = [aDecoder decodeObjectForKey:kAllCommentsModelContent];
	self.data = [aDecoder decodeObjectForKey:kAllCommentsModelData];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	AllCommentsModel *copy = [AllCommentsModel new];

	copy.code = [self.code copy];
	copy.content = [self.content copy];
	copy.data = [self.data copy];

	return copy;
}
@end
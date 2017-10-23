//
//	StreetAreaModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "StreetAreaModel.h"

NSString *const kStreetAreaModelCode = @"code";
NSString *const kStreetAreaModelContent = @"content";
NSString *const kStreetAreaModelData = @"data";

@interface StreetAreaModel ()
@end
@implementation StreetAreaModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kStreetAreaModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kStreetAreaModelCode];
	}	
	if(![dictionary[kStreetAreaModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kStreetAreaModelContent];
	}	
	if(![dictionary[kStreetAreaModelData] isKindOfClass:[NSNull class]]){
		self.data = [[StreetAreaData alloc] initWithDictionary:dictionary[kStreetAreaModelData]];
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
		dictionary[kStreetAreaModelCode] = self.code;
	}
	if(self.content != nil){
		dictionary[kStreetAreaModelContent] = self.content;
	}
	if(self.data != nil){
		dictionary[kStreetAreaModelData] = [self.data toDictionary];
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
		[aCoder encodeObject:self.code forKey:kStreetAreaModelCode];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kStreetAreaModelContent];
	}
	if(self.data != nil){
		[aCoder encodeObject:self.data forKey:kStreetAreaModelData];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kStreetAreaModelCode];
	self.content = [aDecoder decodeObjectForKey:kStreetAreaModelContent];
	self.data = [aDecoder decodeObjectForKey:kStreetAreaModelData];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	StreetAreaModel *copy = [StreetAreaModel new];

	copy.code = [self.code copy];
	copy.content = [self.content copy];
	copy.data = [self.data copy];

	return copy;
}
@end
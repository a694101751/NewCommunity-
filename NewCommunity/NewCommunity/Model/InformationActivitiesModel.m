//
//	InformationActivitiesModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "InformationActivitiesModel.h"

NSString *const kInformationActivitiesModelCode = @"code";
NSString *const kInformationActivitiesModelContent = @"content";
NSString *const kInformationActivitiesModelData = @"data";

@interface InformationActivitiesModel ()
@end
@implementation InformationActivitiesModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kInformationActivitiesModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kInformationActivitiesModelCode];
	}	
	if(![dictionary[kInformationActivitiesModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kInformationActivitiesModelContent];
	}	
	if(![dictionary[kInformationActivitiesModelData] isKindOfClass:[NSNull class]]){
		self.data = [[InformationActivitiesData alloc] initWithDictionary:dictionary[kInformationActivitiesModelData]];
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
		dictionary[kInformationActivitiesModelCode] = self.code;
	}
	if(self.content != nil){
		dictionary[kInformationActivitiesModelContent] = self.content;
	}
	if(self.data != nil){
		dictionary[kInformationActivitiesModelData] = [self.data toDictionary];
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
		[aCoder encodeObject:self.code forKey:kInformationActivitiesModelCode];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kInformationActivitiesModelContent];
	}
	if(self.data != nil){
		[aCoder encodeObject:self.data forKey:kInformationActivitiesModelData];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kInformationActivitiesModelCode];
	self.content = [aDecoder decodeObjectForKey:kInformationActivitiesModelContent];
	self.data = [aDecoder decodeObjectForKey:kInformationActivitiesModelData];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	InformationActivitiesModel *copy = [InformationActivitiesModel new];

	copy.code = [self.code copy];
	copy.content = [self.content copy];
	copy.data = [self.data copy];

	return copy;
}
@end
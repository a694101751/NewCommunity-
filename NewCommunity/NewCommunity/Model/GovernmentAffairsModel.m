//
//	GovernmentAffairsModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "GovernmentAffairsModel.h"

NSString *const kGovernmentAffairsModelCode = @"code";
NSString *const kGovernmentAffairsModelContent = @"content";
NSString *const kGovernmentAffairsModelData = @"data";

@interface GovernmentAffairsModel ()
@end
@implementation GovernmentAffairsModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kGovernmentAffairsModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kGovernmentAffairsModelCode];
	}	
	if(![dictionary[kGovernmentAffairsModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kGovernmentAffairsModelContent];
	}	
	if(![dictionary[kGovernmentAffairsModelData] isKindOfClass:[NSNull class]]){
		self.data = [[GovernmentAffairsData alloc] initWithDictionary:dictionary[kGovernmentAffairsModelData]];
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
		dictionary[kGovernmentAffairsModelCode] = self.code;
	}
	if(self.content != nil){
		dictionary[kGovernmentAffairsModelContent] = self.content;
	}
	if(self.data != nil){
		dictionary[kGovernmentAffairsModelData] = [self.data toDictionary];
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
		[aCoder encodeObject:self.code forKey:kGovernmentAffairsModelCode];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kGovernmentAffairsModelContent];
	}
	if(self.data != nil){
		[aCoder encodeObject:self.data forKey:kGovernmentAffairsModelData];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kGovernmentAffairsModelCode];
	self.content = [aDecoder decodeObjectForKey:kGovernmentAffairsModelContent];
	self.data = [aDecoder decodeObjectForKey:kGovernmentAffairsModelData];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	GovernmentAffairsModel *copy = [GovernmentAffairsModel new];

	copy.code = [self.code copy];
	copy.content = [self.content copy];
	copy.data = [self.data copy];

	return copy;
}
@end
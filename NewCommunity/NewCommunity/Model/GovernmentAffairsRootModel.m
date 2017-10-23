//
//	GovernmentAffairsRootModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "GovernmentAffairsRootModel.h"

NSString *const kGovernmentAffairsRootModelCode = @"code";
NSString *const kGovernmentAffairsRootModelContent = @"content";
NSString *const kGovernmentAffairsRootModelData = @"data";

@interface GovernmentAffairsRootModel ()
@end
@implementation GovernmentAffairsRootModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kGovernmentAffairsRootModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kGovernmentAffairsRootModelCode];
	}	
	if(![dictionary[kGovernmentAffairsRootModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kGovernmentAffairsRootModelContent];
	}	
	if(![dictionary[kGovernmentAffairsRootModelData] isKindOfClass:[NSNull class]]){
		self.data = [[GovernmentAffairsRootData alloc] initWithDictionary:dictionary[kGovernmentAffairsRootModelData]];
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
		dictionary[kGovernmentAffairsRootModelCode] = self.code;
	}
	if(self.content != nil){
		dictionary[kGovernmentAffairsRootModelContent] = self.content;
	}
	if(self.data != nil){
		dictionary[kGovernmentAffairsRootModelData] = [self.data toDictionary];
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
		[aCoder encodeObject:self.code forKey:kGovernmentAffairsRootModelCode];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kGovernmentAffairsRootModelContent];
	}
	if(self.data != nil){
		[aCoder encodeObject:self.data forKey:kGovernmentAffairsRootModelData];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kGovernmentAffairsRootModelCode];
	self.content = [aDecoder decodeObjectForKey:kGovernmentAffairsRootModelContent];
	self.data = [aDecoder decodeObjectForKey:kGovernmentAffairsRootModelData];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	GovernmentAffairsRootModel *copy = [GovernmentAffairsRootModel new];

	copy.code = [self.code copy];
	copy.content = [self.content copy];
	copy.data = [self.data copy];

	return copy;
}
@end
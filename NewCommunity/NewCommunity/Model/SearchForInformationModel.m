//
//	SearchForInformationModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "SearchForInformationModel.h"

NSString *const kSearchForInformationModelCode = @"code";
NSString *const kSearchForInformationModelContent = @"content";
NSString *const kSearchForInformationModelData = @"data";

@interface SearchForInformationModel ()
@end
@implementation SearchForInformationModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kSearchForInformationModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kSearchForInformationModelCode];
	}	
	if(![dictionary[kSearchForInformationModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kSearchForInformationModelContent];
	}	
	if(![dictionary[kSearchForInformationModelData] isKindOfClass:[NSNull class]]){
		self.data = [[SearchForInformationData alloc] initWithDictionary:dictionary[kSearchForInformationModelData]];
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
		dictionary[kSearchForInformationModelCode] = self.code;
	}
	if(self.content != nil){
		dictionary[kSearchForInformationModelContent] = self.content;
	}
	if(self.data != nil){
		dictionary[kSearchForInformationModelData] = [self.data toDictionary];
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
		[aCoder encodeObject:self.code forKey:kSearchForInformationModelCode];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kSearchForInformationModelContent];
	}
	if(self.data != nil){
		[aCoder encodeObject:self.data forKey:kSearchForInformationModelData];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kSearchForInformationModelCode];
	self.content = [aDecoder decodeObjectForKey:kSearchForInformationModelContent];
	self.data = [aDecoder decodeObjectForKey:kSearchForInformationModelData];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	SearchForInformationModel *copy = [SearchForInformationModel new];

	copy.code = [self.code copy];
	copy.content = [self.content copy];
	copy.data = [self.data copy];

	return copy;
}
@end
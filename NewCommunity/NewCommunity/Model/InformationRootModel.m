//
//	InformationRootModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "InformationRootModel.h"

NSString *const kInformationRootModelCode = @"code";
NSString *const kInformationRootModelContent = @"content";
NSString *const kInformationRootModelData = @"data";

@interface InformationRootModel ()
@end
@implementation InformationRootModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kInformationRootModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kInformationRootModelCode];
	}	
	if(![dictionary[kInformationRootModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kInformationRootModelContent];
	}	
	if(![dictionary[kInformationRootModelData] isKindOfClass:[NSNull class]]){
		self.data = [[InformationRootData alloc] initWithDictionary:dictionary[kInformationRootModelData]];
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
		dictionary[kInformationRootModelCode] = self.code;
	}
	if(self.content != nil){
		dictionary[kInformationRootModelContent] = self.content;
	}
	if(self.data != nil){
		dictionary[kInformationRootModelData] = [self.data toDictionary];
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
		[aCoder encodeObject:self.code forKey:kInformationRootModelCode];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kInformationRootModelContent];
	}
	if(self.data != nil){
		[aCoder encodeObject:self.data forKey:kInformationRootModelData];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kInformationRootModelCode];
	self.content = [aDecoder decodeObjectForKey:kInformationRootModelContent];
	self.data = [aDecoder decodeObjectForKey:kInformationRootModelData];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	InformationRootModel *copy = [InformationRootModel new];

	copy.code = [self.code copy];
	copy.content = [self.content copy];
	copy.data = [self.data copy];

	return copy;
}
@end
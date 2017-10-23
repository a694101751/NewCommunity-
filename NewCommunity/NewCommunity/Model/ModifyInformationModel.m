//
//	ModifyInformationModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ModifyInformationModel.h"

NSString *const kModifyInformationModelCode = @"code";
NSString *const kModifyInformationModelContent = @"content";

@interface ModifyInformationModel ()
@end
@implementation ModifyInformationModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kModifyInformationModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kModifyInformationModelCode];
	}	
	if(![dictionary[kModifyInformationModelContent] isKindOfClass:[NSNull class]]){
		self.content = [dictionary[kModifyInformationModelContent] boolValue];
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
		dictionary[kModifyInformationModelCode] = self.code;
	}
	dictionary[kModifyInformationModelContent] = @(self.content);
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
		[aCoder encodeObject:self.code forKey:kModifyInformationModelCode];
	}
	[aCoder encodeObject:@(self.content) forKey:kModifyInformationModelContent];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kModifyInformationModelCode];
	self.content = [[aDecoder decodeObjectForKey:kModifyInformationModelContent] boolValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	ModifyInformationModel *copy = [ModifyInformationModel new];

	copy.code = [self.code copy];
	copy.content = self.content;

	return copy;
}
@end
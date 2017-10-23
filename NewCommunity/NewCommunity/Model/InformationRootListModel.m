//
//	InformationRootListModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "InformationRootListModel.h"

NSString *const kInformationRootListModelCode = @"code";
NSString *const kInformationRootListModelContent = @"content";
NSString *const kInformationRootListModelData = @"data";

@interface InformationRootListModel ()
@end
@implementation InformationRootListModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kInformationRootListModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kInformationRootListModelCode];
	}	
	if(![dictionary[kInformationRootListModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kInformationRootListModelContent];
	}	
	if(![dictionary[kInformationRootListModelData] isKindOfClass:[NSNull class]]){
		self.data = [[InformationRootListData alloc] initWithDictionary:dictionary[kInformationRootListModelData]];
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
		dictionary[kInformationRootListModelCode] = self.code;
	}
	if(self.content != nil){
		dictionary[kInformationRootListModelContent] = self.content;
	}
	if(self.data != nil){
		dictionary[kInformationRootListModelData] = [self.data toDictionary];
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
		[aCoder encodeObject:self.code forKey:kInformationRootListModelCode];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kInformationRootListModelContent];
	}
	if(self.data != nil){
		[aCoder encodeObject:self.data forKey:kInformationRootListModelData];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kInformationRootListModelCode];
	self.content = [aDecoder decodeObjectForKey:kInformationRootListModelContent];
	self.data = [aDecoder decodeObjectForKey:kInformationRootListModelData];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	InformationRootListModel *copy = [InformationRootListModel new];

	copy.code = [self.code copy];
	copy.content = [self.content copy];
	copy.data = [self.data copy];

	return copy;
}
@end
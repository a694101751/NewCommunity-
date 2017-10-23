//
//	SearchResultsModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "SearchResultsModel.h"

NSString *const kSearchResultsModelCode = @"code";
NSString *const kSearchResultsModelContent = @"content";
NSString *const kSearchResultsModelData = @"data";

@interface SearchResultsModel ()
@end
@implementation SearchResultsModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kSearchResultsModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kSearchResultsModelCode];
	}	
	if(![dictionary[kSearchResultsModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kSearchResultsModelContent];
	}	
	if(![dictionary[kSearchResultsModelData] isKindOfClass:[NSNull class]]){
		self.data = [[SearchResultsData alloc] initWithDictionary:dictionary[kSearchResultsModelData]];
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
		dictionary[kSearchResultsModelCode] = self.code;
	}
	if(self.content != nil){
		dictionary[kSearchResultsModelContent] = self.content;
	}
	if(self.data != nil){
		dictionary[kSearchResultsModelData] = [self.data toDictionary];
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
		[aCoder encodeObject:self.code forKey:kSearchResultsModelCode];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kSearchResultsModelContent];
	}
	if(self.data != nil){
		[aCoder encodeObject:self.data forKey:kSearchResultsModelData];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kSearchResultsModelCode];
	self.content = [aDecoder decodeObjectForKey:kSearchResultsModelContent];
	self.data = [aDecoder decodeObjectForKey:kSearchResultsModelData];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	SearchResultsModel *copy = [SearchResultsModel new];

	copy.code = [self.code copy];
	copy.content = [self.content copy];
	copy.data = [self.data copy];

	return copy;
}
@end
//
//	SearchResultsData.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "SearchResultsData.h"

NSString *const kSearchResultsDataPage = @"page";
NSString *const kSearchResultsDataPost = @"post";
NSString *const kSearchResultsDataRows = @"rows";
NSString *const kSearchResultsDataTotal = @"total";

@interface SearchResultsData ()
@end
@implementation SearchResultsData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kSearchResultsDataPage] isKindOfClass:[NSNull class]]){
		self.page = dictionary[kSearchResultsDataPage];
	}	
	if(dictionary[kSearchResultsDataPost] != nil && [dictionary[kSearchResultsDataPost] isKindOfClass:[NSArray class]]){
		NSArray * postDictionaries = dictionary[kSearchResultsDataPost];
		NSMutableArray * postItems = [NSMutableArray array];
		for(NSDictionary * postDictionary in postDictionaries){
			SearchResultsPost * postItem = [[SearchResultsPost alloc] initWithDictionary:postDictionary];
			[postItems addObject:postItem];
		}
		self.post = postItems;
	}
	if(![dictionary[kSearchResultsDataRows] isKindOfClass:[NSNull class]]){
		self.rows = dictionary[kSearchResultsDataRows];
	}	
	if(![dictionary[kSearchResultsDataTotal] isKindOfClass:[NSNull class]]){
		self.total = dictionary[kSearchResultsDataTotal];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.page != nil){
		dictionary[kSearchResultsDataPage] = self.page;
	}
	if(self.post != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(SearchResultsPost * postElement in self.post){
			[dictionaryElements addObject:[postElement toDictionary]];
		}
		dictionary[kSearchResultsDataPost] = dictionaryElements;
	}
	if(self.rows != nil){
		dictionary[kSearchResultsDataRows] = self.rows;
	}
	if(self.total != nil){
		dictionary[kSearchResultsDataTotal] = self.total;
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
	if(self.page != nil){
		[aCoder encodeObject:self.page forKey:kSearchResultsDataPage];
	}
	if(self.post != nil){
		[aCoder encodeObject:self.post forKey:kSearchResultsDataPost];
	}
	if(self.rows != nil){
		[aCoder encodeObject:self.rows forKey:kSearchResultsDataRows];
	}
	if(self.total != nil){
		[aCoder encodeObject:self.total forKey:kSearchResultsDataTotal];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.page = [aDecoder decodeObjectForKey:kSearchResultsDataPage];
	self.post = [aDecoder decodeObjectForKey:kSearchResultsDataPost];
	self.rows = [aDecoder decodeObjectForKey:kSearchResultsDataRows];
	self.total = [aDecoder decodeObjectForKey:kSearchResultsDataTotal];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	SearchResultsData *copy = [SearchResultsData new];

	copy.page = [self.page copy];
	copy.post = [self.post copy];
	copy.rows = [self.rows copy];
	copy.total = [self.total copy];

	return copy;
}
@end
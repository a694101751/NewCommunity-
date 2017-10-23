//
//	CommunityLifeListData.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityLifeListData.h"

NSString *const kCommunityLifeListDataPage = @"page";
NSString *const kCommunityLifeListDataPages = @"pages";
NSString *const kCommunityLifeListDataRows = @"rows";
NSString *const kCommunityLifeListDataTotal = @"total";

@interface CommunityLifeListData ()
@end
@implementation CommunityLifeListData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCommunityLifeListDataPage] isKindOfClass:[NSNull class]]){
		self.page = dictionary[kCommunityLifeListDataPage];
	}	
	if(dictionary[kCommunityLifeListDataPages] != nil && [dictionary[kCommunityLifeListDataPages] isKindOfClass:[NSArray class]]){
		NSArray * pagesDictionaries = dictionary[kCommunityLifeListDataPages];
		NSMutableArray * pagesItems = [NSMutableArray array];
		for(NSDictionary * pagesDictionary in pagesDictionaries){
			CommunityLifeListPage * pagesItem = [[CommunityLifeListPage alloc] initWithDictionary:pagesDictionary];
			[pagesItems addObject:pagesItem];
		}
		self.pages = pagesItems;
	}
	if(![dictionary[kCommunityLifeListDataRows] isKindOfClass:[NSNull class]]){
		self.rows = dictionary[kCommunityLifeListDataRows];
	}	
	if(![dictionary[kCommunityLifeListDataTotal] isKindOfClass:[NSNull class]]){
		self.total = dictionary[kCommunityLifeListDataTotal];
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
		dictionary[kCommunityLifeListDataPage] = self.page;
	}
	if(self.pages != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(CommunityLifeListPage * pagesElement in self.pages){
			[dictionaryElements addObject:[pagesElement toDictionary]];
		}
		dictionary[kCommunityLifeListDataPages] = dictionaryElements;
	}
	if(self.rows != nil){
		dictionary[kCommunityLifeListDataRows] = self.rows;
	}
	if(self.total != nil){
		dictionary[kCommunityLifeListDataTotal] = self.total;
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
		[aCoder encodeObject:self.page forKey:kCommunityLifeListDataPage];
	}
	if(self.pages != nil){
		[aCoder encodeObject:self.pages forKey:kCommunityLifeListDataPages];
	}
	if(self.rows != nil){
		[aCoder encodeObject:self.rows forKey:kCommunityLifeListDataRows];
	}
	if(self.total != nil){
		[aCoder encodeObject:self.total forKey:kCommunityLifeListDataTotal];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.page = [aDecoder decodeObjectForKey:kCommunityLifeListDataPage];
	self.pages = [aDecoder decodeObjectForKey:kCommunityLifeListDataPages];
	self.rows = [aDecoder decodeObjectForKey:kCommunityLifeListDataRows];
	self.total = [aDecoder decodeObjectForKey:kCommunityLifeListDataTotal];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityLifeListData *copy = [CommunityLifeListData new];

	copy.page = [self.page copy];
	copy.pages = [self.pages copy];
	copy.rows = [self.rows copy];
	copy.total = [self.total copy];

	return copy;
}
@end
//
//	CommunityTopicData.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityTopicData.h"

NSString *const kCommunityTopicDataPage = @"page";
NSString *const kCommunityTopicDataPages = @"pages";
NSString *const kCommunityTopicDataRows = @"rows";
NSString *const kCommunityTopicDataTotal = @"total";

@interface CommunityTopicData ()
@end
@implementation CommunityTopicData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCommunityTopicDataPage] isKindOfClass:[NSNull class]]){
		self.page = dictionary[kCommunityTopicDataPage];
	}	
	if(dictionary[kCommunityTopicDataPages] != nil && [dictionary[kCommunityTopicDataPages] isKindOfClass:[NSArray class]]){
		NSArray * pagesDictionaries = dictionary[kCommunityTopicDataPages];
		NSMutableArray * pagesItems = [NSMutableArray array];
		for(NSDictionary * pagesDictionary in pagesDictionaries){
			CommunityTopicPage * pagesItem = [[CommunityTopicPage alloc] initWithDictionary:pagesDictionary];
			[pagesItems addObject:pagesItem];
		}
		self.pages = pagesItems;
	}
	if(![dictionary[kCommunityTopicDataRows] isKindOfClass:[NSNull class]]){
		self.rows = dictionary[kCommunityTopicDataRows];
	}	
	if(![dictionary[kCommunityTopicDataTotal] isKindOfClass:[NSNull class]]){
		self.total = dictionary[kCommunityTopicDataTotal];
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
		dictionary[kCommunityTopicDataPage] = self.page;
	}
	if(self.pages != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(CommunityTopicPage * pagesElement in self.pages){
			[dictionaryElements addObject:[pagesElement toDictionary]];
		}
		dictionary[kCommunityTopicDataPages] = dictionaryElements;
	}
	if(self.rows != nil){
		dictionary[kCommunityTopicDataRows] = self.rows;
	}
	if(self.total != nil){
		dictionary[kCommunityTopicDataTotal] = self.total;
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
		[aCoder encodeObject:self.page forKey:kCommunityTopicDataPage];
	}
	if(self.pages != nil){
		[aCoder encodeObject:self.pages forKey:kCommunityTopicDataPages];
	}
	if(self.rows != nil){
		[aCoder encodeObject:self.rows forKey:kCommunityTopicDataRows];
	}
	if(self.total != nil){
		[aCoder encodeObject:self.total forKey:kCommunityTopicDataTotal];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.page = [aDecoder decodeObjectForKey:kCommunityTopicDataPage];
	self.pages = [aDecoder decodeObjectForKey:kCommunityTopicDataPages];
	self.rows = [aDecoder decodeObjectForKey:kCommunityTopicDataRows];
	self.total = [aDecoder decodeObjectForKey:kCommunityTopicDataTotal];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityTopicData *copy = [CommunityTopicData new];

	copy.page = [self.page copy];
	copy.pages = [self.pages copy];
	copy.rows = [self.rows copy];
	copy.total = [self.total copy];

	return copy;
}
@end
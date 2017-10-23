//
//	CommunityLifeDetailsCommentListData.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityLifeDetailsCommentListData.h"

NSString *const kCommunityLifeDetailsCommentListDataPage = @"page";
NSString *const kCommunityLifeDetailsCommentListDataPages = @"pages";
NSString *const kCommunityLifeDetailsCommentListDataRows = @"rows";
NSString *const kCommunityLifeDetailsCommentListDataTotal = @"total";

@interface CommunityLifeDetailsCommentListData ()
@end
@implementation CommunityLifeDetailsCommentListData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCommunityLifeDetailsCommentListDataPage] isKindOfClass:[NSNull class]]){
		self.page = dictionary[kCommunityLifeDetailsCommentListDataPage];
	}	
	if(dictionary[kCommunityLifeDetailsCommentListDataPages] != nil && [dictionary[kCommunityLifeDetailsCommentListDataPages] isKindOfClass:[NSArray class]]){
		NSArray * pagesDictionaries = dictionary[kCommunityLifeDetailsCommentListDataPages];
		NSMutableArray * pagesItems = [NSMutableArray array];
		for(NSDictionary * pagesDictionary in pagesDictionaries){
			CommunityLifeDetailsCommentListPage * pagesItem = [[CommunityLifeDetailsCommentListPage alloc] initWithDictionary:pagesDictionary];
			[pagesItems addObject:pagesItem];
		}
		self.pages = pagesItems;
	}
	if(![dictionary[kCommunityLifeDetailsCommentListDataRows] isKindOfClass:[NSNull class]]){
		self.rows = dictionary[kCommunityLifeDetailsCommentListDataRows];
	}	
	if(![dictionary[kCommunityLifeDetailsCommentListDataTotal] isKindOfClass:[NSNull class]]){
		self.total = dictionary[kCommunityLifeDetailsCommentListDataTotal];
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
		dictionary[kCommunityLifeDetailsCommentListDataPage] = self.page;
	}
	if(self.pages != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(CommunityLifeDetailsCommentListPage * pagesElement in self.pages){
			[dictionaryElements addObject:[pagesElement toDictionary]];
		}
		dictionary[kCommunityLifeDetailsCommentListDataPages] = dictionaryElements;
	}
	if(self.rows != nil){
		dictionary[kCommunityLifeDetailsCommentListDataRows] = self.rows;
	}
	if(self.total != nil){
		dictionary[kCommunityLifeDetailsCommentListDataTotal] = self.total;
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
		[aCoder encodeObject:self.page forKey:kCommunityLifeDetailsCommentListDataPage];
	}
	if(self.pages != nil){
		[aCoder encodeObject:self.pages forKey:kCommunityLifeDetailsCommentListDataPages];
	}
	if(self.rows != nil){
		[aCoder encodeObject:self.rows forKey:kCommunityLifeDetailsCommentListDataRows];
	}
	if(self.total != nil){
		[aCoder encodeObject:self.total forKey:kCommunityLifeDetailsCommentListDataTotal];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.page = [aDecoder decodeObjectForKey:kCommunityLifeDetailsCommentListDataPage];
	self.pages = [aDecoder decodeObjectForKey:kCommunityLifeDetailsCommentListDataPages];
	self.rows = [aDecoder decodeObjectForKey:kCommunityLifeDetailsCommentListDataRows];
	self.total = [aDecoder decodeObjectForKey:kCommunityLifeDetailsCommentListDataTotal];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityLifeDetailsCommentListData *copy = [CommunityLifeDetailsCommentListData new];

	copy.page = [self.page copy];
	copy.pages = [self.pages copy];
	copy.rows = [self.rows copy];
	copy.total = [self.total copy];

	return copy;
}
@end
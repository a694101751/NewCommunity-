//
//	SearchForInformationData.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "SearchForInformationData.h"

NSString *const kSearchForInformationDataPostList = @"postList";

@interface SearchForInformationData ()
@end
@implementation SearchForInformationData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(dictionary[kSearchForInformationDataPostList] != nil && [dictionary[kSearchForInformationDataPostList] isKindOfClass:[NSArray class]]){
		NSArray * postListDictionaries = dictionary[kSearchForInformationDataPostList];
		NSMutableArray * postListItems = [NSMutableArray array];
		for(NSDictionary * postListDictionary in postListDictionaries){
			SearchForInformationPostList * postListItem = [[SearchForInformationPostList alloc] initWithDictionary:postListDictionary];
			[postListItems addObject:postListItem];
		}
		self.postList = postListItems;
	}
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.postList != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(SearchForInformationPostList * postListElement in self.postList){
			[dictionaryElements addObject:[postListElement toDictionary]];
		}
		dictionary[kSearchForInformationDataPostList] = dictionaryElements;
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
	if(self.postList != nil){
		[aCoder encodeObject:self.postList forKey:kSearchForInformationDataPostList];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.postList = [aDecoder decodeObjectForKey:kSearchForInformationDataPostList];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	SearchForInformationData *copy = [SearchForInformationData new];

	copy.postList = [self.postList copy];

	return copy;
}
@end
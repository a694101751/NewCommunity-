//
//	CommunityLifeData.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityLifeData.h"

NSString *const kCommunityLifeDataAdvList = @"advList";
NSString *const kCommunityLifeDataPostList = @"postList";

@interface CommunityLifeData ()
@end
@implementation CommunityLifeData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(dictionary[kCommunityLifeDataAdvList] != nil && [dictionary[kCommunityLifeDataAdvList] isKindOfClass:[NSArray class]]){
		NSArray * advListDictionaries = dictionary[kCommunityLifeDataAdvList];
		NSMutableArray * advListItems = [NSMutableArray array];
		for(NSDictionary * advListDictionary in advListDictionaries){
			CommunityLifeAdvList * advListItem = [[CommunityLifeAdvList alloc] initWithDictionary:advListDictionary];
			[advListItems addObject:advListItem];
		}
		self.advList = advListItems;
	}
	if(dictionary[kCommunityLifeDataPostList] != nil && [dictionary[kCommunityLifeDataPostList] isKindOfClass:[NSArray class]]){
		NSArray * postListDictionaries = dictionary[kCommunityLifeDataPostList];
		NSMutableArray * postListItems = [NSMutableArray array];
		for(NSDictionary * postListDictionary in postListDictionaries){
			CommunityLifePostList * postListItem = [[CommunityLifePostList alloc] initWithDictionary:postListDictionary];
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
	if(self.advList != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(CommunityLifeAdvList * advListElement in self.advList){
			[dictionaryElements addObject:[advListElement toDictionary]];
		}
		dictionary[kCommunityLifeDataAdvList] = dictionaryElements;
	}
	if(self.postList != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(CommunityLifePostList * postListElement in self.postList){
			[dictionaryElements addObject:[postListElement toDictionary]];
		}
		dictionary[kCommunityLifeDataPostList] = dictionaryElements;
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
	if(self.advList != nil){
		[aCoder encodeObject:self.advList forKey:kCommunityLifeDataAdvList];
	}
	if(self.postList != nil){
		[aCoder encodeObject:self.postList forKey:kCommunityLifeDataPostList];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.advList = [aDecoder decodeObjectForKey:kCommunityLifeDataAdvList];
	self.postList = [aDecoder decodeObjectForKey:kCommunityLifeDataPostList];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityLifeData *copy = [CommunityLifeData new];

	copy.advList = [self.advList copy];
	copy.postList = [self.postList copy];

	return copy;
}
@end
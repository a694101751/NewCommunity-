//
//	CommunityShareData.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityShareData.h"

NSString *const kCommunityShareDataAdvList = @"advList";
NSString *const kCommunityShareDataPostList = @"postList";

@interface CommunityShareData ()
@end
@implementation CommunityShareData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(dictionary[kCommunityShareDataAdvList] != nil && [dictionary[kCommunityShareDataAdvList] isKindOfClass:[NSArray class]]){
		NSArray * advListDictionaries = dictionary[kCommunityShareDataAdvList];
		NSMutableArray * advListItems = [NSMutableArray array];
		for(NSDictionary * advListDictionary in advListDictionaries){
			CommunityShareAdvList * advListItem = [[CommunityShareAdvList alloc] initWithDictionary:advListDictionary];
			[advListItems addObject:advListItem];
		}
		self.advList = advListItems;
	}
	if(dictionary[kCommunityShareDataPostList] != nil && [dictionary[kCommunityShareDataPostList] isKindOfClass:[NSArray class]]){
		NSArray * postListDictionaries = dictionary[kCommunityShareDataPostList];
		NSMutableArray * postListItems = [NSMutableArray array];
		for(NSDictionary * postListDictionary in postListDictionaries){
			CommunitySharePostList * postListItem = [[CommunitySharePostList alloc] initWithDictionary:postListDictionary];
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
		for(CommunityShareAdvList * advListElement in self.advList){
			[dictionaryElements addObject:[advListElement toDictionary]];
		}
		dictionary[kCommunityShareDataAdvList] = dictionaryElements;
	}
	if(self.postList != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(CommunitySharePostList * postListElement in self.postList){
			[dictionaryElements addObject:[postListElement toDictionary]];
		}
		dictionary[kCommunityShareDataPostList] = dictionaryElements;
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
		[aCoder encodeObject:self.advList forKey:kCommunityShareDataAdvList];
	}
	if(self.postList != nil){
		[aCoder encodeObject:self.postList forKey:kCommunityShareDataPostList];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.advList = [aDecoder decodeObjectForKey:kCommunityShareDataAdvList];
	self.postList = [aDecoder decodeObjectForKey:kCommunityShareDataPostList];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityShareData *copy = [CommunityShareData new];

	copy.advList = [self.advList copy];
	copy.postList = [self.postList copy];

	return copy;
}
@end
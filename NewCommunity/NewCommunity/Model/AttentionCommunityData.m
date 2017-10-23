//
//	AttentionCommunityData.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "AttentionCommunityData.h"

NSString *const kAttentionCommunityDataPages = @"pages";

@interface AttentionCommunityData ()
@end
@implementation AttentionCommunityData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(dictionary[kAttentionCommunityDataPages] != nil && [dictionary[kAttentionCommunityDataPages] isKindOfClass:[NSArray class]]){
		NSArray * pagesDictionaries = dictionary[kAttentionCommunityDataPages];
		NSMutableArray * pagesItems = [NSMutableArray array];
		for(NSDictionary * pagesDictionary in pagesDictionaries){
			AttentionCommunityPage * pagesItem = [[AttentionCommunityPage alloc] initWithDictionary:pagesDictionary];
			[pagesItems addObject:pagesItem];
		}
		self.pages = pagesItems;
	}
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.pages != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(AttentionCommunityPage * pagesElement in self.pages){
			[dictionaryElements addObject:[pagesElement toDictionary]];
		}
		dictionary[kAttentionCommunityDataPages] = dictionaryElements;
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
	if(self.pages != nil){
		[aCoder encodeObject:self.pages forKey:kAttentionCommunityDataPages];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.pages = [aDecoder decodeObjectForKey:kAttentionCommunityDataPages];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	AttentionCommunityData *copy = [AttentionCommunityData new];

	copy.pages = [self.pages copy];

	return copy;
}
@end
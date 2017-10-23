//
//	DetailsModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DetailsModel.h"

NSString *const kDetailsModelCode = @"code";
NSString *const kDetailsModelDetail = @"detail";
NSString *const kDetailsModelPostRecommendList = @"postRecommendList";

@interface DetailsModel ()
@end
@implementation DetailsModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDetailsModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kDetailsModelCode];
	}	
	if(![dictionary[kDetailsModelDetail] isKindOfClass:[NSNull class]]){
		self.detail = [[DetailsDetail alloc] initWithDictionary:dictionary[kDetailsModelDetail]];
	}

	if(dictionary[kDetailsModelPostRecommendList] != nil && [dictionary[kDetailsModelPostRecommendList] isKindOfClass:[NSArray class]]){
		NSArray * postRecommendListDictionaries = dictionary[kDetailsModelPostRecommendList];
		NSMutableArray * postRecommendListItems = [NSMutableArray array];
		for(NSDictionary * postRecommendListDictionary in postRecommendListDictionaries){
			DetailsPostRecommendList * postRecommendListItem = [[DetailsPostRecommendList alloc] initWithDictionary:postRecommendListDictionary];
			[postRecommendListItems addObject:postRecommendListItem];
		}
		self.postRecommendList = postRecommendListItems;
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
		dictionary[kDetailsModelCode] = self.code;
	}
	if(self.detail != nil){
		dictionary[kDetailsModelDetail] = [self.detail toDictionary];
	}
	if(self.postRecommendList != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(DetailsPostRecommendList * postRecommendListElement in self.postRecommendList){
			[dictionaryElements addObject:[postRecommendListElement toDictionary]];
		}
		dictionary[kDetailsModelPostRecommendList] = dictionaryElements;
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
		[aCoder encodeObject:self.code forKey:kDetailsModelCode];
	}
	if(self.detail != nil){
		[aCoder encodeObject:self.detail forKey:kDetailsModelDetail];
	}
	if(self.postRecommendList != nil){
		[aCoder encodeObject:self.postRecommendList forKey:kDetailsModelPostRecommendList];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kDetailsModelCode];
	self.detail = [aDecoder decodeObjectForKey:kDetailsModelDetail];
	self.postRecommendList = [aDecoder decodeObjectForKey:kDetailsModelPostRecommendList];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DetailsModel *copy = [DetailsModel new];

	copy.code = [self.code copy];
	copy.detail = [self.detail copy];
	copy.postRecommendList = [self.postRecommendList copy];

	return copy;
}
@end
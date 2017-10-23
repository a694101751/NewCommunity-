//
//	ProjectDetailsModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ProjectDetailsModel.h"

NSString *const kProjectDetailsModelCode = @"code";
NSString *const kProjectDetailsModelDetail = @"detail";
NSString *const kProjectDetailsModelPostRecommendList = @"postRecommendList";

@interface ProjectDetailsModel ()
@end
@implementation ProjectDetailsModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kProjectDetailsModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kProjectDetailsModelCode];
	}	
	if(![dictionary[kProjectDetailsModelDetail] isKindOfClass:[NSNull class]]){
		self.detail = [[ProjectDetailsDetail alloc] initWithDictionary:dictionary[kProjectDetailsModelDetail]];
	}

	if(dictionary[kProjectDetailsModelPostRecommendList] != nil && [dictionary[kProjectDetailsModelPostRecommendList] isKindOfClass:[NSArray class]]){
		NSArray * postRecommendListDictionaries = dictionary[kProjectDetailsModelPostRecommendList];
		NSMutableArray * postRecommendListItems = [NSMutableArray array];
		for(NSDictionary * postRecommendListDictionary in postRecommendListDictionaries){
			ProjectDetailsPostRecommendList * postRecommendListItem = [[ProjectDetailsPostRecommendList alloc] initWithDictionary:postRecommendListDictionary];
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
		dictionary[kProjectDetailsModelCode] = self.code;
	}
	if(self.detail != nil){
		dictionary[kProjectDetailsModelDetail] = [self.detail toDictionary];
	}
	if(self.postRecommendList != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(ProjectDetailsPostRecommendList * postRecommendListElement in self.postRecommendList){
			[dictionaryElements addObject:[postRecommendListElement toDictionary]];
		}
		dictionary[kProjectDetailsModelPostRecommendList] = dictionaryElements;
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
		[aCoder encodeObject:self.code forKey:kProjectDetailsModelCode];
	}
	if(self.detail != nil){
		[aCoder encodeObject:self.detail forKey:kProjectDetailsModelDetail];
	}
	if(self.postRecommendList != nil){
		[aCoder encodeObject:self.postRecommendList forKey:kProjectDetailsModelPostRecommendList];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kProjectDetailsModelCode];
	self.detail = [aDecoder decodeObjectForKey:kProjectDetailsModelDetail];
	self.postRecommendList = [aDecoder decodeObjectForKey:kProjectDetailsModelPostRecommendList];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	ProjectDetailsModel *copy = [ProjectDetailsModel new];

	copy.code = [self.code copy];
	copy.detail = [self.detail copy];
	copy.postRecommendList = [self.postRecommendList copy];

	return copy;
}
@end
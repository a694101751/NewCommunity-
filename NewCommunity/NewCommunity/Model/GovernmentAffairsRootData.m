//
//	GovernmentAffairsRootData.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "GovernmentAffairsRootData.h"

NSString *const kGovernmentAffairsRootDataCareList = @"CareList";
NSString *const kGovernmentAffairsRootDataAdvList = @"advList";
NSString *const kGovernmentAffairsRootDataTopicList = @"topicList";

@interface GovernmentAffairsRootData ()
@end
@implementation GovernmentAffairsRootData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(dictionary[kGovernmentAffairsRootDataCareList] != nil && [dictionary[kGovernmentAffairsRootDataCareList] isKindOfClass:[NSArray class]]){
		NSArray * careListDictionaries = dictionary[kGovernmentAffairsRootDataCareList];
		NSMutableArray * careListItems = [NSMutableArray array];
		for(NSDictionary * careListDictionary in careListDictionaries){
			GovernmentAffairsRootCareList * careListItem = [[GovernmentAffairsRootCareList alloc] initWithDictionary:careListDictionary];
			[careListItems addObject:careListItem];
		}
		self.careList = careListItems;
	}
	if(dictionary[kGovernmentAffairsRootDataAdvList] != nil && [dictionary[kGovernmentAffairsRootDataAdvList] isKindOfClass:[NSArray class]]){
		NSArray * advListDictionaries = dictionary[kGovernmentAffairsRootDataAdvList];
		NSMutableArray * advListItems = [NSMutableArray array];
		for(NSDictionary * advListDictionary in advListDictionaries){
			GovernmentAffairsRootAdvList * advListItem = [[GovernmentAffairsRootAdvList alloc] initWithDictionary:advListDictionary];
			[advListItems addObject:advListItem];
		}
		self.advList = advListItems;
	}
	if(dictionary[kGovernmentAffairsRootDataTopicList] != nil && [dictionary[kGovernmentAffairsRootDataTopicList] isKindOfClass:[NSArray class]]){
		NSArray * topicListDictionaries = dictionary[kGovernmentAffairsRootDataTopicList];
		NSMutableArray * topicListItems = [NSMutableArray array];
		for(NSDictionary * topicListDictionary in topicListDictionaries){
			GovernmentAffairsRootCareList * topicListItem = [[GovernmentAffairsRootCareList alloc] initWithDictionary:topicListDictionary];
			[topicListItems addObject:topicListItem];
		}
		self.topicList = topicListItems;
	}
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.careList != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(GovernmentAffairsRootCareList * careListElement in self.careList){
			[dictionaryElements addObject:[careListElement toDictionary]];
		}
		dictionary[kGovernmentAffairsRootDataCareList] = dictionaryElements;
	}
	if(self.advList != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(GovernmentAffairsRootAdvList * advListElement in self.advList){
			[dictionaryElements addObject:[advListElement toDictionary]];
		}
		dictionary[kGovernmentAffairsRootDataAdvList] = dictionaryElements;
	}
	if(self.topicList != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(GovernmentAffairsRootCareList * topicListElement in self.topicList){
			[dictionaryElements addObject:[topicListElement toDictionary]];
		}
		dictionary[kGovernmentAffairsRootDataTopicList] = dictionaryElements;
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
	if(self.careList != nil){
		[aCoder encodeObject:self.careList forKey:kGovernmentAffairsRootDataCareList];
	}
	if(self.advList != nil){
		[aCoder encodeObject:self.advList forKey:kGovernmentAffairsRootDataAdvList];
	}
	if(self.topicList != nil){
		[aCoder encodeObject:self.topicList forKey:kGovernmentAffairsRootDataTopicList];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.careList = [aDecoder decodeObjectForKey:kGovernmentAffairsRootDataCareList];
	self.advList = [aDecoder decodeObjectForKey:kGovernmentAffairsRootDataAdvList];
	self.topicList = [aDecoder decodeObjectForKey:kGovernmentAffairsRootDataTopicList];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	GovernmentAffairsRootData *copy = [GovernmentAffairsRootData new];

	copy.careList = [self.careList copy];
	copy.advList = [self.advList copy];
	copy.topicList = [self.topicList copy];

	return copy;
}
@end
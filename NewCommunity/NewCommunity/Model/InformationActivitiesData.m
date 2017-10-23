//
//	InformationActivitiesData.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "InformationActivitiesData.h"

NSString *const kInformationActivitiesDataActivityList = @"activityList";
NSString *const kInformationActivitiesDataPage = @"page";
NSString *const kInformationActivitiesDataRows = @"rows";
NSString *const kInformationActivitiesDataTotal = @"total";

@interface InformationActivitiesData ()
@end
@implementation InformationActivitiesData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(dictionary[kInformationActivitiesDataActivityList] != nil && [dictionary[kInformationActivitiesDataActivityList] isKindOfClass:[NSArray class]]){
		NSArray * activityListDictionaries = dictionary[kInformationActivitiesDataActivityList];
		NSMutableArray * activityListItems = [NSMutableArray array];
		for(NSDictionary * activityListDictionary in activityListDictionaries){
			InformationActivitiesActivityList * activityListItem = [[InformationActivitiesActivityList alloc] initWithDictionary:activityListDictionary];
			[activityListItems addObject:activityListItem];
		}
		self.activityList = activityListItems;
	}
	if(![dictionary[kInformationActivitiesDataPage] isKindOfClass:[NSNull class]]){
		self.page = dictionary[kInformationActivitiesDataPage];
	}	
	if(![dictionary[kInformationActivitiesDataRows] isKindOfClass:[NSNull class]]){
		self.rows = dictionary[kInformationActivitiesDataRows];
	}	
	if(![dictionary[kInformationActivitiesDataTotal] isKindOfClass:[NSNull class]]){
		self.total = dictionary[kInformationActivitiesDataTotal];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.activityList != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(InformationActivitiesActivityList * activityListElement in self.activityList){
			[dictionaryElements addObject:[activityListElement toDictionary]];
		}
		dictionary[kInformationActivitiesDataActivityList] = dictionaryElements;
	}
	if(self.page != nil){
		dictionary[kInformationActivitiesDataPage] = self.page;
	}
	if(self.rows != nil){
		dictionary[kInformationActivitiesDataRows] = self.rows;
	}
	if(self.total != nil){
		dictionary[kInformationActivitiesDataTotal] = self.total;
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
	if(self.activityList != nil){
		[aCoder encodeObject:self.activityList forKey:kInformationActivitiesDataActivityList];
	}
	if(self.page != nil){
		[aCoder encodeObject:self.page forKey:kInformationActivitiesDataPage];
	}
	if(self.rows != nil){
		[aCoder encodeObject:self.rows forKey:kInformationActivitiesDataRows];
	}
	if(self.total != nil){
		[aCoder encodeObject:self.total forKey:kInformationActivitiesDataTotal];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.activityList = [aDecoder decodeObjectForKey:kInformationActivitiesDataActivityList];
	self.page = [aDecoder decodeObjectForKey:kInformationActivitiesDataPage];
	self.rows = [aDecoder decodeObjectForKey:kInformationActivitiesDataRows];
	self.total = [aDecoder decodeObjectForKey:kInformationActivitiesDataTotal];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	InformationActivitiesData *copy = [InformationActivitiesData new];

	copy.activityList = [self.activityList copy];
	copy.page = [self.page copy];
	copy.rows = [self.rows copy];
	copy.total = [self.total copy];

	return copy;
}
@end
//
//	InformationRootData.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "InformationRootData.h"

NSString *const kInformationRootDataAdvList = @"advList";
NSString *const kInformationRootDataIstop = @"istop";

@interface InformationRootData ()
@end
@implementation InformationRootData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(dictionary[kInformationRootDataAdvList] != nil && [dictionary[kInformationRootDataAdvList] isKindOfClass:[NSArray class]]){
		NSArray * advListDictionaries = dictionary[kInformationRootDataAdvList];
		NSMutableArray * advListItems = [NSMutableArray array];
		for(NSDictionary * advListDictionary in advListDictionaries){
			InformationRootAdvList * advListItem = [[InformationRootAdvList alloc] initWithDictionary:advListDictionary];
			[advListItems addObject:advListItem];
		}
		self.advList = advListItems;
	}
	if(dictionary[kInformationRootDataIstop] != nil && [dictionary[kInformationRootDataIstop] isKindOfClass:[NSArray class]]){
		NSArray * istopDictionaries = dictionary[kInformationRootDataIstop];
		NSMutableArray * istopItems = [NSMutableArray array];
		for(NSDictionary * istopDictionary in istopDictionaries){
			InformationRootIstop * istopItem = [[InformationRootIstop alloc] initWithDictionary:istopDictionary];
			[istopItems addObject:istopItem];
		}
		self.istop = istopItems;
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
		for(InformationRootAdvList * advListElement in self.advList){
			[dictionaryElements addObject:[advListElement toDictionary]];
		}
		dictionary[kInformationRootDataAdvList] = dictionaryElements;
	}
	if(self.istop != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(InformationRootIstop * istopElement in self.istop){
			[dictionaryElements addObject:[istopElement toDictionary]];
		}
		dictionary[kInformationRootDataIstop] = dictionaryElements;
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
		[aCoder encodeObject:self.advList forKey:kInformationRootDataAdvList];
	}
	if(self.istop != nil){
		[aCoder encodeObject:self.istop forKey:kInformationRootDataIstop];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.advList = [aDecoder decodeObjectForKey:kInformationRootDataAdvList];
	self.istop = [aDecoder decodeObjectForKey:kInformationRootDataIstop];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	InformationRootData *copy = [InformationRootData new];

	copy.advList = [self.advList copy];
	copy.istop = [self.istop copy];

	return copy;
}
@end
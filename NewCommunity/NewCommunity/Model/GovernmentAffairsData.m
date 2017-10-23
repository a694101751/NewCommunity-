//
//	GovernmentAffairsData.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "GovernmentAffairsData.h"

NSString *const kGovernmentAffairsDataPage = @"page";
NSString *const kGovernmentAffairsDataPost = @"post";
NSString *const kGovernmentAffairsDataRows = @"rows";
NSString *const kGovernmentAffairsDataTotal = @"total";

@interface GovernmentAffairsData ()
@end
@implementation GovernmentAffairsData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kGovernmentAffairsDataPage] isKindOfClass:[NSNull class]]){
		self.page = dictionary[kGovernmentAffairsDataPage];
	}	
	if(dictionary[kGovernmentAffairsDataPost] != nil && [dictionary[kGovernmentAffairsDataPost] isKindOfClass:[NSArray class]]){
		NSArray * postDictionaries = dictionary[kGovernmentAffairsDataPost];
		NSMutableArray * postItems = [NSMutableArray array];
		for(NSDictionary * postDictionary in postDictionaries){
			GovernmentAffairsPost * postItem = [[GovernmentAffairsPost alloc] initWithDictionary:postDictionary];
			[postItems addObject:postItem];
		}
		self.post = postItems;
	}
	if(![dictionary[kGovernmentAffairsDataRows] isKindOfClass:[NSNull class]]){
		self.rows = dictionary[kGovernmentAffairsDataRows];
	}	
	if(![dictionary[kGovernmentAffairsDataTotal] isKindOfClass:[NSNull class]]){
		self.total = dictionary[kGovernmentAffairsDataTotal];
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
		dictionary[kGovernmentAffairsDataPage] = self.page;
	}
	if(self.post != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(GovernmentAffairsPost * postElement in self.post){
			[dictionaryElements addObject:[postElement toDictionary]];
		}
		dictionary[kGovernmentAffairsDataPost] = dictionaryElements;
	}
	if(self.rows != nil){
		dictionary[kGovernmentAffairsDataRows] = self.rows;
	}
	if(self.total != nil){
		dictionary[kGovernmentAffairsDataTotal] = self.total;
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
		[aCoder encodeObject:self.page forKey:kGovernmentAffairsDataPage];
	}
	if(self.post != nil){
		[aCoder encodeObject:self.post forKey:kGovernmentAffairsDataPost];
	}
	if(self.rows != nil){
		[aCoder encodeObject:self.rows forKey:kGovernmentAffairsDataRows];
	}
	if(self.total != nil){
		[aCoder encodeObject:self.total forKey:kGovernmentAffairsDataTotal];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.page = [aDecoder decodeObjectForKey:kGovernmentAffairsDataPage];
	self.post = [aDecoder decodeObjectForKey:kGovernmentAffairsDataPost];
	self.rows = [aDecoder decodeObjectForKey:kGovernmentAffairsDataRows];
	self.total = [aDecoder decodeObjectForKey:kGovernmentAffairsDataTotal];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	GovernmentAffairsData *copy = [GovernmentAffairsData new];

	copy.page = [self.page copy];
	copy.post = [self.post copy];
	copy.rows = [self.rows copy];
	copy.total = [self.total copy];

	return copy;
}
@end
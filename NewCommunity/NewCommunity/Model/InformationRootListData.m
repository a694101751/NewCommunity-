//
//	InformationRootListData.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "InformationRootListData.h"

NSString *const kInformationRootListDataPage = @"page";
NSString *const kInformationRootListDataPost = @"post";
NSString *const kInformationRootListDataRows = @"rows";
NSString *const kInformationRootListDataTotal = @"total";

@interface InformationRootListData ()
@end
@implementation InformationRootListData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kInformationRootListDataPage] isKindOfClass:[NSNull class]]){
		self.page = dictionary[kInformationRootListDataPage];
	}	
	if(dictionary[kInformationRootListDataPost] != nil && [dictionary[kInformationRootListDataPost] isKindOfClass:[NSArray class]]){
		NSArray * postDictionaries = dictionary[kInformationRootListDataPost];
		NSMutableArray * postItems = [NSMutableArray array];
		for(NSDictionary * postDictionary in postDictionaries){
			InformationRootListPost * postItem = [[InformationRootListPost alloc] initWithDictionary:postDictionary];
			[postItems addObject:postItem];
		}
		self.post = postItems;
	}
	if(![dictionary[kInformationRootListDataRows] isKindOfClass:[NSNull class]]){
		self.rows = dictionary[kInformationRootListDataRows];
	}	
	if(![dictionary[kInformationRootListDataTotal] isKindOfClass:[NSNull class]]){
		self.total = dictionary[kInformationRootListDataTotal];
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
		dictionary[kInformationRootListDataPage] = self.page;
	}
	if(self.post != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(InformationRootListPost * postElement in self.post){
			[dictionaryElements addObject:[postElement toDictionary]];
		}
		dictionary[kInformationRootListDataPost] = dictionaryElements;
	}
	if(self.rows != nil){
		dictionary[kInformationRootListDataRows] = self.rows;
	}
	if(self.total != nil){
		dictionary[kInformationRootListDataTotal] = self.total;
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
		[aCoder encodeObject:self.page forKey:kInformationRootListDataPage];
	}
	if(self.post != nil){
		[aCoder encodeObject:self.post forKey:kInformationRootListDataPost];
	}
	if(self.rows != nil){
		[aCoder encodeObject:self.rows forKey:kInformationRootListDataRows];
	}
	if(self.total != nil){
		[aCoder encodeObject:self.total forKey:kInformationRootListDataTotal];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.page = [aDecoder decodeObjectForKey:kInformationRootListDataPage];
	self.post = [aDecoder decodeObjectForKey:kInformationRootListDataPost];
	self.rows = [aDecoder decodeObjectForKey:kInformationRootListDataRows];
	self.total = [aDecoder decodeObjectForKey:kInformationRootListDataTotal];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	InformationRootListData *copy = [InformationRootListData new];

	copy.page = [self.page copy];
	copy.post = [self.post copy];
	copy.rows = [self.rows copy];
	copy.total = [self.total copy];

	return copy;
}
@end
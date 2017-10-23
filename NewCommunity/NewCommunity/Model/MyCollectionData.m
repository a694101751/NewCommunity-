//
//	MyCollectionData.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "MyCollectionData.h"

NSString *const kMyCollectionDataPage = @"page";
NSString *const kMyCollectionDataPost = @"post";
NSString *const kMyCollectionDataRows = @"rows";
NSString *const kMyCollectionDataTotal = @"total";

@interface MyCollectionData ()
@end
@implementation MyCollectionData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kMyCollectionDataPage] isKindOfClass:[NSNull class]]){
		self.page = dictionary[kMyCollectionDataPage];
	}	
	if(dictionary[kMyCollectionDataPost] != nil && [dictionary[kMyCollectionDataPost] isKindOfClass:[NSArray class]]){
		NSArray * postDictionaries = dictionary[kMyCollectionDataPost];
		NSMutableArray * postItems = [NSMutableArray array];
		for(NSDictionary * postDictionary in postDictionaries){
			MyCollectionPost * postItem = [[MyCollectionPost alloc] initWithDictionary:postDictionary];
			[postItems addObject:postItem];
		}
		self.post = postItems;
	}
	if(![dictionary[kMyCollectionDataRows] isKindOfClass:[NSNull class]]){
		self.rows = dictionary[kMyCollectionDataRows];
	}	
	if(![dictionary[kMyCollectionDataTotal] isKindOfClass:[NSNull class]]){
		self.total = dictionary[kMyCollectionDataTotal];
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
		dictionary[kMyCollectionDataPage] = self.page;
	}
	if(self.post != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(MyCollectionPost * postElement in self.post){
			[dictionaryElements addObject:[postElement toDictionary]];
		}
		dictionary[kMyCollectionDataPost] = dictionaryElements;
	}
	if(self.rows != nil){
		dictionary[kMyCollectionDataRows] = self.rows;
	}
	if(self.total != nil){
		dictionary[kMyCollectionDataTotal] = self.total;
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
		[aCoder encodeObject:self.page forKey:kMyCollectionDataPage];
	}
	if(self.post != nil){
		[aCoder encodeObject:self.post forKey:kMyCollectionDataPost];
	}
	if(self.rows != nil){
		[aCoder encodeObject:self.rows forKey:kMyCollectionDataRows];
	}
	if(self.total != nil){
		[aCoder encodeObject:self.total forKey:kMyCollectionDataTotal];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.page = [aDecoder decodeObjectForKey:kMyCollectionDataPage];
	self.post = [aDecoder decodeObjectForKey:kMyCollectionDataPost];
	self.rows = [aDecoder decodeObjectForKey:kMyCollectionDataRows];
	self.total = [aDecoder decodeObjectForKey:kMyCollectionDataTotal];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	MyCollectionData *copy = [MyCollectionData new];

	copy.page = [self.page copy];
	copy.post = [self.post copy];
	copy.rows = [self.rows copy];
	copy.total = [self.total copy];

	return copy;
}
@end
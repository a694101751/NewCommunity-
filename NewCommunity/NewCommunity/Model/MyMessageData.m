//
//	MyMessageData.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "MyMessageData.h"

NSString *const kMyMessageDataPage = @"page";
NSString *const kMyMessageDataPages = @"pages";
NSString *const kMyMessageDataRows = @"rows";
NSString *const kMyMessageDataTotal = @"total";

@interface MyMessageData ()
@end
@implementation MyMessageData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kMyMessageDataPage] isKindOfClass:[NSNull class]]){
		self.page = dictionary[kMyMessageDataPage];
	}	
	if(dictionary[kMyMessageDataPages] != nil && [dictionary[kMyMessageDataPages] isKindOfClass:[NSArray class]]){
		NSArray * pagesDictionaries = dictionary[kMyMessageDataPages];
		NSMutableArray * pagesItems = [NSMutableArray array];
		for(NSDictionary * pagesDictionary in pagesDictionaries){
			MyMessagePage * pagesItem = [[MyMessagePage alloc] initWithDictionary:pagesDictionary];
			[pagesItems addObject:pagesItem];
		}
		self.pages = pagesItems;
	}
	if(![dictionary[kMyMessageDataRows] isKindOfClass:[NSNull class]]){
		self.rows = dictionary[kMyMessageDataRows];
	}	
	if(![dictionary[kMyMessageDataTotal] isKindOfClass:[NSNull class]]){
		self.total = dictionary[kMyMessageDataTotal];
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
		dictionary[kMyMessageDataPage] = self.page;
	}
	if(self.pages != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(MyMessagePage * pagesElement in self.pages){
			[dictionaryElements addObject:[pagesElement toDictionary]];
		}
		dictionary[kMyMessageDataPages] = dictionaryElements;
	}
	if(self.rows != nil){
		dictionary[kMyMessageDataRows] = self.rows;
	}
	if(self.total != nil){
		dictionary[kMyMessageDataTotal] = self.total;
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
		[aCoder encodeObject:self.page forKey:kMyMessageDataPage];
	}
	if(self.pages != nil){
		[aCoder encodeObject:self.pages forKey:kMyMessageDataPages];
	}
	if(self.rows != nil){
		[aCoder encodeObject:self.rows forKey:kMyMessageDataRows];
	}
	if(self.total != nil){
		[aCoder encodeObject:self.total forKey:kMyMessageDataTotal];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.page = [aDecoder decodeObjectForKey:kMyMessageDataPage];
	self.pages = [aDecoder decodeObjectForKey:kMyMessageDataPages];
	self.rows = [aDecoder decodeObjectForKey:kMyMessageDataRows];
	self.total = [aDecoder decodeObjectForKey:kMyMessageDataTotal];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	MyMessageData *copy = [MyMessageData new];

	copy.page = [self.page copy];
	copy.pages = [self.pages copy];
	copy.rows = [self.rows copy];
	copy.total = [self.total copy];

	return copy;
}
@end
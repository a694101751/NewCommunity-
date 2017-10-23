//
//	AllCommentsData.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "AllCommentsData.h"

NSString *const kAllCommentsDataPage = @"page";
NSString *const kAllCommentsDataPost = @"post";
NSString *const kAllCommentsDataRows = @"rows";
NSString *const kAllCommentsDataTotal = @"total";

@interface AllCommentsData ()
@end
@implementation AllCommentsData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kAllCommentsDataPage] isKindOfClass:[NSNull class]]){
		self.page = dictionary[kAllCommentsDataPage];
	}	
	if(dictionary[kAllCommentsDataPost] != nil && [dictionary[kAllCommentsDataPost] isKindOfClass:[NSArray class]]){
		NSArray * postDictionaries = dictionary[kAllCommentsDataPost];
		NSMutableArray * postItems = [NSMutableArray array];
		for(NSDictionary * postDictionary in postDictionaries){
			AllCommentsPost * postItem = [[AllCommentsPost alloc] initWithDictionary:postDictionary];
			[postItems addObject:postItem];
		}
		self.post = postItems;
	}
	if(![dictionary[kAllCommentsDataRows] isKindOfClass:[NSNull class]]){
		self.rows = dictionary[kAllCommentsDataRows];
	}	
	if(![dictionary[kAllCommentsDataTotal] isKindOfClass:[NSNull class]]){
		self.total = dictionary[kAllCommentsDataTotal];
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
		dictionary[kAllCommentsDataPage] = self.page;
	}
	if(self.post != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(AllCommentsPost * postElement in self.post){
			[dictionaryElements addObject:[postElement toDictionary]];
		}
		dictionary[kAllCommentsDataPost] = dictionaryElements;
	}
	if(self.rows != nil){
		dictionary[kAllCommentsDataRows] = self.rows;
	}
	if(self.total != nil){
		dictionary[kAllCommentsDataTotal] = self.total;
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
		[aCoder encodeObject:self.page forKey:kAllCommentsDataPage];
	}
	if(self.post != nil){
		[aCoder encodeObject:self.post forKey:kAllCommentsDataPost];
	}
	if(self.rows != nil){
		[aCoder encodeObject:self.rows forKey:kAllCommentsDataRows];
	}
	if(self.total != nil){
		[aCoder encodeObject:self.total forKey:kAllCommentsDataTotal];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.page = [aDecoder decodeObjectForKey:kAllCommentsDataPage];
	self.post = [aDecoder decodeObjectForKey:kAllCommentsDataPost];
	self.rows = [aDecoder decodeObjectForKey:kAllCommentsDataRows];
	self.total = [aDecoder decodeObjectForKey:kAllCommentsDataTotal];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	AllCommentsData *copy = [AllCommentsData new];

	copy.page = [self.page copy];
	copy.post = [self.post copy];
	copy.rows = [self.rows copy];
	copy.total = [self.total copy];

	return copy;
}
@end
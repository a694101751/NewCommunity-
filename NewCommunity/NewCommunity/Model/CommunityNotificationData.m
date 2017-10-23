//
//	CommunityNotificationData.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityNotificationData.h"

NSString *const kCommunityNotificationDataPage = @"page";
NSString *const kCommunityNotificationDataPost = @"post";
NSString *const kCommunityNotificationDataRows = @"rows";
NSString *const kCommunityNotificationDataTotal = @"total";

@interface CommunityNotificationData ()
@end
@implementation CommunityNotificationData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCommunityNotificationDataPage] isKindOfClass:[NSNull class]]){
		self.page = dictionary[kCommunityNotificationDataPage];
	}	
	if(dictionary[kCommunityNotificationDataPost] != nil && [dictionary[kCommunityNotificationDataPost] isKindOfClass:[NSArray class]]){
		NSArray * postDictionaries = dictionary[kCommunityNotificationDataPost];
		NSMutableArray * postItems = [NSMutableArray array];
		for(NSDictionary * postDictionary in postDictionaries){
			CommunityNotificationPost * postItem = [[CommunityNotificationPost alloc] initWithDictionary:postDictionary];
			[postItems addObject:postItem];
		}
		self.post = postItems;
	}
	if(![dictionary[kCommunityNotificationDataRows] isKindOfClass:[NSNull class]]){
		self.rows = dictionary[kCommunityNotificationDataRows];
	}	
	if(![dictionary[kCommunityNotificationDataTotal] isKindOfClass:[NSNull class]]){
		self.total = dictionary[kCommunityNotificationDataTotal];
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
		dictionary[kCommunityNotificationDataPage] = self.page;
	}
	if(self.post != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(CommunityNotificationPost * postElement in self.post){
			[dictionaryElements addObject:[postElement toDictionary]];
		}
		dictionary[kCommunityNotificationDataPost] = dictionaryElements;
	}
	if(self.rows != nil){
		dictionary[kCommunityNotificationDataRows] = self.rows;
	}
	if(self.total != nil){
		dictionary[kCommunityNotificationDataTotal] = self.total;
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
		[aCoder encodeObject:self.page forKey:kCommunityNotificationDataPage];
	}
	if(self.post != nil){
		[aCoder encodeObject:self.post forKey:kCommunityNotificationDataPost];
	}
	if(self.rows != nil){
		[aCoder encodeObject:self.rows forKey:kCommunityNotificationDataRows];
	}
	if(self.total != nil){
		[aCoder encodeObject:self.total forKey:kCommunityNotificationDataTotal];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.page = [aDecoder decodeObjectForKey:kCommunityNotificationDataPage];
	self.post = [aDecoder decodeObjectForKey:kCommunityNotificationDataPost];
	self.rows = [aDecoder decodeObjectForKey:kCommunityNotificationDataRows];
	self.total = [aDecoder decodeObjectForKey:kCommunityNotificationDataTotal];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityNotificationData *copy = [CommunityNotificationData new];

	copy.page = [self.page copy];
	copy.post = [self.post copy];
	copy.rows = [self.rows copy];
	copy.total = [self.total copy];

	return copy;
}
@end
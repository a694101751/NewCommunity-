//
//	CommunityPublicAnnouncementData.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityPublicAnnouncementData.h"

NSString *const kCommunityPublicAnnouncementDataPage = @"page";
NSString *const kCommunityPublicAnnouncementDataPost = @"post";
NSString *const kCommunityPublicAnnouncementDataRows = @"rows";
NSString *const kCommunityPublicAnnouncementDataTotal = @"total";

@interface CommunityPublicAnnouncementData ()
@end
@implementation CommunityPublicAnnouncementData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCommunityPublicAnnouncementDataPage] isKindOfClass:[NSNull class]]){
		self.page = dictionary[kCommunityPublicAnnouncementDataPage];
	}	
	if(dictionary[kCommunityPublicAnnouncementDataPost] != nil && [dictionary[kCommunityPublicAnnouncementDataPost] isKindOfClass:[NSArray class]]){
		NSArray * postDictionaries = dictionary[kCommunityPublicAnnouncementDataPost];
		NSMutableArray * postItems = [NSMutableArray array];
		for(NSDictionary * postDictionary in postDictionaries){
			CommunityPublicAnnouncementPost * postItem = [[CommunityPublicAnnouncementPost alloc] initWithDictionary:postDictionary];
			[postItems addObject:postItem];
		}
		self.post = postItems;
	}
	if(![dictionary[kCommunityPublicAnnouncementDataRows] isKindOfClass:[NSNull class]]){
		self.rows = dictionary[kCommunityPublicAnnouncementDataRows];
	}	
	if(![dictionary[kCommunityPublicAnnouncementDataTotal] isKindOfClass:[NSNull class]]){
		self.total = dictionary[kCommunityPublicAnnouncementDataTotal];
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
		dictionary[kCommunityPublicAnnouncementDataPage] = self.page;
	}
	if(self.post != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(CommunityPublicAnnouncementPost * postElement in self.post){
			[dictionaryElements addObject:[postElement toDictionary]];
		}
		dictionary[kCommunityPublicAnnouncementDataPost] = dictionaryElements;
	}
	if(self.rows != nil){
		dictionary[kCommunityPublicAnnouncementDataRows] = self.rows;
	}
	if(self.total != nil){
		dictionary[kCommunityPublicAnnouncementDataTotal] = self.total;
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
		[aCoder encodeObject:self.page forKey:kCommunityPublicAnnouncementDataPage];
	}
	if(self.post != nil){
		[aCoder encodeObject:self.post forKey:kCommunityPublicAnnouncementDataPost];
	}
	if(self.rows != nil){
		[aCoder encodeObject:self.rows forKey:kCommunityPublicAnnouncementDataRows];
	}
	if(self.total != nil){
		[aCoder encodeObject:self.total forKey:kCommunityPublicAnnouncementDataTotal];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.page = [aDecoder decodeObjectForKey:kCommunityPublicAnnouncementDataPage];
	self.post = [aDecoder decodeObjectForKey:kCommunityPublicAnnouncementDataPost];
	self.rows = [aDecoder decodeObjectForKey:kCommunityPublicAnnouncementDataRows];
	self.total = [aDecoder decodeObjectForKey:kCommunityPublicAnnouncementDataTotal];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityPublicAnnouncementData *copy = [CommunityPublicAnnouncementData new];

	copy.page = [self.page copy];
	copy.post = [self.post copy];
	copy.rows = [self.rows copy];
	copy.total = [self.total copy];

	return copy;
}
@end
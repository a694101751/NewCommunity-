//
//	CommunityLifeListPhoto.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityLifeListPhoto.h"

NSString *const kCommunityLifeListPhotoAlt = @"alt";
NSString *const kCommunityLifeListPhotoOrders = @"orders";
NSString *const kCommunityLifeListPhotoUrl = @"url";

@interface CommunityLifeListPhoto ()
@end
@implementation CommunityLifeListPhoto




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCommunityLifeListPhotoAlt] isKindOfClass:[NSNull class]]){
		self.alt = dictionary[kCommunityLifeListPhotoAlt];
	}	
	if(![dictionary[kCommunityLifeListPhotoOrders] isKindOfClass:[NSNull class]]){
		self.orders = [dictionary[kCommunityLifeListPhotoOrders] integerValue];
	}

	if(![dictionary[kCommunityLifeListPhotoUrl] isKindOfClass:[NSNull class]]){
		self.url = dictionary[kCommunityLifeListPhotoUrl];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.alt != nil){
		dictionary[kCommunityLifeListPhotoAlt] = self.alt;
	}
	dictionary[kCommunityLifeListPhotoOrders] = @(self.orders);
	if(self.url != nil){
		dictionary[kCommunityLifeListPhotoUrl] = self.url;
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
	if(self.alt != nil){
		[aCoder encodeObject:self.alt forKey:kCommunityLifeListPhotoAlt];
	}
	[aCoder encodeObject:@(self.orders) forKey:kCommunityLifeListPhotoOrders];	if(self.url != nil){
		[aCoder encodeObject:self.url forKey:kCommunityLifeListPhotoUrl];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.alt = [aDecoder decodeObjectForKey:kCommunityLifeListPhotoAlt];
	self.orders = [[aDecoder decodeObjectForKey:kCommunityLifeListPhotoOrders] integerValue];
	self.url = [aDecoder decodeObjectForKey:kCommunityLifeListPhotoUrl];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityLifeListPhoto *copy = [CommunityLifeListPhoto new];

	copy.alt = [self.alt copy];
	copy.orders = self.orders;
	copy.url = [self.url copy];

	return copy;
}
@end
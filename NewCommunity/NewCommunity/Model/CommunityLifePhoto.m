//
//	CommunityLifePhoto.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityLifePhoto.h"

NSString *const kCommunityLifePhotoAlt = @"alt";
NSString *const kCommunityLifePhotoOrders = @"orders";
NSString *const kCommunityLifePhotoUrl = @"url";

@interface CommunityLifePhoto ()
@end
@implementation CommunityLifePhoto




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCommunityLifePhotoAlt] isKindOfClass:[NSNull class]]){
		self.alt = dictionary[kCommunityLifePhotoAlt];
	}	
	if(![dictionary[kCommunityLifePhotoOrders] isKindOfClass:[NSNull class]]){
		self.orders = [dictionary[kCommunityLifePhotoOrders] integerValue];
	}

	if(![dictionary[kCommunityLifePhotoUrl] isKindOfClass:[NSNull class]]){
		self.url = dictionary[kCommunityLifePhotoUrl];
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
		dictionary[kCommunityLifePhotoAlt] = self.alt;
	}
	dictionary[kCommunityLifePhotoOrders] = @(self.orders);
	if(self.url != nil){
		dictionary[kCommunityLifePhotoUrl] = self.url;
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
		[aCoder encodeObject:self.alt forKey:kCommunityLifePhotoAlt];
	}
	[aCoder encodeObject:@(self.orders) forKey:kCommunityLifePhotoOrders];	if(self.url != nil){
		[aCoder encodeObject:self.url forKey:kCommunityLifePhotoUrl];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.alt = [aDecoder decodeObjectForKey:kCommunityLifePhotoAlt];
	self.orders = [[aDecoder decodeObjectForKey:kCommunityLifePhotoOrders] integerValue];
	self.url = [aDecoder decodeObjectForKey:kCommunityLifePhotoUrl];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityLifePhoto *copy = [CommunityLifePhoto new];

	copy.alt = [self.alt copy];
	copy.orders = self.orders;
	copy.url = [self.url copy];

	return copy;
}
@end
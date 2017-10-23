//
//	CommunityLifeDetailsPhoto.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityLifeDetailsPhoto.h"

NSString *const kCommunityLifeDetailsPhotoAlt = @"alt";
NSString *const kCommunityLifeDetailsPhotoOrders = @"orders";
NSString *const kCommunityLifeDetailsPhotoUrl = @"url";

@interface CommunityLifeDetailsPhoto ()
@end
@implementation CommunityLifeDetailsPhoto




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCommunityLifeDetailsPhotoAlt] isKindOfClass:[NSNull class]]){
		self.alt = dictionary[kCommunityLifeDetailsPhotoAlt];
	}	
	if(![dictionary[kCommunityLifeDetailsPhotoOrders] isKindOfClass:[NSNull class]]){
		self.orders = [dictionary[kCommunityLifeDetailsPhotoOrders] integerValue];
	}

	if(![dictionary[kCommunityLifeDetailsPhotoUrl] isKindOfClass:[NSNull class]]){
		self.url = dictionary[kCommunityLifeDetailsPhotoUrl];
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
		dictionary[kCommunityLifeDetailsPhotoAlt] = self.alt;
	}
	dictionary[kCommunityLifeDetailsPhotoOrders] = @(self.orders);
	if(self.url != nil){
		dictionary[kCommunityLifeDetailsPhotoUrl] = self.url;
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
		[aCoder encodeObject:self.alt forKey:kCommunityLifeDetailsPhotoAlt];
	}
	[aCoder encodeObject:@(self.orders) forKey:kCommunityLifeDetailsPhotoOrders];	if(self.url != nil){
		[aCoder encodeObject:self.url forKey:kCommunityLifeDetailsPhotoUrl];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.alt = [aDecoder decodeObjectForKey:kCommunityLifeDetailsPhotoAlt];
	self.orders = [[aDecoder decodeObjectForKey:kCommunityLifeDetailsPhotoOrders] integerValue];
	self.url = [aDecoder decodeObjectForKey:kCommunityLifeDetailsPhotoUrl];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityLifeDetailsPhoto *copy = [CommunityLifeDetailsPhoto new];

	copy.alt = [self.alt copy];
	copy.orders = self.orders;
	copy.url = [self.url copy];

	return copy;
}
@end
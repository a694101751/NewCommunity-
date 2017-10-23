//
//	MyStatePhoto.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "MyStatePhoto.h"

NSString *const kMyStatePhotoAlt = @"alt";
NSString *const kMyStatePhotoOrders = @"orders";
NSString *const kMyStatePhotoUrl = @"url";

@interface MyStatePhoto ()
@end
@implementation MyStatePhoto




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kMyStatePhotoAlt] isKindOfClass:[NSNull class]]){
		self.alt = dictionary[kMyStatePhotoAlt];
	}	
	if(![dictionary[kMyStatePhotoOrders] isKindOfClass:[NSNull class]]){
		self.orders = [dictionary[kMyStatePhotoOrders] integerValue];
	}

	if(![dictionary[kMyStatePhotoUrl] isKindOfClass:[NSNull class]]){
		self.url = dictionary[kMyStatePhotoUrl];
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
		dictionary[kMyStatePhotoAlt] = self.alt;
	}
	dictionary[kMyStatePhotoOrders] = @(self.orders);
	if(self.url != nil){
		dictionary[kMyStatePhotoUrl] = self.url;
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
		[aCoder encodeObject:self.alt forKey:kMyStatePhotoAlt];
	}
	[aCoder encodeObject:@(self.orders) forKey:kMyStatePhotoOrders];	if(self.url != nil){
		[aCoder encodeObject:self.url forKey:kMyStatePhotoUrl];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.alt = [aDecoder decodeObjectForKey:kMyStatePhotoAlt];
	self.orders = [[aDecoder decodeObjectForKey:kMyStatePhotoOrders] integerValue];
	self.url = [aDecoder decodeObjectForKey:kMyStatePhotoUrl];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	MyStatePhoto *copy = [MyStatePhoto new];

	copy.alt = [self.alt copy];
	copy.orders = self.orders;
	copy.url = [self.url copy];

	return copy;
}
@end
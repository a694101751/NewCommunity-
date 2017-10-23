//
//	InformationRootListPhoto.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "InformationRootListPhoto.h"

NSString *const kInformationRootListPhotoAlt = @"alt";
NSString *const kInformationRootListPhotoOrders = @"orders";
NSString *const kInformationRootListPhotoUrl = @"url";

@interface InformationRootListPhoto ()
@end
@implementation InformationRootListPhoto




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kInformationRootListPhotoAlt] isKindOfClass:[NSNull class]]){
		self.alt = dictionary[kInformationRootListPhotoAlt];
	}	
	if(![dictionary[kInformationRootListPhotoOrders] isKindOfClass:[NSNull class]]){
		self.orders = [dictionary[kInformationRootListPhotoOrders] integerValue];
	}

	if(![dictionary[kInformationRootListPhotoUrl] isKindOfClass:[NSNull class]]){
		self.url = dictionary[kInformationRootListPhotoUrl];
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
		dictionary[kInformationRootListPhotoAlt] = self.alt;
	}
	dictionary[kInformationRootListPhotoOrders] = @(self.orders);
	if(self.url != nil){
		dictionary[kInformationRootListPhotoUrl] = self.url;
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
		[aCoder encodeObject:self.alt forKey:kInformationRootListPhotoAlt];
	}
	[aCoder encodeObject:@(self.orders) forKey:kInformationRootListPhotoOrders];	if(self.url != nil){
		[aCoder encodeObject:self.url forKey:kInformationRootListPhotoUrl];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.alt = [aDecoder decodeObjectForKey:kInformationRootListPhotoAlt];
	self.orders = [[aDecoder decodeObjectForKey:kInformationRootListPhotoOrders] integerValue];
	self.url = [aDecoder decodeObjectForKey:kInformationRootListPhotoUrl];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	InformationRootListPhoto *copy = [InformationRootListPhoto new];

	copy.alt = [self.alt copy];
	copy.orders = self.orders;
	copy.url = [self.url copy];

	return copy;
}
@end
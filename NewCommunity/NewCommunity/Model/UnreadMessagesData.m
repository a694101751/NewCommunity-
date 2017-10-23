//
//	UnreadMessagesData.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "UnreadMessagesData.h"

NSString *const kUnreadMessagesDataTotal = @"total";

@interface UnreadMessagesData ()
@end
@implementation UnreadMessagesData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kUnreadMessagesDataTotal] isKindOfClass:[NSNull class]]){
		self.total = dictionary[kUnreadMessagesDataTotal];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.total != nil){
		dictionary[kUnreadMessagesDataTotal] = self.total;
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
	if(self.total != nil){
		[aCoder encodeObject:self.total forKey:kUnreadMessagesDataTotal];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.total = [aDecoder decodeObjectForKey:kUnreadMessagesDataTotal];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	UnreadMessagesData *copy = [UnreadMessagesData new];

	copy.total = [self.total copy];

	return copy;
}
@end
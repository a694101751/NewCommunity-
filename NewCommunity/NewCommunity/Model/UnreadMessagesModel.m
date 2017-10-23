//
//	UnreadMessagesModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "UnreadMessagesModel.h"

NSString *const kUnreadMessagesModelCode = @"code";
NSString *const kUnreadMessagesModelContent = @"content";
NSString *const kUnreadMessagesModelData = @"data";

@interface UnreadMessagesModel ()
@end
@implementation UnreadMessagesModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kUnreadMessagesModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kUnreadMessagesModelCode];
	}	
	if(![dictionary[kUnreadMessagesModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kUnreadMessagesModelContent];
	}	
	if(![dictionary[kUnreadMessagesModelData] isKindOfClass:[NSNull class]]){
		self.data = [[UnreadMessagesData alloc] initWithDictionary:dictionary[kUnreadMessagesModelData]];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.code != nil){
		dictionary[kUnreadMessagesModelCode] = self.code;
	}
	if(self.content != nil){
		dictionary[kUnreadMessagesModelContent] = self.content;
	}
	if(self.data != nil){
		dictionary[kUnreadMessagesModelData] = [self.data toDictionary];
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
	if(self.code != nil){
		[aCoder encodeObject:self.code forKey:kUnreadMessagesModelCode];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kUnreadMessagesModelContent];
	}
	if(self.data != nil){
		[aCoder encodeObject:self.data forKey:kUnreadMessagesModelData];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kUnreadMessagesModelCode];
	self.content = [aDecoder decodeObjectForKey:kUnreadMessagesModelContent];
	self.data = [aDecoder decodeObjectForKey:kUnreadMessagesModelData];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	UnreadMessagesModel *copy = [UnreadMessagesModel new];

	copy.code = [self.code copy];
	copy.content = [self.content copy];
	copy.data = [self.data copy];

	return copy;
}
@end
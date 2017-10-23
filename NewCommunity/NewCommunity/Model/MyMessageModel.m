//
//	MyMessageModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "MyMessageModel.h"

NSString *const kMyMessageModelCode = @"code";
NSString *const kMyMessageModelContent = @"content";
NSString *const kMyMessageModelData = @"data";

@interface MyMessageModel ()
@end
@implementation MyMessageModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kMyMessageModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kMyMessageModelCode];
	}	
	if(![dictionary[kMyMessageModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kMyMessageModelContent];
	}	
	if(![dictionary[kMyMessageModelData] isKindOfClass:[NSNull class]]){
		self.data = [[MyMessageData alloc] initWithDictionary:dictionary[kMyMessageModelData]];
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
		dictionary[kMyMessageModelCode] = self.code;
	}
	if(self.content != nil){
		dictionary[kMyMessageModelContent] = self.content;
	}
	if(self.data != nil){
		dictionary[kMyMessageModelData] = [self.data toDictionary];
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
		[aCoder encodeObject:self.code forKey:kMyMessageModelCode];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kMyMessageModelContent];
	}
	if(self.data != nil){
		[aCoder encodeObject:self.data forKey:kMyMessageModelData];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kMyMessageModelCode];
	self.content = [aDecoder decodeObjectForKey:kMyMessageModelContent];
	self.data = [aDecoder decodeObjectForKey:kMyMessageModelData];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	MyMessageModel *copy = [MyMessageModel new];

	copy.code = [self.code copy];
	copy.content = [self.content copy];
	copy.data = [self.data copy];

	return copy;
}
@end
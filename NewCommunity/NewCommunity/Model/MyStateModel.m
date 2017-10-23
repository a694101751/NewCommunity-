//
//	MyStateModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "MyStateModel.h"

NSString *const kMyStateModelCode = @"code";
NSString *const kMyStateModelContent = @"content";
NSString *const kMyStateModelData = @"data";

@interface MyStateModel ()
@end
@implementation MyStateModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kMyStateModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kMyStateModelCode];
	}	
	if(![dictionary[kMyStateModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kMyStateModelContent];
	}	
	if(![dictionary[kMyStateModelData] isKindOfClass:[NSNull class]]){
		self.data = [[MyStateData alloc] initWithDictionary:dictionary[kMyStateModelData]];
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
		dictionary[kMyStateModelCode] = self.code;
	}
	if(self.content != nil){
		dictionary[kMyStateModelContent] = self.content;
	}
	if(self.data != nil){
		dictionary[kMyStateModelData] = [self.data toDictionary];
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
		[aCoder encodeObject:self.code forKey:kMyStateModelCode];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kMyStateModelContent];
	}
	if(self.data != nil){
		[aCoder encodeObject:self.data forKey:kMyStateModelData];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kMyStateModelCode];
	self.content = [aDecoder decodeObjectForKey:kMyStateModelContent];
	self.data = [aDecoder decodeObjectForKey:kMyStateModelData];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	MyStateModel *copy = [MyStateModel new];

	copy.code = [self.code copy];
	copy.content = [self.content copy];
	copy.data = [self.data copy];

	return copy;
}
@end
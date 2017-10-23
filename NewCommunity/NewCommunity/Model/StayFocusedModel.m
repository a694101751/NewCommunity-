//
//	StayFocusedModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "StayFocusedModel.h"

NSString *const kStayFocusedModelCode = @"code";
NSString *const kStayFocusedModelContent = @"content";
NSString *const kStayFocusedModelData = @"data";

@interface StayFocusedModel ()
@end
@implementation StayFocusedModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kStayFocusedModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kStayFocusedModelCode];
	}	
	if(![dictionary[kStayFocusedModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kStayFocusedModelContent];
	}	
	if(![dictionary[kStayFocusedModelData] isKindOfClass:[NSNull class]]){
		self.data = [[StayFocusedData alloc] initWithDictionary:dictionary[kStayFocusedModelData]];
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
		dictionary[kStayFocusedModelCode] = self.code;
	}
	if(self.content != nil){
		dictionary[kStayFocusedModelContent] = self.content;
	}
	if(self.data != nil){
		dictionary[kStayFocusedModelData] = [self.data toDictionary];
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
		[aCoder encodeObject:self.code forKey:kStayFocusedModelCode];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kStayFocusedModelContent];
	}
	if(self.data != nil){
		[aCoder encodeObject:self.data forKey:kStayFocusedModelData];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kStayFocusedModelCode];
	self.content = [aDecoder decodeObjectForKey:kStayFocusedModelContent];
	self.data = [aDecoder decodeObjectForKey:kStayFocusedModelData];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	StayFocusedModel *copy = [StayFocusedModel new];

	copy.code = [self.code copy];
	copy.content = [self.content copy];
	copy.data = [self.data copy];

	return copy;
}
@end
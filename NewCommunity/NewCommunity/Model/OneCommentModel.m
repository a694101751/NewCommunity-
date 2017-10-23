//
//	OneCommentModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "OneCommentModel.h"

NSString *const kOneCommentModelCode = @"code";
NSString *const kOneCommentModelContent = @"content";
NSString *const kOneCommentModelPages = @"pages";

@interface OneCommentModel ()
@end
@implementation OneCommentModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kOneCommentModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kOneCommentModelCode];
	}	
	if(![dictionary[kOneCommentModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kOneCommentModelContent];
	}	
	if(![dictionary[kOneCommentModelPages] isKindOfClass:[NSNull class]]){
		self.pages = [[OneCommentPage alloc] initWithDictionary:dictionary[kOneCommentModelPages]];
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
		dictionary[kOneCommentModelCode] = self.code;
	}
	if(self.content != nil){
		dictionary[kOneCommentModelContent] = self.content;
	}
	if(self.pages != nil){
		dictionary[kOneCommentModelPages] = [self.pages toDictionary];
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
		[aCoder encodeObject:self.code forKey:kOneCommentModelCode];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kOneCommentModelContent];
	}
	if(self.pages != nil){
		[aCoder encodeObject:self.pages forKey:kOneCommentModelPages];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kOneCommentModelCode];
	self.content = [aDecoder decodeObjectForKey:kOneCommentModelContent];
	self.pages = [aDecoder decodeObjectForKey:kOneCommentModelPages];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	OneCommentModel *copy = [OneCommentModel new];

	copy.code = [self.code copy];
	copy.content = [self.content copy];
	copy.pages = [self.pages copy];

	return copy;
}
@end
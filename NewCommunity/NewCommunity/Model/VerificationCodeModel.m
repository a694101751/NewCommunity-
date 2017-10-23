//
//	VerificationCodeModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "VerificationCodeModel.h"

NSString *const kVerificationCodeModelCode = @"code";
NSString *const kVerificationCodeModelContent = @"content";

@interface VerificationCodeModel ()
@end
@implementation VerificationCodeModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kVerificationCodeModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kVerificationCodeModelCode];
	}	
	if(![dictionary[kVerificationCodeModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kVerificationCodeModelContent];
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
		dictionary[kVerificationCodeModelCode] = self.code;
	}
	if(self.content != nil){
		dictionary[kVerificationCodeModelContent] = self.content;
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
		[aCoder encodeObject:self.code forKey:kVerificationCodeModelCode];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kVerificationCodeModelContent];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kVerificationCodeModelCode];
	self.content = [aDecoder decodeObjectForKey:kVerificationCodeModelContent];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	VerificationCodeModel *copy = [VerificationCodeModel new];

	copy.code = [self.code copy];
	copy.content = [self.content copy];

	return copy;
}
@end
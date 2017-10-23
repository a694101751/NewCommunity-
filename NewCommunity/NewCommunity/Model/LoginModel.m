//
//	LoginModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "LoginModel.h"

NSString *const kLoginModelCode = @"code";
NSString *const kLoginModelContent = @"content";
NSString *const kLoginModelState = @"state";
NSString *const kLoginModelUser = @"user";

@interface LoginModel ()
@end
@implementation LoginModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kLoginModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kLoginModelCode];
	}	
	if(![dictionary[kLoginModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kLoginModelContent];
	}	
	if(![dictionary[kLoginModelState] isKindOfClass:[NSNull class]]){
		self.state = dictionary[kLoginModelState];
	}	
	if(![dictionary[kLoginModelUser] isKindOfClass:[NSNull class]]){
		self.user = [[LoginUser alloc] initWithDictionary:dictionary[kLoginModelUser]];
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
		dictionary[kLoginModelCode] = self.code;
	}
	if(self.content != nil){
		dictionary[kLoginModelContent] = self.content;
	}
	if(self.state != nil){
		dictionary[kLoginModelState] = self.state;
	}
	if(self.user != nil){
		dictionary[kLoginModelUser] = [self.user toDictionary];
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
		[aCoder encodeObject:self.code forKey:kLoginModelCode];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kLoginModelContent];
	}
	if(self.state != nil){
		[aCoder encodeObject:self.state forKey:kLoginModelState];
	}
	if(self.user != nil){
		[aCoder encodeObject:self.user forKey:kLoginModelUser];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kLoginModelCode];
	self.content = [aDecoder decodeObjectForKey:kLoginModelContent];
	self.state = [aDecoder decodeObjectForKey:kLoginModelState];
	self.user = [aDecoder decodeObjectForKey:kLoginModelUser];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	LoginModel *copy = [LoginModel new];

	copy.code = [self.code copy];
	copy.content = [self.content copy];
	copy.state = [self.state copy];
	copy.user = [self.user copy];

	return copy;
}
@end
//
//	OneCommentPage.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "OneCommentPage.h"

NSString *const kOneCommentPageIdField = @"id";
NSString *const kOneCommentPageMessage = @"message";
NSString *const kOneCommentPageReply = @"reply";
NSString *const kOneCommentPageUserName = @"userName";
NSString *const kOneCommentPageAvatar = @"avatar";

@interface OneCommentPage ()
@end
@implementation OneCommentPage




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kOneCommentPageIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kOneCommentPageIdField];
	}	
	if(![dictionary[kOneCommentPageMessage] isKindOfClass:[NSNull class]]){
		self.message = dictionary[kOneCommentPageMessage];
	}	
	if(![dictionary[kOneCommentPageReply] isKindOfClass:[NSNull class]]){
		self.reply = dictionary[kOneCommentPageReply];
	}	
	if(![dictionary[kOneCommentPageUserName] isKindOfClass:[NSNull class]]){
		self.userName = dictionary[kOneCommentPageUserName];
	}
    if(![dictionary[kOneCommentPageAvatar] isKindOfClass:[NSNull class]]){
        self.avatar = dictionary[kOneCommentPageAvatar];
    }
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.idField != nil){
		dictionary[kOneCommentPageIdField] = self.idField;
	}
	if(self.message != nil){
		dictionary[kOneCommentPageMessage] = self.message;
	}
	if(self.reply != nil){
		dictionary[kOneCommentPageReply] = self.reply;
	}
	if(self.userName != nil){
		dictionary[kOneCommentPageUserName] = self.userName;
	}
    if(self.avatar != nil){
        dictionary[kOneCommentPageAvatar] = self.avatar;
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
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kOneCommentPageIdField];
	}
	if(self.message != nil){
		[aCoder encodeObject:self.message forKey:kOneCommentPageMessage];
	}
	if(self.reply != nil){
		[aCoder encodeObject:self.reply forKey:kOneCommentPageReply];
	}
	if(self.userName != nil){
		[aCoder encodeObject:self.userName forKey:kOneCommentPageUserName];
	}
    if(self.avatar != nil){
        [aCoder encodeObject:self.avatar forKey:kOneCommentPageAvatar];
    }

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.idField = [aDecoder decodeObjectForKey:kOneCommentPageIdField];
	self.message = [aDecoder decodeObjectForKey:kOneCommentPageMessage];
	self.reply = [aDecoder decodeObjectForKey:kOneCommentPageReply];
	self.userName = [aDecoder decodeObjectForKey:kOneCommentPageUserName];
    self.avatar = [aDecoder decodeObjectForKey:kOneCommentPageAvatar];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	OneCommentPage *copy = [OneCommentPage new];

	copy.idField = [self.idField copy];
	copy.message = [self.message copy];
	copy.reply = [self.reply copy];
	copy.userName = [self.userName copy];
    copy.avatar = [self.avatar copy];

	return copy;
}
@end

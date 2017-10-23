//
//	AllCommentsPost.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "AllCommentsPost.h"

NSString *const kAllCommentsPostAddTime = @"addTime";
NSString *const kAllCommentsPostIdField = @"id";
NSString *const kAllCommentsPostMessage = @"message";
NSString *const kAllCommentsPostAvatar = @"avatar";
NSString *const kAllCommentsPostUserName = @"userName";

@interface AllCommentsPost ()
@end
@implementation AllCommentsPost




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kAllCommentsPostAddTime] isKindOfClass:[NSNull class]]){
		self.addTime = dictionary[kAllCommentsPostAddTime];
	}	
	if(![dictionary[kAllCommentsPostIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kAllCommentsPostIdField];
	}	
	if(![dictionary[kAllCommentsPostMessage] isKindOfClass:[NSNull class]]){
		self.message = dictionary[kAllCommentsPostMessage];
	}
    if(![dictionary[kAllCommentsPostAvatar] isKindOfClass:[NSNull class]]){
        self.avatar = dictionary[kAllCommentsPostAvatar];
    }
    if(![dictionary[kAllCommentsPostUserName] isKindOfClass:[NSNull class]]){
        self.userName = dictionary[kAllCommentsPostUserName];
    }
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.addTime != nil){
		dictionary[kAllCommentsPostAddTime] = self.addTime;
	}
	if(self.idField != nil){
		dictionary[kAllCommentsPostIdField] = self.idField;
	}
	if(self.message != nil){
		dictionary[kAllCommentsPostMessage] = self.message;
	}
    if(self.avatar != nil){
        dictionary[kAllCommentsPostAvatar] = self.message;
    }
    if(self.userName != nil){
        dictionary[kAllCommentsPostUserName] = self.message;
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
	if(self.addTime != nil){
		[aCoder encodeObject:self.addTime forKey:kAllCommentsPostAddTime];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kAllCommentsPostIdField];
	}
	if(self.message != nil){
		[aCoder encodeObject:self.message forKey:kAllCommentsPostMessage];
	}
    if(self.avatar != nil){
        [aCoder encodeObject:self.avatar forKey:kAllCommentsPostAvatar];
    }
    if(self.userName != nil){
        [aCoder encodeObject:self.userName forKey:kAllCommentsPostUserName];
    }

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.addTime = [aDecoder decodeObjectForKey:kAllCommentsPostAddTime];
	self.idField = [aDecoder decodeObjectForKey:kAllCommentsPostIdField];
	self.message = [aDecoder decodeObjectForKey:kAllCommentsPostMessage];
    self.avatar = [aDecoder decodeObjectForKey:kAllCommentsPostAvatar];
    self.userName = [aDecoder decodeObjectForKey:kAllCommentsPostUserName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	AllCommentsPost *copy = [AllCommentsPost new];

	copy.addTime = [self.addTime copy];
	copy.idField = [self.idField copy];
	copy.message = [self.message copy];
    copy.avatar = [self.avatar copy];
    copy.userName = [self.userName copy];

	return copy;
}
@end

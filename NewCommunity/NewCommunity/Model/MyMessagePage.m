//
//	MyMessagePage.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "MyMessagePage.h"

NSString *const kMyMessagePageAddTime = @"addTime";
NSString *const kMyMessagePageAvatar = @"avatar";
NSString *const kMyMessagePageIdField = @"id";
NSString *const kMyMessagePageLifeId = @"lifeId";
NSString *const kMyMessagePageMessage = @"message";
NSString *const kMyMessagePageNickName = @"nickName";
NSString *const kMyMessagePageType = @"type";

@interface MyMessagePage ()
@end
@implementation MyMessagePage




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kMyMessagePageAddTime] isKindOfClass:[NSNull class]]){
		self.addTime = dictionary[kMyMessagePageAddTime];
	}	
	if(![dictionary[kMyMessagePageAvatar] isKindOfClass:[NSNull class]]){
		self.avatar = dictionary[kMyMessagePageAvatar];
	}	
	if(![dictionary[kMyMessagePageIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kMyMessagePageIdField];
	}	
	if(![dictionary[kMyMessagePageLifeId] isKindOfClass:[NSNull class]]){
		self.lifeId = dictionary[kMyMessagePageLifeId];
	}	
	if(![dictionary[kMyMessagePageMessage] isKindOfClass:[NSNull class]]){
		self.message = dictionary[kMyMessagePageMessage];
	}	
	if(![dictionary[kMyMessagePageNickName] isKindOfClass:[NSNull class]]){
		self.nickName = dictionary[kMyMessagePageNickName];
	}
    if(![dictionary[kMyMessagePageType] isKindOfClass:[NSNull class]]){
        self.type = dictionary[kMyMessagePageType];
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
		dictionary[kMyMessagePageAddTime] = self.addTime;
	}
	if(self.avatar != nil){
		dictionary[kMyMessagePageAvatar] = self.avatar;
	}
	if(self.idField != nil){
		dictionary[kMyMessagePageIdField] = self.idField;
	}
	if(self.lifeId != nil){
		dictionary[kMyMessagePageLifeId] = self.lifeId;
	}
	if(self.message != nil){
		dictionary[kMyMessagePageMessage] = self.message;
	}
	if(self.nickName != nil){
		dictionary[kMyMessagePageNickName] = self.nickName;
	}
    if(self.type != nil){
        dictionary[kMyMessagePageType] = self.type;
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
		[aCoder encodeObject:self.addTime forKey:kMyMessagePageAddTime];
	}
	if(self.avatar != nil){
		[aCoder encodeObject:self.avatar forKey:kMyMessagePageAvatar];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kMyMessagePageIdField];
	}
	if(self.lifeId != nil){
		[aCoder encodeObject:self.lifeId forKey:kMyMessagePageLifeId];
	}
	if(self.message != nil){
		[aCoder encodeObject:self.message forKey:kMyMessagePageMessage];
	}
	if(self.nickName != nil){
		[aCoder encodeObject:self.nickName forKey:kMyMessagePageNickName];
	}
    if(self.type != nil){
        [aCoder encodeObject:self.type forKey:kMyMessagePageType];
    }

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.addTime = [aDecoder decodeObjectForKey:kMyMessagePageAddTime];
	self.avatar = [aDecoder decodeObjectForKey:kMyMessagePageAvatar];
	self.idField = [aDecoder decodeObjectForKey:kMyMessagePageIdField];
	self.lifeId = [aDecoder decodeObjectForKey:kMyMessagePageLifeId];
	self.message = [aDecoder decodeObjectForKey:kMyMessagePageMessage];
	self.nickName = [aDecoder decodeObjectForKey:kMyMessagePageNickName];
    self.type = [aDecoder decodeObjectForKey:kMyMessagePageType];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	MyMessagePage *copy = [MyMessagePage new];

	copy.addTime = [self.addTime copy];
	copy.avatar = [self.avatar copy];
	copy.idField = [self.idField copy];
	copy.lifeId = [self.lifeId copy];
	copy.message = [self.message copy];
	copy.nickName = [self.nickName copy];
    copy.type = [self.type copy];

	return copy;
}
@end

//
//	LoginUser.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "LoginUser.h"

NSString *const kLoginUserAddress = @"address";
NSString *const kLoginUserAreaId = @"areaId";
NSString *const kLoginUserAreaName = @"areaName";
NSString *const kLoginUserAvatar = @"avatar";
NSString *const kLoginUserClubId = @"clubId";
NSString *const kLoginUserClubName = @"clubName";
NSString *const kLoginUserIdField = @"id";
NSString *const kLoginUserNickName = @"nickName";
NSString *const kLoginUserUserName = @"userName";
NSString *const kLoginUsersubdistrictName = @"subdistrictName";

@interface LoginUser ()
@end
@implementation LoginUser




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kLoginUserAddress] isKindOfClass:[NSNull class]]){
		self.address = dictionary[kLoginUserAddress];
	}	
	if(![dictionary[kLoginUserAreaId] isKindOfClass:[NSNull class]]){
		self.areaId = dictionary[kLoginUserAreaId];
	}	
	if(![dictionary[kLoginUserAreaName] isKindOfClass:[NSNull class]]){
		self.areaName = dictionary[kLoginUserAreaName];
	}	
	if(![dictionary[kLoginUserAvatar] isKindOfClass:[NSNull class]]){
		self.avatar = dictionary[kLoginUserAvatar];
	}	
	if(![dictionary[kLoginUserClubId] isKindOfClass:[NSNull class]]){
		self.clubId = dictionary[kLoginUserClubId];
	}	
	if(![dictionary[kLoginUserClubName] isKindOfClass:[NSNull class]]){
		self.clubName = dictionary[kLoginUserClubName];
	}	
	if(![dictionary[kLoginUserIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kLoginUserIdField];
	}	
	if(![dictionary[kLoginUserNickName] isKindOfClass:[NSNull class]]){
		self.nickName = dictionary[kLoginUserNickName];
	}	
	if(![dictionary[kLoginUserUserName] isKindOfClass:[NSNull class]]){
		self.userName = dictionary[kLoginUserUserName];
	}
    if(![dictionary[kLoginUsersubdistrictName] isKindOfClass:[NSNull class]]){
        self.subdistrictName = dictionary[kLoginUsersubdistrictName];
    }
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.address != nil){
		dictionary[kLoginUserAddress] = self.address;
	}
	if(self.areaId != nil){
		dictionary[kLoginUserAreaId] = self.areaId;
	}
	if(self.areaName != nil){
		dictionary[kLoginUserAreaName] = self.areaName;
	}
	if(self.avatar != nil){
		dictionary[kLoginUserAvatar] = self.avatar;
	}
	if(self.clubId != nil){
		dictionary[kLoginUserClubId] = self.clubId;
	}
	if(self.clubName != nil){
		dictionary[kLoginUserClubName] = self.clubName;
	}
	if(self.idField != nil){
		dictionary[kLoginUserIdField] = self.idField;
	}
	if(self.nickName != nil){
		dictionary[kLoginUserNickName] = self.nickName;
	}
	if(self.userName != nil){
		dictionary[kLoginUserUserName] = self.userName;
	}
    if(self.subdistrictName != nil){
        dictionary[kLoginUsersubdistrictName] = self.subdistrictName;
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
	if(self.address != nil){
		[aCoder encodeObject:self.address forKey:kLoginUserAddress];
	}
	if(self.areaId != nil){
		[aCoder encodeObject:self.areaId forKey:kLoginUserAreaId];
	}
	if(self.areaName != nil){
		[aCoder encodeObject:self.areaName forKey:kLoginUserAreaName];
	}
	if(self.avatar != nil){
		[aCoder encodeObject:self.avatar forKey:kLoginUserAvatar];
	}
	if(self.clubId != nil){
		[aCoder encodeObject:self.clubId forKey:kLoginUserClubId];
	}
	if(self.clubName != nil){
		[aCoder encodeObject:self.clubName forKey:kLoginUserClubName];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kLoginUserIdField];
	}
	if(self.nickName != nil){
		[aCoder encodeObject:self.nickName forKey:kLoginUserNickName];
	}
	if(self.userName != nil){
		[aCoder encodeObject:self.userName forKey:kLoginUserUserName];
	}
    if(self.subdistrictName != nil){
        [aCoder encodeObject:self.subdistrictName forKey:kLoginUsersubdistrictName];
    }

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.address = [aDecoder decodeObjectForKey:kLoginUserAddress];
	self.areaId = [aDecoder decodeObjectForKey:kLoginUserAreaId];
	self.areaName = [aDecoder decodeObjectForKey:kLoginUserAreaName];
	self.avatar = [aDecoder decodeObjectForKey:kLoginUserAvatar];
	self.clubId = [aDecoder decodeObjectForKey:kLoginUserClubId];
	self.clubName = [aDecoder decodeObjectForKey:kLoginUserClubName];
	self.idField = [aDecoder decodeObjectForKey:kLoginUserIdField];
	self.nickName = [aDecoder decodeObjectForKey:kLoginUserNickName];
	self.userName = [aDecoder decodeObjectForKey:kLoginUserUserName];
    self.subdistrictName = [aDecoder decodeObjectForKey:kLoginUsersubdistrictName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	LoginUser *copy = [LoginUser new];

	copy.address = [self.address copy];
	copy.areaId = [self.areaId copy];
	copy.areaName = [self.areaName copy];
	copy.avatar = [self.avatar copy];
	copy.clubId = [self.clubId copy];
	copy.clubName = [self.clubName copy];
	copy.idField = [self.idField copy];
	copy.nickName = [self.nickName copy];
	copy.userName = [self.userName copy];
    copy.subdistrictName = [self.subdistrictName copy];

	return copy;
}
@end

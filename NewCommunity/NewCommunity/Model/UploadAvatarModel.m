//
//	UploadAvatarModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "UploadAvatarModel.h"

NSString *const kUploadAvatarModelCode = @"code";
NSString *const kUploadAvatarModelContent = @"content";
NSString *const kUploadAvatarModelData = @"data";

@interface UploadAvatarModel ()
@end
@implementation UploadAvatarModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kUploadAvatarModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kUploadAvatarModelCode];
	}	
	if(![dictionary[kUploadAvatarModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kUploadAvatarModelContent];
	}	
	if(![dictionary[kUploadAvatarModelData] isKindOfClass:[NSNull class]]){
		self.data = [[UploadAvatarData alloc] initWithDictionary:dictionary[kUploadAvatarModelData]];
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
		dictionary[kUploadAvatarModelCode] = self.code;
	}
	if(self.content != nil){
		dictionary[kUploadAvatarModelContent] = self.content;
	}
	if(self.data != nil){
		dictionary[kUploadAvatarModelData] = [self.data toDictionary];
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
		[aCoder encodeObject:self.code forKey:kUploadAvatarModelCode];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kUploadAvatarModelContent];
	}
	if(self.data != nil){
		[aCoder encodeObject:self.data forKey:kUploadAvatarModelData];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kUploadAvatarModelCode];
	self.content = [aDecoder decodeObjectForKey:kUploadAvatarModelContent];
	self.data = [aDecoder decodeObjectForKey:kUploadAvatarModelData];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	UploadAvatarModel *copy = [UploadAvatarModel new];

	copy.code = [self.code copy];
	copy.content = [self.content copy];
	copy.data = [self.data copy];

	return copy;
}
@end
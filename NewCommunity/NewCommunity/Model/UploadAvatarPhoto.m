//
//	UploadAvatarPhoto.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "UploadAvatarPhoto.h"

NSString *const kUploadAvatarPhotoPath = @"path";
NSString *const kUploadAvatarPhotoUrl = @"url";

@interface UploadAvatarPhoto ()
@end
@implementation UploadAvatarPhoto




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kUploadAvatarPhotoPath] isKindOfClass:[NSNull class]]){
		self.path = dictionary[kUploadAvatarPhotoPath];
	}	
	if(![dictionary[kUploadAvatarPhotoUrl] isKindOfClass:[NSNull class]]){
		self.url = dictionary[kUploadAvatarPhotoUrl];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.path != nil){
		dictionary[kUploadAvatarPhotoPath] = self.path;
	}
	if(self.url != nil){
		dictionary[kUploadAvatarPhotoUrl] = self.url;
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
	if(self.path != nil){
		[aCoder encodeObject:self.path forKey:kUploadAvatarPhotoPath];
	}
	if(self.url != nil){
		[aCoder encodeObject:self.url forKey:kUploadAvatarPhotoUrl];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.path = [aDecoder decodeObjectForKey:kUploadAvatarPhotoPath];
	self.url = [aDecoder decodeObjectForKey:kUploadAvatarPhotoUrl];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	UploadAvatarPhoto *copy = [UploadAvatarPhoto new];

	copy.path = [self.path copy];
	copy.url = [self.url copy];

	return copy;
}
@end
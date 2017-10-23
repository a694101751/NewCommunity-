//
//	UploadAvatarData.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "UploadAvatarData.h"

NSString *const kUploadAvatarDataPhoto = @"photo";

@interface UploadAvatarData ()
@end
@implementation UploadAvatarData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(dictionary[kUploadAvatarDataPhoto] != nil && [dictionary[kUploadAvatarDataPhoto] isKindOfClass:[NSArray class]]){
		NSArray * photoDictionaries = dictionary[kUploadAvatarDataPhoto];
		NSMutableArray * photoItems = [NSMutableArray array];
		for(NSDictionary * photoDictionary in photoDictionaries){
			UploadAvatarPhoto * photoItem = [[UploadAvatarPhoto alloc] initWithDictionary:photoDictionary];
			[photoItems addObject:photoItem];
		}
		self.photo = photoItems;
	}
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.photo != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(UploadAvatarPhoto * photoElement in self.photo){
			[dictionaryElements addObject:[photoElement toDictionary]];
		}
		dictionary[kUploadAvatarDataPhoto] = dictionaryElements;
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
	if(self.photo != nil){
		[aCoder encodeObject:self.photo forKey:kUploadAvatarDataPhoto];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.photo = [aDecoder decodeObjectForKey:kUploadAvatarDataPhoto];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	UploadAvatarData *copy = [UploadAvatarData new];

	copy.photo = [self.photo copy];

	return copy;
}
@end
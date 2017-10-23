//
//	MyStatePage.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "MyStatePage.h"

NSString *const kMyStatePageAddTime = @"addTime";
NSString *const kMyStatePageClubid = @"clubid";
NSString *const kMyStatePageContent = @"content";
NSString *const kMyStatePageIdField = @"id";
NSString *const kMyStatePagePhoto = @"photo";
NSString *const kMyStatePageThumb = @"thumb";
NSString *const kMyStatePageTitle = @"title";

@interface MyStatePage ()
@end
@implementation MyStatePage




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kMyStatePageAddTime] isKindOfClass:[NSNull class]]){
		self.addTime = dictionary[kMyStatePageAddTime];
	}	
	if(![dictionary[kMyStatePageClubid] isKindOfClass:[NSNull class]]){
		self.clubid = dictionary[kMyStatePageClubid];
	}	
	if(![dictionary[kMyStatePageContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kMyStatePageContent];
	}	
	if(![dictionary[kMyStatePageIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kMyStatePageIdField];
	}	
	if(dictionary[kMyStatePagePhoto] != nil && [dictionary[kMyStatePagePhoto] isKindOfClass:[NSArray class]]){
		NSArray * photoDictionaries = dictionary[kMyStatePagePhoto];
		NSMutableArray * photoItems = [NSMutableArray array];
		for(NSDictionary * photoDictionary in photoDictionaries){
			MyStatePhoto * photoItem = [[MyStatePhoto alloc] initWithDictionary:photoDictionary];
			[photoItems addObject:photoItem];
		}
		self.photo = photoItems;
	}
	if(![dictionary[kMyStatePageThumb] isKindOfClass:[NSNull class]]){
		self.thumb = dictionary[kMyStatePageThumb];
	}	
	if(![dictionary[kMyStatePageTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kMyStatePageTitle];
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
		dictionary[kMyStatePageAddTime] = self.addTime;
	}
	if(self.clubid != nil){
		dictionary[kMyStatePageClubid] = self.clubid;
	}
	if(self.content != nil){
		dictionary[kMyStatePageContent] = self.content;
	}
	if(self.idField != nil){
		dictionary[kMyStatePageIdField] = self.idField;
	}
	if(self.photo != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(MyStatePhoto * photoElement in self.photo){
			[dictionaryElements addObject:[photoElement toDictionary]];
		}
		dictionary[kMyStatePagePhoto] = dictionaryElements;
	}
	if(self.thumb != nil){
		dictionary[kMyStatePageThumb] = self.thumb;
	}
	if(self.title != nil){
		dictionary[kMyStatePageTitle] = self.title;
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
		[aCoder encodeObject:self.addTime forKey:kMyStatePageAddTime];
	}
	if(self.clubid != nil){
		[aCoder encodeObject:self.clubid forKey:kMyStatePageClubid];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kMyStatePageContent];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kMyStatePageIdField];
	}
	if(self.photo != nil){
		[aCoder encodeObject:self.photo forKey:kMyStatePagePhoto];
	}
	if(self.thumb != nil){
		[aCoder encodeObject:self.thumb forKey:kMyStatePageThumb];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:kMyStatePageTitle];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.addTime = [aDecoder decodeObjectForKey:kMyStatePageAddTime];
	self.clubid = [aDecoder decodeObjectForKey:kMyStatePageClubid];
	self.content = [aDecoder decodeObjectForKey:kMyStatePageContent];
	self.idField = [aDecoder decodeObjectForKey:kMyStatePageIdField];
	self.photo = [aDecoder decodeObjectForKey:kMyStatePagePhoto];
	self.thumb = [aDecoder decodeObjectForKey:kMyStatePageThumb];
	self.title = [aDecoder decodeObjectForKey:kMyStatePageTitle];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	MyStatePage *copy = [MyStatePage new];

	copy.addTime = [self.addTime copy];
	copy.clubid = [self.clubid copy];
	copy.content = [self.content copy];
	copy.idField = [self.idField copy];
	copy.photo = [self.photo copy];
	copy.thumb = [self.thumb copy];
	copy.title = [self.title copy];

	return copy;
}
@end
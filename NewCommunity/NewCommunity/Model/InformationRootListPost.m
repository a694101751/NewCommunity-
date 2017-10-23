//
//	InformationRootListPost.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "InformationRootListPost.h"

NSString *const kInformationRootListPostComment = @"comment";
NSString *const kInformationRootListPostContent = @"content";
NSString *const kInformationRootListPostExcerpt = @"excerpt";
NSString *const kInformationRootListPostIdField = @"id";
NSString *const kInformationRootListPostPhoto = @"photo";
NSString *const kInformationRootListPostShowcase = @"showcase";
NSString *const kInformationRootListPostThumb = @"thumb";
NSString *const kInformationRootListPostTitle = @"title";
NSString *const kInformationRootListPostIstop = @"istop";

@interface InformationRootListPost ()
@end
@implementation InformationRootListPost




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kInformationRootListPostComment] isKindOfClass:[NSNull class]]){
		self.comment = dictionary[kInformationRootListPostComment];
	}	
	if(![dictionary[kInformationRootListPostContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kInformationRootListPostContent];
	}	
	if(![dictionary[kInformationRootListPostExcerpt] isKindOfClass:[NSNull class]]){
		self.excerpt = dictionary[kInformationRootListPostExcerpt];
	}	
	if(![dictionary[kInformationRootListPostIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kInformationRootListPostIdField];
	}	
	if(dictionary[kInformationRootListPostPhoto] != nil && [dictionary[kInformationRootListPostPhoto] isKindOfClass:[NSArray class]]){
		NSArray * photoDictionaries = dictionary[kInformationRootListPostPhoto];
		NSMutableArray * photoItems = [NSMutableArray array];
		for(NSDictionary * photoDictionary in photoDictionaries){
			InformationRootListPhoto * photoItem = [[InformationRootListPhoto alloc] initWithDictionary:photoDictionary];
			[photoItems addObject:photoItem];
		}
		self.photo = photoItems;
	}
	if(![dictionary[kInformationRootListPostShowcase] isKindOfClass:[NSNull class]]){
		self.showcase = dictionary[kInformationRootListPostShowcase];
	}	
	if(![dictionary[kInformationRootListPostThumb] isKindOfClass:[NSNull class]]){
		self.thumb = dictionary[kInformationRootListPostThumb];
	}
    if (![dictionary[kInformationRootListPostIstop] isKindOfClass:[NSNull class]]) {
        self.istop = dictionary[kInformationRootListPostIstop];
    }
	if(![dictionary[kInformationRootListPostTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kInformationRootListPostTitle];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.comment != nil){
		dictionary[kInformationRootListPostComment] = self.comment;
	}
	if(self.content != nil){
		dictionary[kInformationRootListPostContent] = self.content;
	}
	if(self.excerpt != nil){
		dictionary[kInformationRootListPostExcerpt] = self.excerpt;
	}
	if(self.idField != nil){
		dictionary[kInformationRootListPostIdField] = self.idField;
	}
	if(self.photo != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(InformationRootListPhoto * photoElement in self.photo){
			[dictionaryElements addObject:[photoElement toDictionary]];
		}
		dictionary[kInformationRootListPostPhoto] = dictionaryElements;
	}
	if(self.showcase != nil){
		dictionary[kInformationRootListPostShowcase] = self.showcase;
	}
    if(self.istop != nil){
        dictionary[kInformationRootListPostIstop] = self.istop;
    }
	if(self.thumb != nil){
		dictionary[kInformationRootListPostThumb] = self.thumb;
	}
	if(self.title != nil){
		dictionary[kInformationRootListPostTitle] = self.title;
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
	if(self.comment != nil){
		[aCoder encodeObject:self.comment forKey:kInformationRootListPostComment];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kInformationRootListPostContent];
	}
	if(self.excerpt != nil){
		[aCoder encodeObject:self.excerpt forKey:kInformationRootListPostExcerpt];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kInformationRootListPostIdField];
	}
	if(self.photo != nil){
		[aCoder encodeObject:self.photo forKey:kInformationRootListPostPhoto];
	}
	if(self.showcase != nil){
		[aCoder encodeObject:self.showcase forKey:kInformationRootListPostShowcase];
	}
	if(self.thumb != nil){
		[aCoder encodeObject:self.thumb forKey:kInformationRootListPostThumb];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:kInformationRootListPostTitle];
	}
    if(self.istop != nil){
        [aCoder encodeObject:self.istop forKey:kInformationRootListPostIstop];
    }

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.comment = [aDecoder decodeObjectForKey:kInformationRootListPostComment];
	self.content = [aDecoder decodeObjectForKey:kInformationRootListPostContent];
	self.excerpt = [aDecoder decodeObjectForKey:kInformationRootListPostExcerpt];
	self.idField = [aDecoder decodeObjectForKey:kInformationRootListPostIdField];
	self.photo = [aDecoder decodeObjectForKey:kInformationRootListPostPhoto];
	self.showcase = [aDecoder decodeObjectForKey:kInformationRootListPostShowcase];
	self.thumb = [aDecoder decodeObjectForKey:kInformationRootListPostThumb];
	self.istop = [aDecoder decodeObjectForKey:kInformationRootListPostIstop];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	InformationRootListPost *copy = [InformationRootListPost new];

	copy.comment = [self.comment copy];
	copy.content = [self.content copy];
	copy.excerpt = [self.excerpt copy];
	copy.idField = [self.idField copy];
	copy.photo = [self.photo copy];
	copy.showcase = [self.showcase copy];
	copy.thumb = [self.thumb copy];
	copy.title = [self.title copy];
    copy.istop = [self.istop copy];

	return copy;
}
@end

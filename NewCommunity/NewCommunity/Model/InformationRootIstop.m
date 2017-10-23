//
//	InformationRootIstop.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "InformationRootIstop.h"

NSString *const kInformationRootIstopComment = @"comment";
NSString *const kInformationRootIstopContent = @"content";
NSString *const kInformationRootIstopExcerpt = @"excerpt";
NSString *const kInformationRootIstopIdField = @"id";
NSString *const kInformationRootIstopPhoto = @"photo";
NSString *const kInformationRootIstopShowcase = @"showcase";
NSString *const kInformationRootIstopThumb = @"thumb";
NSString *const kInformationRootIstopTitle = @"title";

@interface InformationRootIstop ()
@end
@implementation InformationRootIstop




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kInformationRootIstopComment] isKindOfClass:[NSNull class]]){
		self.comment = dictionary[kInformationRootIstopComment];
	}	
	if(![dictionary[kInformationRootIstopContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kInformationRootIstopContent];
	}	
	if(![dictionary[kInformationRootIstopExcerpt] isKindOfClass:[NSNull class]]){
		self.excerpt = dictionary[kInformationRootIstopExcerpt];
	}	
	if(![dictionary[kInformationRootIstopIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kInformationRootIstopIdField];
	}	
	if(![dictionary[kInformationRootIstopPhoto] isKindOfClass:[NSNull class]]){
		self.photo = dictionary[kInformationRootIstopPhoto];
	}	
	if(![dictionary[kInformationRootIstopShowcase] isKindOfClass:[NSNull class]]){
		self.showcase = dictionary[kInformationRootIstopShowcase];
	}	
	if(![dictionary[kInformationRootIstopThumb] isKindOfClass:[NSNull class]]){
		self.thumb = dictionary[kInformationRootIstopThumb];
	}	
	if(![dictionary[kInformationRootIstopTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kInformationRootIstopTitle];
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
		dictionary[kInformationRootIstopComment] = self.comment;
	}
	if(self.content != nil){
		dictionary[kInformationRootIstopContent] = self.content;
	}
	if(self.excerpt != nil){
		dictionary[kInformationRootIstopExcerpt] = self.excerpt;
	}
	if(self.idField != nil){
		dictionary[kInformationRootIstopIdField] = self.idField;
	}
	if(self.photo != nil){
		dictionary[kInformationRootIstopPhoto] = self.photo;
	}
	if(self.showcase != nil){
		dictionary[kInformationRootIstopShowcase] = self.showcase;
	}
	if(self.thumb != nil){
		dictionary[kInformationRootIstopThumb] = self.thumb;
	}
	if(self.title != nil){
		dictionary[kInformationRootIstopTitle] = self.title;
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
		[aCoder encodeObject:self.comment forKey:kInformationRootIstopComment];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kInformationRootIstopContent];
	}
	if(self.excerpt != nil){
		[aCoder encodeObject:self.excerpt forKey:kInformationRootIstopExcerpt];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kInformationRootIstopIdField];
	}
	if(self.photo != nil){
		[aCoder encodeObject:self.photo forKey:kInformationRootIstopPhoto];
	}
	if(self.showcase != nil){
		[aCoder encodeObject:self.showcase forKey:kInformationRootIstopShowcase];
	}
	if(self.thumb != nil){
		[aCoder encodeObject:self.thumb forKey:kInformationRootIstopThumb];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:kInformationRootIstopTitle];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.comment = [aDecoder decodeObjectForKey:kInformationRootIstopComment];
	self.content = [aDecoder decodeObjectForKey:kInformationRootIstopContent];
	self.excerpt = [aDecoder decodeObjectForKey:kInformationRootIstopExcerpt];
	self.idField = [aDecoder decodeObjectForKey:kInformationRootIstopIdField];
	self.photo = [aDecoder decodeObjectForKey:kInformationRootIstopPhoto];
	self.showcase = [aDecoder decodeObjectForKey:kInformationRootIstopShowcase];
	self.thumb = [aDecoder decodeObjectForKey:kInformationRootIstopThumb];
	self.title = [aDecoder decodeObjectForKey:kInformationRootIstopTitle];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	InformationRootIstop *copy = [InformationRootIstop new];

	copy.comment = [self.comment copy];
	copy.content = [self.content copy];
	copy.excerpt = [self.excerpt copy];
	copy.idField = [self.idField copy];
	copy.photo = [self.photo copy];
	copy.showcase = [self.showcase copy];
	copy.thumb = [self.thumb copy];
	copy.title = [self.title copy];

	return copy;
}
@end
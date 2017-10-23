//
//	SearchResultsPost.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "SearchResultsPost.h"

NSString *const kSearchResultsPostComment = @"comment";
NSString *const kSearchResultsPostContent = @"content";
NSString *const kSearchResultsPostExcerpt = @"excerpt";
NSString *const kSearchResultsPostIdField = @"id";
NSString *const kSearchResultsPostPhoto = @"photo";
NSString *const kSearchResultsPostShowcase = @"showcase";
NSString *const kSearchResultsPostThumb = @"thumb";
NSString *const kSearchResultsPostTitle = @"title";

@interface SearchResultsPost ()
@end
@implementation SearchResultsPost




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kSearchResultsPostComment] isKindOfClass:[NSNull class]]){
		self.comment = dictionary[kSearchResultsPostComment];
	}	
	if(![dictionary[kSearchResultsPostContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kSearchResultsPostContent];
	}	
	if(![dictionary[kSearchResultsPostExcerpt] isKindOfClass:[NSNull class]]){
		self.excerpt = dictionary[kSearchResultsPostExcerpt];
	}	
	if(![dictionary[kSearchResultsPostIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kSearchResultsPostIdField];
	}	
	if(![dictionary[kSearchResultsPostPhoto] isKindOfClass:[NSNull class]]){
		self.photo = dictionary[kSearchResultsPostPhoto];
	}	
	if(![dictionary[kSearchResultsPostShowcase] isKindOfClass:[NSNull class]]){
		self.showcase = dictionary[kSearchResultsPostShowcase];
	}	
	if(![dictionary[kSearchResultsPostThumb] isKindOfClass:[NSNull class]]){
		self.thumb = dictionary[kSearchResultsPostThumb];
	}	
	if(![dictionary[kSearchResultsPostTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kSearchResultsPostTitle];
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
		dictionary[kSearchResultsPostComment] = self.comment;
	}
	if(self.content != nil){
		dictionary[kSearchResultsPostContent] = self.content;
	}
	if(self.excerpt != nil){
		dictionary[kSearchResultsPostExcerpt] = self.excerpt;
	}
	if(self.idField != nil){
		dictionary[kSearchResultsPostIdField] = self.idField;
	}
	if(self.photo != nil){
		dictionary[kSearchResultsPostPhoto] = self.photo;
	}
	if(self.showcase != nil){
		dictionary[kSearchResultsPostShowcase] = self.showcase;
	}
	if(self.thumb != nil){
		dictionary[kSearchResultsPostThumb] = self.thumb;
	}
	if(self.title != nil){
		dictionary[kSearchResultsPostTitle] = self.title;
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
		[aCoder encodeObject:self.comment forKey:kSearchResultsPostComment];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kSearchResultsPostContent];
	}
	if(self.excerpt != nil){
		[aCoder encodeObject:self.excerpt forKey:kSearchResultsPostExcerpt];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kSearchResultsPostIdField];
	}
	if(self.photo != nil){
		[aCoder encodeObject:self.photo forKey:kSearchResultsPostPhoto];
	}
	if(self.showcase != nil){
		[aCoder encodeObject:self.showcase forKey:kSearchResultsPostShowcase];
	}
	if(self.thumb != nil){
		[aCoder encodeObject:self.thumb forKey:kSearchResultsPostThumb];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:kSearchResultsPostTitle];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.comment = [aDecoder decodeObjectForKey:kSearchResultsPostComment];
	self.content = [aDecoder decodeObjectForKey:kSearchResultsPostContent];
	self.excerpt = [aDecoder decodeObjectForKey:kSearchResultsPostExcerpt];
	self.idField = [aDecoder decodeObjectForKey:kSearchResultsPostIdField];
	self.photo = [aDecoder decodeObjectForKey:kSearchResultsPostPhoto];
	self.showcase = [aDecoder decodeObjectForKey:kSearchResultsPostShowcase];
	self.thumb = [aDecoder decodeObjectForKey:kSearchResultsPostThumb];
	self.title = [aDecoder decodeObjectForKey:kSearchResultsPostTitle];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	SearchResultsPost *copy = [SearchResultsPost new];

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
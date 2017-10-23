//
//	ProjectDetailsPostRecommendList.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ProjectDetailsPostRecommendList.h"

NSString *const kProjectDetailsPostRecommendListAddTime = @"addTime";
NSString *const kProjectDetailsPostRecommendListClick = @"click";
NSString *const kProjectDetailsPostRecommendListComment = @"comment";
NSString *const kProjectDetailsPostRecommendListExcerpt = @"excerpt";
NSString *const kProjectDetailsPostRecommendListIdField = @"id";
NSString *const kProjectDetailsPostRecommendListName = @"name";
NSString *const kProjectDetailsPostRecommendListPostId = @"postId";
NSString *const kProjectDetailsPostRecommendListThumb = @"thumb";

@interface ProjectDetailsPostRecommendList ()
@end
@implementation ProjectDetailsPostRecommendList




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kProjectDetailsPostRecommendListAddTime] isKindOfClass:[NSNull class]]){
		self.addTime = dictionary[kProjectDetailsPostRecommendListAddTime];
	}	
	if(![dictionary[kProjectDetailsPostRecommendListClick] isKindOfClass:[NSNull class]]){
		self.click = dictionary[kProjectDetailsPostRecommendListClick];
	}	
	if(![dictionary[kProjectDetailsPostRecommendListComment] isKindOfClass:[NSNull class]]){
		self.comment = dictionary[kProjectDetailsPostRecommendListComment];
	}	
	if(![dictionary[kProjectDetailsPostRecommendListExcerpt] isKindOfClass:[NSNull class]]){
		self.excerpt = dictionary[kProjectDetailsPostRecommendListExcerpt];
	}	
	if(![dictionary[kProjectDetailsPostRecommendListIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kProjectDetailsPostRecommendListIdField];
	}	
	if(![dictionary[kProjectDetailsPostRecommendListName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kProjectDetailsPostRecommendListName];
	}	
	if(![dictionary[kProjectDetailsPostRecommendListPostId] isKindOfClass:[NSNull class]]){
		self.postId = dictionary[kProjectDetailsPostRecommendListPostId];
	}	
	if(![dictionary[kProjectDetailsPostRecommendListThumb] isKindOfClass:[NSNull class]]){
		self.thumb = dictionary[kProjectDetailsPostRecommendListThumb];
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
		dictionary[kProjectDetailsPostRecommendListAddTime] = self.addTime;
	}
	if(self.click != nil){
		dictionary[kProjectDetailsPostRecommendListClick] = self.click;
	}
	if(self.comment != nil){
		dictionary[kProjectDetailsPostRecommendListComment] = self.comment;
	}
	if(self.excerpt != nil){
		dictionary[kProjectDetailsPostRecommendListExcerpt] = self.excerpt;
	}
	if(self.idField != nil){
		dictionary[kProjectDetailsPostRecommendListIdField] = self.idField;
	}
	if(self.name != nil){
		dictionary[kProjectDetailsPostRecommendListName] = self.name;
	}
	if(self.postId != nil){
		dictionary[kProjectDetailsPostRecommendListPostId] = self.postId;
	}
	if(self.thumb != nil){
		dictionary[kProjectDetailsPostRecommendListThumb] = self.thumb;
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
		[aCoder encodeObject:self.addTime forKey:kProjectDetailsPostRecommendListAddTime];
	}
	if(self.click != nil){
		[aCoder encodeObject:self.click forKey:kProjectDetailsPostRecommendListClick];
	}
	if(self.comment != nil){
		[aCoder encodeObject:self.comment forKey:kProjectDetailsPostRecommendListComment];
	}
	if(self.excerpt != nil){
		[aCoder encodeObject:self.excerpt forKey:kProjectDetailsPostRecommendListExcerpt];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kProjectDetailsPostRecommendListIdField];
	}
	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:kProjectDetailsPostRecommendListName];
	}
	if(self.postId != nil){
		[aCoder encodeObject:self.postId forKey:kProjectDetailsPostRecommendListPostId];
	}
	if(self.thumb != nil){
		[aCoder encodeObject:self.thumb forKey:kProjectDetailsPostRecommendListThumb];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.addTime = [aDecoder decodeObjectForKey:kProjectDetailsPostRecommendListAddTime];
	self.click = [aDecoder decodeObjectForKey:kProjectDetailsPostRecommendListClick];
	self.comment = [aDecoder decodeObjectForKey:kProjectDetailsPostRecommendListComment];
	self.excerpt = [aDecoder decodeObjectForKey:kProjectDetailsPostRecommendListExcerpt];
	self.idField = [aDecoder decodeObjectForKey:kProjectDetailsPostRecommendListIdField];
	self.name = [aDecoder decodeObjectForKey:kProjectDetailsPostRecommendListName];
	self.postId = [aDecoder decodeObjectForKey:kProjectDetailsPostRecommendListPostId];
	self.thumb = [aDecoder decodeObjectForKey:kProjectDetailsPostRecommendListThumb];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	ProjectDetailsPostRecommendList *copy = [ProjectDetailsPostRecommendList new];

	copy.addTime = [self.addTime copy];
	copy.click = [self.click copy];
	copy.comment = [self.comment copy];
	copy.excerpt = [self.excerpt copy];
	copy.idField = [self.idField copy];
	copy.name = [self.name copy];
	copy.postId = [self.postId copy];
	copy.thumb = [self.thumb copy];

	return copy;
}
@end
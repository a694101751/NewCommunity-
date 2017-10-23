//
//	DetailsPostRecommendList.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DetailsPostRecommendList.h"

NSString *const kDetailsPostRecommendListAddTime = @"addTime";
NSString *const kDetailsPostRecommendListClick = @"click";
NSString *const kDetailsPostRecommendListComment = @"comment";
NSString *const kDetailsPostRecommendListIdField = @"id";
NSString *const kDetailsPostRecommendListName = @"name";
NSString *const kDetailsPostRecommendListPostId = @"postId";
NSString *const kDetailsPostRecommendListThumb = @"thumb";

@interface DetailsPostRecommendList ()
@end
@implementation DetailsPostRecommendList




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDetailsPostRecommendListAddTime] isKindOfClass:[NSNull class]]){
		self.addTime = dictionary[kDetailsPostRecommendListAddTime];
	}	
	if(![dictionary[kDetailsPostRecommendListClick] isKindOfClass:[NSNull class]]){
		self.click = dictionary[kDetailsPostRecommendListClick];
	}	
	if(![dictionary[kDetailsPostRecommendListComment] isKindOfClass:[NSNull class]]){
		self.comment = dictionary[kDetailsPostRecommendListComment];
	}	
	if(![dictionary[kDetailsPostRecommendListIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kDetailsPostRecommendListIdField];
	}	
	if(![dictionary[kDetailsPostRecommendListName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kDetailsPostRecommendListName];
	}	
	if(![dictionary[kDetailsPostRecommendListPostId] isKindOfClass:[NSNull class]]){
		self.postId = dictionary[kDetailsPostRecommendListPostId];
	}	
	if(![dictionary[kDetailsPostRecommendListThumb] isKindOfClass:[NSNull class]]){
		self.thumb = dictionary[kDetailsPostRecommendListThumb];
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
		dictionary[kDetailsPostRecommendListAddTime] = self.addTime;
	}
	if(self.click != nil){
		dictionary[kDetailsPostRecommendListClick] = self.click;
	}
	if(self.comment != nil){
		dictionary[kDetailsPostRecommendListComment] = self.comment;
	}
	if(self.idField != nil){
		dictionary[kDetailsPostRecommendListIdField] = self.idField;
	}
	if(self.name != nil){
		dictionary[kDetailsPostRecommendListName] = self.name;
	}
	if(self.postId != nil){
		dictionary[kDetailsPostRecommendListPostId] = self.postId;
	}
	if(self.thumb != nil){
		dictionary[kDetailsPostRecommendListThumb] = self.thumb;
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
		[aCoder encodeObject:self.addTime forKey:kDetailsPostRecommendListAddTime];
	}
	if(self.click != nil){
		[aCoder encodeObject:self.click forKey:kDetailsPostRecommendListClick];
	}
	if(self.comment != nil){
		[aCoder encodeObject:self.comment forKey:kDetailsPostRecommendListComment];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kDetailsPostRecommendListIdField];
	}
	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:kDetailsPostRecommendListName];
	}
	if(self.postId != nil){
		[aCoder encodeObject:self.postId forKey:kDetailsPostRecommendListPostId];
	}
	if(self.thumb != nil){
		[aCoder encodeObject:self.thumb forKey:kDetailsPostRecommendListThumb];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.addTime = [aDecoder decodeObjectForKey:kDetailsPostRecommendListAddTime];
	self.click = [aDecoder decodeObjectForKey:kDetailsPostRecommendListClick];
	self.comment = [aDecoder decodeObjectForKey:kDetailsPostRecommendListComment];
	self.idField = [aDecoder decodeObjectForKey:kDetailsPostRecommendListIdField];
	self.name = [aDecoder decodeObjectForKey:kDetailsPostRecommendListName];
	self.postId = [aDecoder decodeObjectForKey:kDetailsPostRecommendListPostId];
	self.thumb = [aDecoder decodeObjectForKey:kDetailsPostRecommendListThumb];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DetailsPostRecommendList *copy = [DetailsPostRecommendList new];

	copy.addTime = [self.addTime copy];
	copy.click = [self.click copy];
	copy.comment = [self.comment copy];
	copy.idField = [self.idField copy];
	copy.name = [self.name copy];
	copy.postId = [self.postId copy];
	copy.thumb = [self.thumb copy];

	return copy;
}
@end
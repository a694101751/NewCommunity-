//
//	MyCollectionPost.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "MyCollectionPost.h"

NSString *const kMyCollectionPostAddTime = @"addTime";
NSString *const kMyCollectionPostIdField = @"id";
NSString *const kMyCollectionPostPostId = @"postId";
NSString *const kMyCollectionPostThumb = @"thumb";
NSString *const kMyCollectionPostTitle = @"title";
NSString *const kMyCollectionPostType = @"type";

@interface MyCollectionPost ()
@end
@implementation MyCollectionPost




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kMyCollectionPostAddTime] isKindOfClass:[NSNull class]]){
		self.addTime = dictionary[kMyCollectionPostAddTime];
	}	
	if(![dictionary[kMyCollectionPostIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kMyCollectionPostIdField];
	}	
	if(![dictionary[kMyCollectionPostPostId] isKindOfClass:[NSNull class]]){
		self.postId = dictionary[kMyCollectionPostPostId];
	}	
	if(![dictionary[kMyCollectionPostThumb] isKindOfClass:[NSNull class]]){
		self.thumb = dictionary[kMyCollectionPostThumb];
	}	
	if(![dictionary[kMyCollectionPostTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kMyCollectionPostTitle];
	}
    if(![dictionary[kMyCollectionPostType] isKindOfClass:[NSNull class]]){
        self.type = dictionary[kMyCollectionPostType];
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
		dictionary[kMyCollectionPostAddTime] = self.addTime;
	}
	if(self.idField != nil){
		dictionary[kMyCollectionPostIdField] = self.idField;
	}
	if(self.postId != nil){
		dictionary[kMyCollectionPostPostId] = self.postId;
	}
	if(self.thumb != nil){
		dictionary[kMyCollectionPostThumb] = self.thumb;
	}
	if(self.title != nil){
		dictionary[kMyCollectionPostTitle] = self.title;
	}
    if(self.type != nil){
        dictionary[kMyCollectionPostType] = self.type;
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
		[aCoder encodeObject:self.addTime forKey:kMyCollectionPostAddTime];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kMyCollectionPostIdField];
	}
	if(self.postId != nil){
		[aCoder encodeObject:self.postId forKey:kMyCollectionPostPostId];
	}
	if(self.thumb != nil){
		[aCoder encodeObject:self.thumb forKey:kMyCollectionPostThumb];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:kMyCollectionPostTitle];
	}
    if(self.type != nil){
        [aCoder encodeObject:self.type forKey:kMyCollectionPostType];
    }

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.addTime = [aDecoder decodeObjectForKey:kMyCollectionPostAddTime];
	self.idField = [aDecoder decodeObjectForKey:kMyCollectionPostIdField];
	self.postId = [aDecoder decodeObjectForKey:kMyCollectionPostPostId];
	self.thumb = [aDecoder decodeObjectForKey:kMyCollectionPostThumb];
	self.title = [aDecoder decodeObjectForKey:kMyCollectionPostTitle];
    self.type = [aDecoder decodeObjectForKey:kMyCollectionPostType];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	MyCollectionPost *copy = [MyCollectionPost new];

	copy.addTime = [self.addTime copy];
	copy.idField = [self.idField copy];
	copy.postId = [self.postId copy];
	copy.thumb = [self.thumb copy];
	copy.title = [self.title copy];
    copy.type = [self.type copy];

	return copy;
}
@end

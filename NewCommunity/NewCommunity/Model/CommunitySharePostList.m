//
//	CommunitySharePostList.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunitySharePostList.h"

NSString *const kCommunitySharePostListIdField = @"id";
NSString *const kCommunitySharePostListThumb = @"thumb";

@interface CommunitySharePostList ()
@end
@implementation CommunitySharePostList




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCommunitySharePostListIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kCommunitySharePostListIdField];
	}	
	if(![dictionary[kCommunitySharePostListThumb] isKindOfClass:[NSNull class]]){
		self.thumb = dictionary[kCommunitySharePostListThumb];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.idField != nil){
		dictionary[kCommunitySharePostListIdField] = self.idField;
	}
	if(self.thumb != nil){
		dictionary[kCommunitySharePostListThumb] = self.thumb;
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
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kCommunitySharePostListIdField];
	}
	if(self.thumb != nil){
		[aCoder encodeObject:self.thumb forKey:kCommunitySharePostListThumb];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.idField = [aDecoder decodeObjectForKey:kCommunitySharePostListIdField];
	self.thumb = [aDecoder decodeObjectForKey:kCommunitySharePostListThumb];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunitySharePostList *copy = [CommunitySharePostList new];

	copy.idField = [self.idField copy];
	copy.thumb = [self.thumb copy];

	return copy;
}
@end
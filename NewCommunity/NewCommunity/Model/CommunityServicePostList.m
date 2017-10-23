//
//	CommunityServicePostList.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityServicePostList.h"

NSString *const kCommunityServicePostListClubid = @"clubid";
NSString *const kCommunityServicePostListIdField = @"id";
NSString *const kCommunityServicePostListThumb = @"thumb";

@interface CommunityServicePostList ()
@end
@implementation CommunityServicePostList




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCommunityServicePostListClubid] isKindOfClass:[NSNull class]]){
		self.clubid = dictionary[kCommunityServicePostListClubid];
	}	
	if(![dictionary[kCommunityServicePostListIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kCommunityServicePostListIdField];
	}	
	if(![dictionary[kCommunityServicePostListThumb] isKindOfClass:[NSNull class]]){
		self.thumb = dictionary[kCommunityServicePostListThumb];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.clubid != nil){
		dictionary[kCommunityServicePostListClubid] = self.clubid;
	}
	if(self.idField != nil){
		dictionary[kCommunityServicePostListIdField] = self.idField;
	}
	if(self.thumb != nil){
		dictionary[kCommunityServicePostListThumb] = self.thumb;
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
	if(self.clubid != nil){
		[aCoder encodeObject:self.clubid forKey:kCommunityServicePostListClubid];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kCommunityServicePostListIdField];
	}
	if(self.thumb != nil){
		[aCoder encodeObject:self.thumb forKey:kCommunityServicePostListThumb];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.clubid = [aDecoder decodeObjectForKey:kCommunityServicePostListClubid];
	self.idField = [aDecoder decodeObjectForKey:kCommunityServicePostListIdField];
	self.thumb = [aDecoder decodeObjectForKey:kCommunityServicePostListThumb];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityServicePostList *copy = [CommunityServicePostList new];

	copy.clubid = [self.clubid copy];
	copy.idField = [self.idField copy];
	copy.thumb = [self.thumb copy];

	return copy;
}
@end
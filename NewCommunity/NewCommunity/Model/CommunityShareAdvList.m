//
//	CommunityShareAdvList.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityShareAdvList.h"

NSString *const kCommunityShareAdvListDirect = @"direct";
NSString *const kCommunityShareAdvListIdField = @"id";
NSString *const kCommunityShareAdvListThumb = @"thumb";
NSString *const kCommunityShareAdvListTitle = @"title";
NSString *const kCommunityShareAdvListObjectId = @"objectId";

@interface CommunityShareAdvList ()
@end
@implementation CommunityShareAdvList




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCommunityShareAdvListDirect] isKindOfClass:[NSNull class]]){
		self.direct = dictionary[kCommunityShareAdvListDirect];
	}	
	if(![dictionary[kCommunityShareAdvListIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kCommunityShareAdvListIdField];
	}	
	if(![dictionary[kCommunityShareAdvListThumb] isKindOfClass:[NSNull class]]){
		self.thumb = dictionary[kCommunityShareAdvListThumb];
	}
    if(![dictionary[kCommunityShareAdvListTitle] isKindOfClass:[NSNull class]]){
        self.title = dictionary[kCommunityShareAdvListTitle];
    }
    if(![dictionary[kCommunityShareAdvListObjectId] isKindOfClass:[NSNull class]]){
        self.objectId = dictionary[kCommunityShareAdvListObjectId];
    }
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.direct != nil){
		dictionary[kCommunityShareAdvListDirect] = self.direct;
	}
	if(self.idField != nil){
		dictionary[kCommunityShareAdvListIdField] = self.idField;
	}
	if(self.thumb != nil){
		dictionary[kCommunityShareAdvListThumb] = self.thumb;
	}
    if(self.objectId != nil){
        dictionary[kCommunityShareAdvListObjectId] = self.objectId;
    }
    if(self.title != nil){
        dictionary[kCommunityShareAdvListTitle] = self.title;
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
	if(self.direct != nil){
		[aCoder encodeObject:self.direct forKey:kCommunityShareAdvListDirect];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kCommunityShareAdvListIdField];
	}
	if(self.thumb != nil){
		[aCoder encodeObject:self.thumb forKey:kCommunityShareAdvListThumb];
	}
    if(self.title != nil){
        [aCoder encodeObject:self.title forKey:kCommunityShareAdvListTitle];
    }
    
    if(self.objectId != nil){
        [aCoder encodeObject:self.objectId forKey:kCommunityShareAdvListObjectId];
    }

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.direct = [aDecoder decodeObjectForKey:kCommunityShareAdvListDirect];
	self.idField = [aDecoder decodeObjectForKey:kCommunityShareAdvListIdField];
	self.thumb = [aDecoder decodeObjectForKey:kCommunityShareAdvListThumb];
    self.title = [aDecoder decodeObjectForKey:kCommunityShareAdvListTitle];
    self.objectId = [aDecoder decodeObjectForKey:kCommunityShareAdvListObjectId];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityShareAdvList *copy = [CommunityShareAdvList new];

	copy.direct = [self.direct copy];
	copy.idField = [self.idField copy];
	copy.thumb = [self.thumb copy];
    copy.title = [self.title copy];
    copy.objectId = [self.objectId copy];

	return copy;
}
@end

//
//	CommunityLifeAdvList.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityLifeAdvList.h"

NSString *const kCommunityLifeAdvListDirect = @"direct";
NSString *const kCommunityLifeAdvListIdField = @"id";
NSString *const kCommunityLifeAdvListThumb = @"thumb";
NSString *const kCommunityLifeAdvListTitle = @"title";
NSString *const kCommunityLifeAdvListObjectId = @"objectId";

@interface CommunityLifeAdvList ()
@end
@implementation CommunityLifeAdvList




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCommunityLifeAdvListDirect] isKindOfClass:[NSNull class]]){
		self.direct = dictionary[kCommunityLifeAdvListDirect];
	}	
	if(![dictionary[kCommunityLifeAdvListIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kCommunityLifeAdvListIdField];
	}	
	if(![dictionary[kCommunityLifeAdvListThumb] isKindOfClass:[NSNull class]]){
		self.thumb = dictionary[kCommunityLifeAdvListThumb];
	}
    if(![dictionary[kCommunityLifeAdvListTitle] isKindOfClass:[NSNull class]]){
        self.title = dictionary[kCommunityLifeAdvListTitle];
    }
    if(![dictionary[kCommunityLifeAdvListObjectId] isKindOfClass:[NSNull class]]){
        self.objectId = dictionary[kCommunityLifeAdvListObjectId];
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
		dictionary[kCommunityLifeAdvListDirect] = self.direct;
	}
	if(self.idField != nil){
		dictionary[kCommunityLifeAdvListIdField] = self.idField;
	}
	if(self.thumb != nil){
		dictionary[kCommunityLifeAdvListThumb] = self.thumb;
	}
    if(self.objectId != nil){
        dictionary[kCommunityLifeAdvListObjectId] = self.objectId;
    }
    if(self.title != nil){
        dictionary[kCommunityLifeAdvListTitle] = self.title;
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
		[aCoder encodeObject:self.direct forKey:kCommunityLifeAdvListDirect];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kCommunityLifeAdvListIdField];
	}
	if(self.thumb != nil){
		[aCoder encodeObject:self.thumb forKey:kCommunityLifeAdvListThumb];
	}
    if(self.title != nil){
        [aCoder encodeObject:self.title forKey:kCommunityLifeAdvListTitle];
    }
    
    if(self.objectId != nil){
        [aCoder encodeObject:self.objectId forKey:kCommunityLifeAdvListObjectId];
    }

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.direct = [aDecoder decodeObjectForKey:kCommunityLifeAdvListDirect];
	self.idField = [aDecoder decodeObjectForKey:kCommunityLifeAdvListIdField];
	self.thumb = [aDecoder decodeObjectForKey:kCommunityLifeAdvListThumb];
    self.title = [aDecoder decodeObjectForKey:kCommunityLifeAdvListTitle];
    self.objectId = [aDecoder decodeObjectForKey:kCommunityLifeAdvListObjectId];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityLifeAdvList *copy = [CommunityLifeAdvList new];

	copy.direct = [self.direct copy];
	copy.idField = [self.idField copy];
	copy.thumb = [self.thumb copy];
    copy.title = [self.title copy];
    copy.objectId = [self.objectId copy];

	return copy;
}
@end

//
//	GovernmentAffairsRootAdvList.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "GovernmentAffairsRootAdvList.h"

NSString *const kGovernmentAffairsRootAdvListDirect = @"direct";
NSString *const kGovernmentAffairsRootAdvListIdField = @"id";
NSString *const kGovernmentAffairsRootAdvListThumb = @"thumb";
NSString *const kGovernmentAffairsRootAdvListTitle = @"title";
NSString *const kGovernmentAffairsRootAdvListObjectId = @"objectId";

@interface GovernmentAffairsRootAdvList ()
@end
@implementation GovernmentAffairsRootAdvList




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kGovernmentAffairsRootAdvListDirect] isKindOfClass:[NSNull class]]){
		self.direct = dictionary[kGovernmentAffairsRootAdvListDirect];
	}	
	if(![dictionary[kGovernmentAffairsRootAdvListIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kGovernmentAffairsRootAdvListIdField];
	}	
	if(![dictionary[kGovernmentAffairsRootAdvListThumb] isKindOfClass:[NSNull class]]){
		self.thumb = dictionary[kGovernmentAffairsRootAdvListThumb];
	}
    if(![dictionary[kGovernmentAffairsRootAdvListTitle] isKindOfClass:[NSNull class]]){
        self.title = dictionary[kGovernmentAffairsRootAdvListTitle];
    }
    if(![dictionary[kGovernmentAffairsRootAdvListObjectId] isKindOfClass:[NSNull class]]){
        self.objectId = dictionary[kGovernmentAffairsRootAdvListObjectId];
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
		dictionary[kGovernmentAffairsRootAdvListDirect] = self.direct;
	}
	if(self.idField != nil){
		dictionary[kGovernmentAffairsRootAdvListIdField] = self.idField;
	}
	if(self.thumb != nil){
		dictionary[kGovernmentAffairsRootAdvListThumb] = self.thumb;
	}
    if(self.title != nil){
        dictionary[kGovernmentAffairsRootAdvListTitle] = self.title;
    }
    if(self.objectId != nil){
        dictionary[kGovernmentAffairsRootAdvListObjectId] = self.objectId;
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
		[aCoder encodeObject:self.direct forKey:kGovernmentAffairsRootAdvListDirect];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kGovernmentAffairsRootAdvListIdField];
	}
	if(self.thumb != nil){
		[aCoder encodeObject:self.thumb forKey:kGovernmentAffairsRootAdvListThumb];
	}
    if(self.title != nil){
        [aCoder encodeObject:self.title forKey:kGovernmentAffairsRootAdvListTitle];
    }
    if(self.objectId != nil){
        [aCoder encodeObject:self.objectId forKey:kGovernmentAffairsRootAdvListObjectId];
    }

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.direct = [aDecoder decodeObjectForKey:kGovernmentAffairsRootAdvListDirect];
	self.idField = [aDecoder decodeObjectForKey:kGovernmentAffairsRootAdvListIdField];
	self.thumb = [aDecoder decodeObjectForKey:kGovernmentAffairsRootAdvListThumb];
    self.title = [aDecoder decodeObjectForKey:kGovernmentAffairsRootAdvListTitle];
    self.objectId = [aDecoder decodeObjectForKey:kGovernmentAffairsRootAdvListObjectId];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	GovernmentAffairsRootAdvList *copy = [GovernmentAffairsRootAdvList new];

	copy.direct = [self.direct copy];
	copy.idField = [self.idField copy];
	copy.thumb = [self.thumb copy];
    copy.title = [self.title copy];
    copy.objectId = [self.objectId copy];

	return copy;
}
@end

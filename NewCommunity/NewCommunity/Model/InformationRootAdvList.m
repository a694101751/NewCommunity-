//
//	InformationRootAdvList.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "InformationRootAdvList.h"

NSString *const kInformationRootAdvListDirect = @"direct";
NSString *const kInformationRootAdvListIdField = @"id";
NSString *const kInformationRootAdvListThumb = @"thumb";
NSString *const kInformationRootAdvListTitle = @"title";
NSString *const kInformationRootAdvListObjectId = @"objectId";

@interface InformationRootAdvList ()
@end
@implementation InformationRootAdvList




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kInformationRootAdvListDirect] isKindOfClass:[NSNull class]]){
		self.direct = dictionary[kInformationRootAdvListDirect];
	}	
	if(![dictionary[kInformationRootAdvListIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kInformationRootAdvListIdField];
	}	
	if(![dictionary[kInformationRootAdvListThumb] isKindOfClass:[NSNull class]]){
		self.thumb = dictionary[kInformationRootAdvListThumb];
	}
    if(![dictionary[kInformationRootAdvListTitle] isKindOfClass:[NSNull class]]){
        self.title = dictionary[kInformationRootAdvListTitle];
    }
    if(![dictionary[kInformationRootAdvListObjectId] isKindOfClass:[NSNull class]]){
        self.objectId = dictionary[kInformationRootAdvListObjectId];
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
		dictionary[kInformationRootAdvListDirect] = self.direct;
	}
	if(self.idField != nil){
		dictionary[kInformationRootAdvListIdField] = self.idField;
	}
	if(self.thumb != nil){
		dictionary[kInformationRootAdvListThumb] = self.thumb;
	}
    if(self.objectId != nil){
        dictionary[kInformationRootAdvListObjectId] = self.objectId;
    }
    if(self.title != nil){
        dictionary[kInformationRootAdvListTitle] = self.title;
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
		[aCoder encodeObject:self.direct forKey:kInformationRootAdvListDirect];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kInformationRootAdvListIdField];
	}
	if(self.thumb != nil){
		[aCoder encodeObject:self.thumb forKey:kInformationRootAdvListThumb];
	}
    if(self.title != nil){
        [aCoder encodeObject:self.title forKey:kInformationRootAdvListTitle];
    }
    
    if(self.objectId != nil){
        [aCoder encodeObject:self.objectId forKey:kInformationRootAdvListObjectId];
    }

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.direct = [aDecoder decodeObjectForKey:kInformationRootAdvListDirect];
	self.idField = [aDecoder decodeObjectForKey:kInformationRootAdvListIdField];
	self.thumb = [aDecoder decodeObjectForKey:kInformationRootAdvListThumb];
    self.title = [aDecoder decodeObjectForKey:kInformationRootAdvListTitle];
    self.objectId = [aDecoder decodeObjectForKey:kInformationRootAdvListObjectId];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	InformationRootAdvList *copy = [InformationRootAdvList new];

	copy.direct = [self.direct copy];
	copy.idField = [self.idField copy];
	copy.thumb = [self.thumb copy];
    copy.title = [self.title copy];
    copy.objectId = [self.objectId copy];

	return copy;
}
@end

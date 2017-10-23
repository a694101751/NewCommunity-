//
//	InformationActivitiesActivityList.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "InformationActivitiesActivityList.h"

NSString *const kInformationActivitiesActivityListContent = @"content";
NSString *const kInformationActivitiesActivityListIdField = @"id";
NSString *const kInformationActivitiesActivityListThumb = @"thumb";
NSString *const kInformationActivitiesActivityListTitle = @"title";

@interface InformationActivitiesActivityList ()
@end
@implementation InformationActivitiesActivityList




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kInformationActivitiesActivityListContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kInformationActivitiesActivityListContent];
	}	
	if(![dictionary[kInformationActivitiesActivityListIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kInformationActivitiesActivityListIdField];
	}	
	if(![dictionary[kInformationActivitiesActivityListThumb] isKindOfClass:[NSNull class]]){
		self.thumb = dictionary[kInformationActivitiesActivityListThumb];
	}
    if(![dictionary[kInformationActivitiesActivityListTitle] isKindOfClass:[NSNull class]]){
        self.title = dictionary[kInformationActivitiesActivityListTitle];
    }
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.content != nil){
		dictionary[kInformationActivitiesActivityListContent] = self.content;
	}
	if(self.idField != nil){
		dictionary[kInformationActivitiesActivityListIdField] = self.idField;
	}
	if(self.thumb != nil){
		dictionary[kInformationActivitiesActivityListThumb] = self.thumb;
	}
    if(self.title != nil){
        dictionary[kInformationActivitiesActivityListTitle] = self.title;
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
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kInformationActivitiesActivityListContent];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kInformationActivitiesActivityListIdField];
	}
	if(self.thumb != nil){
		[aCoder encodeObject:self.thumb forKey:kInformationActivitiesActivityListThumb];
	}
    if(self.title != nil){
        [aCoder encodeObject:self.title forKey:kInformationActivitiesActivityListTitle];
    }

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.content = [aDecoder decodeObjectForKey:kInformationActivitiesActivityListContent];
	self.idField = [aDecoder decodeObjectForKey:kInformationActivitiesActivityListIdField];
	self.thumb = [aDecoder decodeObjectForKey:kInformationActivitiesActivityListThumb];
    self.title = [aDecoder decodeObjectForKey:kInformationActivitiesActivityListTitle];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	InformationActivitiesActivityList *copy = [InformationActivitiesActivityList new];

	copy.content = [self.content copy];
	copy.idField = [self.idField copy];
	copy.thumb = [self.thumb copy];
    copy.title = [self.title copy];

	return copy;
}
@end

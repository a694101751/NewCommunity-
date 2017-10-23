//
//	GovernmentAffairsRootCareList.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "GovernmentAffairsRootCareList.h"

NSString *const kGovernmentAffairsRootCareListIdField = @"id";
NSString *const kGovernmentAffairsRootCareListThumb = @"thumb";
NSString *const kGovernmentAffairsRootCareListTitle = @"title";

@interface GovernmentAffairsRootCareList ()
@end
@implementation GovernmentAffairsRootCareList




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kGovernmentAffairsRootCareListIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kGovernmentAffairsRootCareListIdField];
	}	
	if(![dictionary[kGovernmentAffairsRootCareListThumb] isKindOfClass:[NSNull class]]){
		self.thumb = dictionary[kGovernmentAffairsRootCareListThumb];
	}	
	if(![dictionary[kGovernmentAffairsRootCareListTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kGovernmentAffairsRootCareListTitle];
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
		dictionary[kGovernmentAffairsRootCareListIdField] = self.idField;
	}
	if(self.thumb != nil){
		dictionary[kGovernmentAffairsRootCareListThumb] = self.thumb;
	}
	if(self.title != nil){
		dictionary[kGovernmentAffairsRootCareListTitle] = self.title;
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
		[aCoder encodeObject:self.idField forKey:kGovernmentAffairsRootCareListIdField];
	}
	if(self.thumb != nil){
		[aCoder encodeObject:self.thumb forKey:kGovernmentAffairsRootCareListThumb];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:kGovernmentAffairsRootCareListTitle];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.idField = [aDecoder decodeObjectForKey:kGovernmentAffairsRootCareListIdField];
	self.thumb = [aDecoder decodeObjectForKey:kGovernmentAffairsRootCareListThumb];
	self.title = [aDecoder decodeObjectForKey:kGovernmentAffairsRootCareListTitle];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	GovernmentAffairsRootCareList *copy = [GovernmentAffairsRootCareList new];

	copy.idField = [self.idField copy];
	copy.thumb = [self.thumb copy];
	copy.title = [self.title copy];

	return copy;
}
@end

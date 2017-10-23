//
//	PropertyServicePage.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PropertyServicePage.h"

NSString *const kPropertyServicePageAreaId = @"areaId";
NSString *const kPropertyServicePageClubId = @"clubId";
NSString *const kPropertyServicePageIdField = @"id";
NSString *const kPropertyServicePageTitle = @"title";
NSString *const kPropertyServicePageUrl = @"url";

@interface PropertyServicePage ()
@end
@implementation PropertyServicePage




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kPropertyServicePageAreaId] isKindOfClass:[NSNull class]]){
		self.areaId = dictionary[kPropertyServicePageAreaId];
	}	
	if(![dictionary[kPropertyServicePageClubId] isKindOfClass:[NSNull class]]){
		self.clubId = dictionary[kPropertyServicePageClubId];
	}	
	if(![dictionary[kPropertyServicePageIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kPropertyServicePageIdField];
	}	
	if(![dictionary[kPropertyServicePageTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kPropertyServicePageTitle];
	}	
	if(![dictionary[kPropertyServicePageUrl] isKindOfClass:[NSNull class]]){
		self.url = dictionary[kPropertyServicePageUrl];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.areaId != nil){
		dictionary[kPropertyServicePageAreaId] = self.areaId;
	}
	if(self.clubId != nil){
		dictionary[kPropertyServicePageClubId] = self.clubId;
	}
	if(self.idField != nil){
		dictionary[kPropertyServicePageIdField] = self.idField;
	}
	if(self.title != nil){
		dictionary[kPropertyServicePageTitle] = self.title;
	}
	if(self.url != nil){
		dictionary[kPropertyServicePageUrl] = self.url;
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
	if(self.areaId != nil){
		[aCoder encodeObject:self.areaId forKey:kPropertyServicePageAreaId];
	}
	if(self.clubId != nil){
		[aCoder encodeObject:self.clubId forKey:kPropertyServicePageClubId];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kPropertyServicePageIdField];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:kPropertyServicePageTitle];
	}
	if(self.url != nil){
		[aCoder encodeObject:self.url forKey:kPropertyServicePageUrl];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.areaId = [aDecoder decodeObjectForKey:kPropertyServicePageAreaId];
	self.clubId = [aDecoder decodeObjectForKey:kPropertyServicePageClubId];
	self.idField = [aDecoder decodeObjectForKey:kPropertyServicePageIdField];
	self.title = [aDecoder decodeObjectForKey:kPropertyServicePageTitle];
	self.url = [aDecoder decodeObjectForKey:kPropertyServicePageUrl];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	PropertyServicePage *copy = [PropertyServicePage new];

	copy.areaId = [self.areaId copy];
	copy.clubId = [self.clubId copy];
	copy.idField = [self.idField copy];
	copy.title = [self.title copy];
	copy.url = [self.url copy];

	return copy;
}
@end
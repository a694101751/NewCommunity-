//
//	StreetAreaPage.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "StreetAreaPage.h"

NSString *const kStreetAreaPageIdField = @"id";
NSString *const kStreetAreaPageName = @"name";

@interface StreetAreaPage ()
@end
@implementation StreetAreaPage




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kStreetAreaPageIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kStreetAreaPageIdField];
	}	
	if(![dictionary[kStreetAreaPageName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kStreetAreaPageName];
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
		dictionary[kStreetAreaPageIdField] = self.idField;
	}
	if(self.name != nil){
		dictionary[kStreetAreaPageName] = self.name;
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
		[aCoder encodeObject:self.idField forKey:kStreetAreaPageIdField];
	}
	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:kStreetAreaPageName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.idField = [aDecoder decodeObjectForKey:kStreetAreaPageIdField];
	self.name = [aDecoder decodeObjectForKey:kStreetAreaPageName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	StreetAreaPage *copy = [StreetAreaPage new];

	copy.idField = [self.idField copy];
	copy.name = [self.name copy];

	return copy;
}
@end
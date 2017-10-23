//
//	StayFocusedPage.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "StayFocusedPage.h"

NSString *const kStayFocusedPageIdField = @"id";
NSString *const kStayFocusedPageName = @"name";

@interface StayFocusedPage ()
@end
@implementation StayFocusedPage




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kStayFocusedPageIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kStayFocusedPageIdField];
	}	
	if(![dictionary[kStayFocusedPageName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kStayFocusedPageName];
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
		dictionary[kStayFocusedPageIdField] = self.idField;
	}
	if(self.name != nil){
		dictionary[kStayFocusedPageName] = self.name;
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
		[aCoder encodeObject:self.idField forKey:kStayFocusedPageIdField];
	}
	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:kStayFocusedPageName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.idField = [aDecoder decodeObjectForKey:kStayFocusedPageIdField];
	self.name = [aDecoder decodeObjectForKey:kStayFocusedPageName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	StayFocusedPage *copy = [StayFocusedPage new];

	copy.idField = [self.idField copy];
	copy.name = [self.name copy];

	return copy;
}
@end
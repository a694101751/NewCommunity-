//
//	SearchForInformationPostList.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "SearchForInformationPostList.h"

NSString *const kSearchForInformationPostListIdField = @"id";
NSString *const kSearchForInformationPostListTitle = @"title";

@interface SearchForInformationPostList ()
@end
@implementation SearchForInformationPostList




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kSearchForInformationPostListIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kSearchForInformationPostListIdField];
	}	
	if(![dictionary[kSearchForInformationPostListTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kSearchForInformationPostListTitle];
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
		dictionary[kSearchForInformationPostListIdField] = self.idField;
	}
	if(self.title != nil){
		dictionary[kSearchForInformationPostListTitle] = self.title;
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
		[aCoder encodeObject:self.idField forKey:kSearchForInformationPostListIdField];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:kSearchForInformationPostListTitle];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.idField = [aDecoder decodeObjectForKey:kSearchForInformationPostListIdField];
	self.title = [aDecoder decodeObjectForKey:kSearchForInformationPostListTitle];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	SearchForInformationPostList *copy = [SearchForInformationPostList new];

	copy.idField = [self.idField copy];
	copy.title = [self.title copy];

	return copy;
}
@end
//
//	GovernmentAffairsPost.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "GovernmentAffairsPost.h"

NSString *const kGovernmentAffairsPostIdField = @"id";
NSString *const kGovernmentAffairsPostThumb = @"thumb";
NSString *const kGovernmentAffairsPostTitle = @"title";

@interface GovernmentAffairsPost ()
@end
@implementation GovernmentAffairsPost




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kGovernmentAffairsPostIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kGovernmentAffairsPostIdField];
	}	
	if(![dictionary[kGovernmentAffairsPostThumb] isKindOfClass:[NSNull class]]){
		self.thumb = dictionary[kGovernmentAffairsPostThumb];
	}	
	if(![dictionary[kGovernmentAffairsPostTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kGovernmentAffairsPostTitle];
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
		dictionary[kGovernmentAffairsPostIdField] = self.idField;
	}
	if(self.thumb != nil){
		dictionary[kGovernmentAffairsPostThumb] = self.thumb;
	}
	if(self.title != nil){
		dictionary[kGovernmentAffairsPostTitle] = self.title;
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
		[aCoder encodeObject:self.idField forKey:kGovernmentAffairsPostIdField];
	}
	if(self.thumb != nil){
		[aCoder encodeObject:self.thumb forKey:kGovernmentAffairsPostThumb];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:kGovernmentAffairsPostTitle];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.idField = [aDecoder decodeObjectForKey:kGovernmentAffairsPostIdField];
	self.thumb = [aDecoder decodeObjectForKey:kGovernmentAffairsPostThumb];
	self.title = [aDecoder decodeObjectForKey:kGovernmentAffairsPostTitle];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	GovernmentAffairsPost *copy = [GovernmentAffairsPost new];

	copy.idField = [self.idField copy];
	copy.thumb = [self.thumb copy];
	copy.title = [self.title copy];

	return copy;
}
@end
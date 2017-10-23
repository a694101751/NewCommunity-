//
//	CommunityLifeDetailsModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityLifeDetailsModel.h"

NSString *const kCommunityLifeDetailsModelClubLife = @"clubLife";
NSString *const kCommunityLifeDetailsModelCode = @"code";
NSString *const kCommunityLifeDetailsModelContent = @"content";

@interface CommunityLifeDetailsModel ()
@end
@implementation CommunityLifeDetailsModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCommunityLifeDetailsModelClubLife] isKindOfClass:[NSNull class]]){
		self.clubLife = [[CommunityLifeDetailsClubLife alloc] initWithDictionary:dictionary[kCommunityLifeDetailsModelClubLife]];
	}

	if(![dictionary[kCommunityLifeDetailsModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kCommunityLifeDetailsModelCode];
	}	
	if(![dictionary[kCommunityLifeDetailsModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kCommunityLifeDetailsModelContent];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.clubLife != nil){
		dictionary[kCommunityLifeDetailsModelClubLife] = [self.clubLife toDictionary];
	}
	if(self.code != nil){
		dictionary[kCommunityLifeDetailsModelCode] = self.code;
	}
	if(self.content != nil){
		dictionary[kCommunityLifeDetailsModelContent] = self.content;
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
	if(self.clubLife != nil){
		[aCoder encodeObject:self.clubLife forKey:kCommunityLifeDetailsModelClubLife];
	}
	if(self.code != nil){
		[aCoder encodeObject:self.code forKey:kCommunityLifeDetailsModelCode];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kCommunityLifeDetailsModelContent];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.clubLife = [aDecoder decodeObjectForKey:kCommunityLifeDetailsModelClubLife];
	self.code = [aDecoder decodeObjectForKey:kCommunityLifeDetailsModelCode];
	self.content = [aDecoder decodeObjectForKey:kCommunityLifeDetailsModelContent];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityLifeDetailsModel *copy = [CommunityLifeDetailsModel new];

	copy.clubLife = [self.clubLife copy];
	copy.code = [self.code copy];
	copy.content = [self.content copy];

	return copy;
}
@end
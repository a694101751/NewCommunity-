//
//	CommunityLifeModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityLifeModel.h"

NSString *const kCommunityLifeModelCode = @"code";
NSString *const kCommunityLifeModelContent = @"content";
NSString *const kCommunityLifeModelData = @"data";
NSString *const kCommunityLifeModelNotice = @"notice";

@interface CommunityLifeModel ()
@end
@implementation CommunityLifeModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCommunityLifeModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kCommunityLifeModelCode];
	}	
	if(![dictionary[kCommunityLifeModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kCommunityLifeModelContent];
	}	
	if(![dictionary[kCommunityLifeModelData] isKindOfClass:[NSNull class]]){
		self.data = [[CommunityLifeData alloc] initWithDictionary:dictionary[kCommunityLifeModelData]];
	}

	if(![dictionary[kCommunityLifeModelNotice] isKindOfClass:[NSNull class]]){
		self.notice = dictionary[kCommunityLifeModelNotice];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.code != nil){
		dictionary[kCommunityLifeModelCode] = self.code;
	}
	if(self.content != nil){
		dictionary[kCommunityLifeModelContent] = self.content;
	}
	if(self.data != nil){
		dictionary[kCommunityLifeModelData] = [self.data toDictionary];
	}
	if(self.notice != nil){
		dictionary[kCommunityLifeModelNotice] = self.notice;
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
	if(self.code != nil){
		[aCoder encodeObject:self.code forKey:kCommunityLifeModelCode];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kCommunityLifeModelContent];
	}
	if(self.data != nil){
		[aCoder encodeObject:self.data forKey:kCommunityLifeModelData];
	}
	if(self.notice != nil){
		[aCoder encodeObject:self.notice forKey:kCommunityLifeModelNotice];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kCommunityLifeModelCode];
	self.content = [aDecoder decodeObjectForKey:kCommunityLifeModelContent];
	self.data = [aDecoder decodeObjectForKey:kCommunityLifeModelData];
	self.notice = [aDecoder decodeObjectForKey:kCommunityLifeModelNotice];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityLifeModel *copy = [CommunityLifeModel new];

	copy.code = [self.code copy];
	copy.content = [self.content copy];
	copy.data = [self.data copy];
	copy.notice = [self.notice copy];

	return copy;
}
@end
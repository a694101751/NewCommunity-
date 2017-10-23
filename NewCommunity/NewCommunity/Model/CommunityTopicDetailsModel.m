//
//	CommunityTopicDetailsModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityTopicDetailsModel.h"

NSString *const kCommunityTopicDetailsModelCode = @"code";
NSString *const kCommunityTopicDetailsModelContent = @"content";
NSString *const kCommunityTopicDetailsModelTopic = @"topic";

@interface CommunityTopicDetailsModel ()
@end
@implementation CommunityTopicDetailsModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCommunityTopicDetailsModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kCommunityTopicDetailsModelCode];
	}	
	if(![dictionary[kCommunityTopicDetailsModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kCommunityTopicDetailsModelContent];
	}	
	if(![dictionary[kCommunityTopicDetailsModelTopic] isKindOfClass:[NSNull class]]){
		self.topic = [[CommunityTopicDetailsTopic alloc] initWithDictionary:dictionary[kCommunityTopicDetailsModelTopic]];
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
		dictionary[kCommunityTopicDetailsModelCode] = self.code;
	}
	if(self.content != nil){
		dictionary[kCommunityTopicDetailsModelContent] = self.content;
	}
	if(self.topic != nil){
		dictionary[kCommunityTopicDetailsModelTopic] = [self.topic toDictionary];
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
		[aCoder encodeObject:self.code forKey:kCommunityTopicDetailsModelCode];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kCommunityTopicDetailsModelContent];
	}
	if(self.topic != nil){
		[aCoder encodeObject:self.topic forKey:kCommunityTopicDetailsModelTopic];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kCommunityTopicDetailsModelCode];
	self.content = [aDecoder decodeObjectForKey:kCommunityTopicDetailsModelContent];
	self.topic = [aDecoder decodeObjectForKey:kCommunityTopicDetailsModelTopic];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityTopicDetailsModel *copy = [CommunityTopicDetailsModel new];

	copy.code = [self.code copy];
	copy.content = [self.content copy];
	copy.topic = [self.topic copy];

	return copy;
}
@end
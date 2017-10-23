//
//	CommunityTopicDetailsTopic.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityTopicDetailsTopic.h"

NSString *const kCommunityTopicDetailsTopicAddTime = @"addTime";
NSString *const kCommunityTopicDetailsTopicClick = @"click";
NSString *const kCommunityTopicDetailsTopicContent = @"content";
NSString *const kCommunityTopicDetailsTopicIdField = @"id";
NSString *const kCommunityTopicDetailsTopicTitle = @"title";
NSString *const kCommunityTopicDetailsTopicState = @"state";
NSString *const kCommunityTopicDetailsTopicCommentSum = @"commentSum";

@interface CommunityTopicDetailsTopic ()
@end
@implementation CommunityTopicDetailsTopic




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCommunityTopicDetailsTopicAddTime] isKindOfClass:[NSNull class]]){
		self.addTime = dictionary[kCommunityTopicDetailsTopicAddTime];
	}	
	if(![dictionary[kCommunityTopicDetailsTopicClick] isKindOfClass:[NSNull class]]){
		self.click = dictionary[kCommunityTopicDetailsTopicClick];
	}	
	if(![dictionary[kCommunityTopicDetailsTopicContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kCommunityTopicDetailsTopicContent];
	}	
	if(![dictionary[kCommunityTopicDetailsTopicIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kCommunityTopicDetailsTopicIdField];
	}	
	if(![dictionary[kCommunityTopicDetailsTopicTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kCommunityTopicDetailsTopicTitle];
	}
    if(![dictionary[kCommunityTopicDetailsTopicState] isKindOfClass:[NSNull class]]){
        self.state = dictionary[kCommunityTopicDetailsTopicState];
    }
    if(![dictionary[kCommunityTopicDetailsTopicCommentSum] isKindOfClass:[NSNull class]]){
        self.commentSum = dictionary[kCommunityTopicDetailsTopicCommentSum];
    }
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.addTime != nil){
		dictionary[kCommunityTopicDetailsTopicAddTime] = self.addTime;
	}
	if(self.click != nil){
		dictionary[kCommunityTopicDetailsTopicClick] = self.click;
	}
	if(self.content != nil){
		dictionary[kCommunityTopicDetailsTopicContent] = self.content;
	}
	if(self.idField != nil){
		dictionary[kCommunityTopicDetailsTopicIdField] = self.idField;
	}
	if(self.title != nil){
		dictionary[kCommunityTopicDetailsTopicTitle] = self.title;
	}
    if(self.state != nil){
        dictionary[kCommunityTopicDetailsTopicState] = self.state;
    }
    if(self.commentSum != nil){
        dictionary[kCommunityTopicDetailsTopicCommentSum] = self.commentSum;
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
	if(self.addTime != nil){
		[aCoder encodeObject:self.addTime forKey:kCommunityTopicDetailsTopicAddTime];
	}
	if(self.click != nil){
		[aCoder encodeObject:self.click forKey:kCommunityTopicDetailsTopicClick];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kCommunityTopicDetailsTopicContent];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kCommunityTopicDetailsTopicIdField];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:kCommunityTopicDetailsTopicTitle];
	}
    if(self.state != nil){
        [aCoder encodeObject:self.state forKey:kCommunityTopicDetailsTopicState];
    }
    if(self.commentSum != nil){
        [aCoder encodeObject:self.commentSum forKey:kCommunityTopicDetailsTopicCommentSum];
    }

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.addTime = [aDecoder decodeObjectForKey:kCommunityTopicDetailsTopicAddTime];
	self.click = [aDecoder decodeObjectForKey:kCommunityTopicDetailsTopicClick];
	self.content = [aDecoder decodeObjectForKey:kCommunityTopicDetailsTopicContent];
	self.idField = [aDecoder decodeObjectForKey:kCommunityTopicDetailsTopicIdField];
	self.title = [aDecoder decodeObjectForKey:kCommunityTopicDetailsTopicTitle];
    self.state = [aDecoder decodeObjectForKey:kCommunityTopicDetailsTopicState];
    self.commentSum = [aDecoder decodeObjectForKey:kCommunityTopicDetailsTopicCommentSum];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityTopicDetailsTopic *copy = [CommunityTopicDetailsTopic new];

	copy.addTime = [self.addTime copy];
	copy.click = [self.click copy];
	copy.content = [self.content copy];
	copy.idField = [self.idField copy];
	copy.title = [self.title copy];
    copy.state = [self.state copy];
    copy.commentSum = [self.commentSum copy];

	return copy;
}
@end

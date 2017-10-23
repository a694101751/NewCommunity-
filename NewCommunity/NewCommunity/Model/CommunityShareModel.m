//
//	CommunityShareModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityShareModel.h"

NSString *const kCommunityShareModelCode = @"code";
NSString *const kCommunityShareModelContent = @"content";
NSString *const kCommunityShareModelData = @"data";
NSString *const kCommunityShareModelNotice = @"notice";

@interface CommunityShareModel ()
@end
@implementation CommunityShareModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCommunityShareModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kCommunityShareModelCode];
	}	
	if(![dictionary[kCommunityShareModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kCommunityShareModelContent];
	}	
	if(![dictionary[kCommunityShareModelData] isKindOfClass:[NSNull class]]){
		self.data = [[CommunityShareData alloc] initWithDictionary:dictionary[kCommunityShareModelData]];
	}
    if(![dictionary[kCommunityShareModelNotice] isKindOfClass:[NSNull class]]){
        self.notice = dictionary[kCommunityShareModelNotice];
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
		dictionary[kCommunityShareModelCode] = self.code;
	}
	if(self.content != nil){
		dictionary[kCommunityShareModelContent] = self.content;
	}
	if(self.data != nil){
		dictionary[kCommunityShareModelData] = [self.data toDictionary];
	}
    if(self.notice != nil){
        dictionary[kCommunityShareModelNotice] = self.notice;
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
		[aCoder encodeObject:self.code forKey:kCommunityShareModelCode];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kCommunityShareModelContent];
	}
	if(self.data != nil){
		[aCoder encodeObject:self.data forKey:kCommunityShareModelData];
	}
    if(self.notice != nil){
        [aCoder encodeObject:self.notice forKey:kCommunityShareModelNotice];
    }

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kCommunityShareModelCode];
	self.content = [aDecoder decodeObjectForKey:kCommunityShareModelContent];
	self.data = [aDecoder decodeObjectForKey:kCommunityShareModelData];
    self.notice = [aDecoder decodeObjectForKey:kCommunityShareModelNotice];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityShareModel *copy = [CommunityShareModel new];

	copy.code = [self.code copy];
	copy.content = [self.content copy];
	copy.data = [self.data copy];
    copy.notice = [self.notice copy];

	return copy;
}
@end

//
//	CommunityLifeDetailsCommentListModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityLifeDetailsCommentListModel.h"

NSString *const kCommunityLifeDetailsCommentListModelCode = @"code";
NSString *const kCommunityLifeDetailsCommentListModelContent = @"content";
NSString *const kCommunityLifeDetailsCommentListModelData = @"data";

@interface CommunityLifeDetailsCommentListModel ()
@end
@implementation CommunityLifeDetailsCommentListModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCommunityLifeDetailsCommentListModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kCommunityLifeDetailsCommentListModelCode];
	}	
	if(![dictionary[kCommunityLifeDetailsCommentListModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kCommunityLifeDetailsCommentListModelContent];
	}	
	if(![dictionary[kCommunityLifeDetailsCommentListModelData] isKindOfClass:[NSNull class]]){
		self.data = [[CommunityLifeDetailsCommentListData alloc] initWithDictionary:dictionary[kCommunityLifeDetailsCommentListModelData]];
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
		dictionary[kCommunityLifeDetailsCommentListModelCode] = self.code;
	}
	if(self.content != nil){
		dictionary[kCommunityLifeDetailsCommentListModelContent] = self.content;
	}
	if(self.data != nil){
		dictionary[kCommunityLifeDetailsCommentListModelData] = [self.data toDictionary];
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
		[aCoder encodeObject:self.code forKey:kCommunityLifeDetailsCommentListModelCode];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kCommunityLifeDetailsCommentListModelContent];
	}
	if(self.data != nil){
		[aCoder encodeObject:self.data forKey:kCommunityLifeDetailsCommentListModelData];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kCommunityLifeDetailsCommentListModelCode];
	self.content = [aDecoder decodeObjectForKey:kCommunityLifeDetailsCommentListModelContent];
	self.data = [aDecoder decodeObjectForKey:kCommunityLifeDetailsCommentListModelData];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityLifeDetailsCommentListModel *copy = [CommunityLifeDetailsCommentListModel new];

	copy.code = [self.code copy];
	copy.content = [self.content copy];
	copy.data = [self.data copy];

	return copy;
}
@end
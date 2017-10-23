//
//	AttentionCommunityPage.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "AttentionCommunityPage.h"

NSString *const kAttentionCommunityPageIdField = @"id";
NSString *const kAttentionCommunityPageName = @"name";
NSString *const kAttentionCommunityPageState = @"state";

@interface AttentionCommunityPage ()
@end
@implementation AttentionCommunityPage




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kAttentionCommunityPageIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kAttentionCommunityPageIdField];
	}	
	if(![dictionary[kAttentionCommunityPageName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kAttentionCommunityPageName];
	}	
	if(![dictionary[kAttentionCommunityPageState] isKindOfClass:[NSNull class]]){
		self.state = [dictionary[kAttentionCommunityPageState] boolValue];
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
		dictionary[kAttentionCommunityPageIdField] = self.idField;
	}
	if(self.name != nil){
		dictionary[kAttentionCommunityPageName] = self.name;
	}
	dictionary[kAttentionCommunityPageState] = @(self.state);
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
		[aCoder encodeObject:self.idField forKey:kAttentionCommunityPageIdField];
	}
	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:kAttentionCommunityPageName];
	}
	[aCoder encodeObject:@(self.state) forKey:kAttentionCommunityPageState];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.idField = [aDecoder decodeObjectForKey:kAttentionCommunityPageIdField];
	self.name = [aDecoder decodeObjectForKey:kAttentionCommunityPageName];
	self.state = [[aDecoder decodeObjectForKey:kAttentionCommunityPageState] boolValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	AttentionCommunityPage *copy = [AttentionCommunityPage new];

	copy.idField = [self.idField copy];
	copy.name = [self.name copy];
	copy.state = self.state;

	return copy;
}
@end
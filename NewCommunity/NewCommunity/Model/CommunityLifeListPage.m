//
//	CommunityLifeListPage.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityLifeListPage.h"

NSString *const kCommunityLifeListPageAddress = @"address";
NSString *const kCommunityLifeListPageAvatar = @"avatar";
NSString *const kCommunityLifeListPageClickSum = @"clickSum";
NSString *const kCommunityLifeListPageClubid = @"clubid";
NSString *const kCommunityLifeListPageCludName = @"cludName";
NSString *const kCommunityLifeListPageCommentSum = @"commentSum";
NSString *const kCommunityLifeListPageContent = @"content";
NSString *const kCommunityLifeListPageDistanceTime = @"distanceTime";
NSString *const kCommunityLifeListPageIdField = @"id";
NSString *const kCommunityLifeListPageLifeType = @"lifeType";
NSString *const kCommunityLifeListPagePhoto = @"photo";
NSString *const kCommunityLifeListPagePraiseState = @"praiseState";
NSString *const kCommunityLifeListPagePraiseSum = @"praiseSum";
NSString *const kCommunityLifeListPageShowcase = @"showcase";
NSString *const kCommunityLifeListPageThumb = @"thumb";
NSString *const kCommunityLifeListPageTitle = @"title";
NSString *const kCommunityLifeListPageUserName = @"userName";

@interface CommunityLifeListPage ()
@end
@implementation CommunityLifeListPage




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCommunityLifeListPageAddress] isKindOfClass:[NSNull class]]){
		self.address = dictionary[kCommunityLifeListPageAddress];
	}	
	if(![dictionary[kCommunityLifeListPageAvatar] isKindOfClass:[NSNull class]]){
		self.avatar = dictionary[kCommunityLifeListPageAvatar];
	}	
	if(![dictionary[kCommunityLifeListPageClickSum] isKindOfClass:[NSNull class]]){
		self.clickSum = dictionary[kCommunityLifeListPageClickSum];
	}	
	if(![dictionary[kCommunityLifeListPageClubid] isKindOfClass:[NSNull class]]){
		self.clubid = dictionary[kCommunityLifeListPageClubid];
	}	
	if(![dictionary[kCommunityLifeListPageCludName] isKindOfClass:[NSNull class]]){
		self.cludName = dictionary[kCommunityLifeListPageCludName];
	}	
	if(![dictionary[kCommunityLifeListPageCommentSum] isKindOfClass:[NSNull class]]){
		self.commentSum = dictionary[kCommunityLifeListPageCommentSum];
	}	
	if(![dictionary[kCommunityLifeListPageContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kCommunityLifeListPageContent];
	}	
	if(![dictionary[kCommunityLifeListPageDistanceTime] isKindOfClass:[NSNull class]]){
		self.distanceTime = dictionary[kCommunityLifeListPageDistanceTime];
	}	
	if(![dictionary[kCommunityLifeListPageIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kCommunityLifeListPageIdField];
	}	
	if(![dictionary[kCommunityLifeListPageLifeType] isKindOfClass:[NSNull class]]){
		self.lifeType = dictionary[kCommunityLifeListPageLifeType];
	}	
	if(dictionary[kCommunityLifeListPagePhoto] != nil && [dictionary[kCommunityLifeListPagePhoto] isKindOfClass:[NSArray class]]){
		NSArray * photoDictionaries = dictionary[kCommunityLifeListPagePhoto];
		NSMutableArray * photoItems = [NSMutableArray array];
		for(NSDictionary * photoDictionary in photoDictionaries){
			CommunityLifeListPhoto * photoItem = [[CommunityLifeListPhoto alloc] initWithDictionary:photoDictionary];
			[photoItems addObject:photoItem];
		}
		self.photo = photoItems;
	}
	if(![dictionary[kCommunityLifeListPagePraiseState] isKindOfClass:[NSNull class]]){
		self.praiseState = [dictionary[kCommunityLifeListPagePraiseState] boolValue];
	}

	if(![dictionary[kCommunityLifeListPagePraiseSum] isKindOfClass:[NSNull class]]){
		self.praiseSum = dictionary[kCommunityLifeListPagePraiseSum];
	}	
	if(![dictionary[kCommunityLifeListPageShowcase] isKindOfClass:[NSNull class]]){
		self.showcase = dictionary[kCommunityLifeListPageShowcase];
	}	
	if(![dictionary[kCommunityLifeListPageThumb] isKindOfClass:[NSNull class]]){
		self.thumb = dictionary[kCommunityLifeListPageThumb];
	}	
	if(![dictionary[kCommunityLifeListPageTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kCommunityLifeListPageTitle];
	}	
	if(![dictionary[kCommunityLifeListPageUserName] isKindOfClass:[NSNull class]]){
		self.userName = dictionary[kCommunityLifeListPageUserName];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.address != nil){
		dictionary[kCommunityLifeListPageAddress] = self.address;
	}
	if(self.avatar != nil){
		dictionary[kCommunityLifeListPageAvatar] = self.avatar;
	}
	if(self.clickSum != nil){
		dictionary[kCommunityLifeListPageClickSum] = self.clickSum;
	}
	if(self.clubid != nil){
		dictionary[kCommunityLifeListPageClubid] = self.clubid;
	}
	if(self.cludName != nil){
		dictionary[kCommunityLifeListPageCludName] = self.cludName;
	}
	if(self.commentSum != nil){
		dictionary[kCommunityLifeListPageCommentSum] = self.commentSum;
	}
	if(self.content != nil){
		dictionary[kCommunityLifeListPageContent] = self.content;
	}
	if(self.distanceTime != nil){
		dictionary[kCommunityLifeListPageDistanceTime] = self.distanceTime;
	}
	if(self.idField != nil){
		dictionary[kCommunityLifeListPageIdField] = self.idField;
	}
	if(self.lifeType != nil){
		dictionary[kCommunityLifeListPageLifeType] = self.lifeType;
	}
	if(self.photo != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(CommunityLifeListPhoto * photoElement in self.photo){
			[dictionaryElements addObject:[photoElement toDictionary]];
		}
		dictionary[kCommunityLifeListPagePhoto] = dictionaryElements;
	}
	dictionary[kCommunityLifeListPagePraiseState] = @(self.praiseState);
	if(self.praiseSum != nil){
		dictionary[kCommunityLifeListPagePraiseSum] = self.praiseSum;
	}
	if(self.showcase != nil){
		dictionary[kCommunityLifeListPageShowcase] = self.showcase;
	}
	if(self.thumb != nil){
		dictionary[kCommunityLifeListPageThumb] = self.thumb;
	}
	if(self.title != nil){
		dictionary[kCommunityLifeListPageTitle] = self.title;
	}
	if(self.userName != nil){
		dictionary[kCommunityLifeListPageUserName] = self.userName;
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
	if(self.address != nil){
		[aCoder encodeObject:self.address forKey:kCommunityLifeListPageAddress];
	}
	if(self.avatar != nil){
		[aCoder encodeObject:self.avatar forKey:kCommunityLifeListPageAvatar];
	}
	if(self.clickSum != nil){
		[aCoder encodeObject:self.clickSum forKey:kCommunityLifeListPageClickSum];
	}
	if(self.clubid != nil){
		[aCoder encodeObject:self.clubid forKey:kCommunityLifeListPageClubid];
	}
	if(self.cludName != nil){
		[aCoder encodeObject:self.cludName forKey:kCommunityLifeListPageCludName];
	}
	if(self.commentSum != nil){
		[aCoder encodeObject:self.commentSum forKey:kCommunityLifeListPageCommentSum];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kCommunityLifeListPageContent];
	}
	if(self.distanceTime != nil){
		[aCoder encodeObject:self.distanceTime forKey:kCommunityLifeListPageDistanceTime];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kCommunityLifeListPageIdField];
	}
	if(self.lifeType != nil){
		[aCoder encodeObject:self.lifeType forKey:kCommunityLifeListPageLifeType];
	}
	if(self.photo != nil){
		[aCoder encodeObject:self.photo forKey:kCommunityLifeListPagePhoto];
	}
	[aCoder encodeObject:@(self.praiseState) forKey:kCommunityLifeListPagePraiseState];	if(self.praiseSum != nil){
		[aCoder encodeObject:self.praiseSum forKey:kCommunityLifeListPagePraiseSum];
	}
	if(self.showcase != nil){
		[aCoder encodeObject:self.showcase forKey:kCommunityLifeListPageShowcase];
	}
	if(self.thumb != nil){
		[aCoder encodeObject:self.thumb forKey:kCommunityLifeListPageThumb];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:kCommunityLifeListPageTitle];
	}
	if(self.userName != nil){
		[aCoder encodeObject:self.userName forKey:kCommunityLifeListPageUserName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.address = [aDecoder decodeObjectForKey:kCommunityLifeListPageAddress];
	self.avatar = [aDecoder decodeObjectForKey:kCommunityLifeListPageAvatar];
	self.clickSum = [aDecoder decodeObjectForKey:kCommunityLifeListPageClickSum];
	self.clubid = [aDecoder decodeObjectForKey:kCommunityLifeListPageClubid];
	self.cludName = [aDecoder decodeObjectForKey:kCommunityLifeListPageCludName];
	self.commentSum = [aDecoder decodeObjectForKey:kCommunityLifeListPageCommentSum];
	self.content = [aDecoder decodeObjectForKey:kCommunityLifeListPageContent];
	self.distanceTime = [aDecoder decodeObjectForKey:kCommunityLifeListPageDistanceTime];
	self.idField = [aDecoder decodeObjectForKey:kCommunityLifeListPageIdField];
	self.lifeType = [aDecoder decodeObjectForKey:kCommunityLifeListPageLifeType];
	self.photo = [aDecoder decodeObjectForKey:kCommunityLifeListPagePhoto];
	self.praiseState = [[aDecoder decodeObjectForKey:kCommunityLifeListPagePraiseState] boolValue];
	self.praiseSum = [aDecoder decodeObjectForKey:kCommunityLifeListPagePraiseSum];
	self.showcase = [aDecoder decodeObjectForKey:kCommunityLifeListPageShowcase];
	self.thumb = [aDecoder decodeObjectForKey:kCommunityLifeListPageThumb];
	self.title = [aDecoder decodeObjectForKey:kCommunityLifeListPageTitle];
	self.userName = [aDecoder decodeObjectForKey:kCommunityLifeListPageUserName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityLifeListPage *copy = [CommunityLifeListPage new];

	copy.address = [self.address copy];
	copy.avatar = [self.avatar copy];
	copy.clickSum = [self.clickSum copy];
	copy.clubid = [self.clubid copy];
	copy.cludName = [self.cludName copy];
	copy.commentSum = [self.commentSum copy];
	copy.content = [self.content copy];
	copy.distanceTime = [self.distanceTime copy];
	copy.idField = [self.idField copy];
	copy.lifeType = [self.lifeType copy];
	copy.photo = [self.photo copy];
	copy.praiseState = self.praiseState;
	copy.praiseSum = [self.praiseSum copy];
	copy.showcase = [self.showcase copy];
	copy.thumb = [self.thumb copy];
	copy.title = [self.title copy];
	copy.userName = [self.userName copy];

	return copy;
}
@end
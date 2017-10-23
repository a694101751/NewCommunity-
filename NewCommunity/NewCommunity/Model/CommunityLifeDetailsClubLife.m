//
//	CommunityLifeDetailsClubLife.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityLifeDetailsClubLife.h"

NSString *const kCommunityLifeDetailsClubLifeAddTime = @"addTime";
NSString *const kCommunityLifeDetailsClubLifeAddress = @"address";
NSString *const kCommunityLifeDetailsClubLifeClick = @"click";
NSString *const kCommunityLifeDetailsClubLifeClubid = @"clubid";
NSString *const kCommunityLifeDetailsClubLifeCludName = @"cludName";
NSString *const kCommunityLifeDetailsClubLifeCommentSum = @"commentSum";
NSString *const kCommunityLifeDetailsClubLifeContent = @"content";
NSString *const kCommunityLifeDetailsClubLifeDistanceTime = @"distanceTime";
NSString *const kCommunityLifeDetailsClubLifeIdField = @"id";
NSString *const kCommunityLifeDetailsClubLifeLifeType = @"lifeType";
NSString *const kCommunityLifeDetailsClubLifeMobile = @"mobile";
NSString *const kCommunityLifeDetailsClubLifePhoto = @"photo";
NSString *const kCommunityLifeDetailsClubLifePraiseState = @"praiseState";
NSString *const kCommunityLifeDetailsClubLifePraiseSum = @"praiseSum";
NSString *const kCommunityLifeDetailsClubLifeThumb = @"thumb";
NSString *const kCommunityLifeDetailsClubLifeTitle = @"title";
NSString *const kCommunityLifeDetailsClubLifeUserName = @"userName";
NSString *const kCommunityLifeDetailsClubLifeUserthumb = @"userthumb";

@interface CommunityLifeDetailsClubLife ()
@end
@implementation CommunityLifeDetailsClubLife




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCommunityLifeDetailsClubLifeAddTime] isKindOfClass:[NSNull class]]){
		self.addTime = dictionary[kCommunityLifeDetailsClubLifeAddTime];
	}	
	if(![dictionary[kCommunityLifeDetailsClubLifeAddress] isKindOfClass:[NSNull class]]){
		self.address = dictionary[kCommunityLifeDetailsClubLifeAddress];
	}	
	if(![dictionary[kCommunityLifeDetailsClubLifeClick] isKindOfClass:[NSNull class]]){
		self.click = dictionary[kCommunityLifeDetailsClubLifeClick];
	}	
	if(![dictionary[kCommunityLifeDetailsClubLifeClubid] isKindOfClass:[NSNull class]]){
		self.clubid = dictionary[kCommunityLifeDetailsClubLifeClubid];
	}	
	if(![dictionary[kCommunityLifeDetailsClubLifeCludName] isKindOfClass:[NSNull class]]){
		self.cludName = dictionary[kCommunityLifeDetailsClubLifeCludName];
	}	
	if(![dictionary[kCommunityLifeDetailsClubLifeCommentSum] isKindOfClass:[NSNull class]]){
		self.commentSum = dictionary[kCommunityLifeDetailsClubLifeCommentSum];
	}	
	if(![dictionary[kCommunityLifeDetailsClubLifeContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kCommunityLifeDetailsClubLifeContent];
	}	
	if(![dictionary[kCommunityLifeDetailsClubLifeDistanceTime] isKindOfClass:[NSNull class]]){
		self.distanceTime = dictionary[kCommunityLifeDetailsClubLifeDistanceTime];
	}	
	if(![dictionary[kCommunityLifeDetailsClubLifeIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kCommunityLifeDetailsClubLifeIdField];
	}	
	if(![dictionary[kCommunityLifeDetailsClubLifeLifeType] isKindOfClass:[NSNull class]]){
		self.lifeType = dictionary[kCommunityLifeDetailsClubLifeLifeType];
	}	
	if(![dictionary[kCommunityLifeDetailsClubLifeMobile] isKindOfClass:[NSNull class]]){
		self.mobile = dictionary[kCommunityLifeDetailsClubLifeMobile];
	}	
	if(dictionary[kCommunityLifeDetailsClubLifePhoto] != nil && [dictionary[kCommunityLifeDetailsClubLifePhoto] isKindOfClass:[NSArray class]]){
		NSArray * photoDictionaries = dictionary[kCommunityLifeDetailsClubLifePhoto];
		NSMutableArray * photoItems = [NSMutableArray array];
		for(NSDictionary * photoDictionary in photoDictionaries){
			CommunityLifeDetailsPhoto * photoItem = [[CommunityLifeDetailsPhoto alloc] initWithDictionary:photoDictionary];
			[photoItems addObject:photoItem];
		}
		self.photo = photoItems;
	}
	if(![dictionary[kCommunityLifeDetailsClubLifePraiseState] isKindOfClass:[NSNull class]]){
		self.praiseState = [dictionary[kCommunityLifeDetailsClubLifePraiseState] boolValue];
	}

	if(![dictionary[kCommunityLifeDetailsClubLifePraiseSum] isKindOfClass:[NSNull class]]){
		self.praiseSum = dictionary[kCommunityLifeDetailsClubLifePraiseSum];
	}	
	if(![dictionary[kCommunityLifeDetailsClubLifeThumb] isKindOfClass:[NSNull class]]){
		self.thumb = dictionary[kCommunityLifeDetailsClubLifeThumb];
	}	
	if(![dictionary[kCommunityLifeDetailsClubLifeTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kCommunityLifeDetailsClubLifeTitle];
	}	
	if(![dictionary[kCommunityLifeDetailsClubLifeUserName] isKindOfClass:[NSNull class]]){
		self.userName = dictionary[kCommunityLifeDetailsClubLifeUserName];
	}	
	if(![dictionary[kCommunityLifeDetailsClubLifeUserthumb] isKindOfClass:[NSNull class]]){
		self.userthumb = dictionary[kCommunityLifeDetailsClubLifeUserthumb];
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
		dictionary[kCommunityLifeDetailsClubLifeAddTime] = self.addTime;
	}
	if(self.address != nil){
		dictionary[kCommunityLifeDetailsClubLifeAddress] = self.address;
	}
	if(self.click != nil){
		dictionary[kCommunityLifeDetailsClubLifeClick] = self.click;
	}
	if(self.clubid != nil){
		dictionary[kCommunityLifeDetailsClubLifeClubid] = self.clubid;
	}
	if(self.cludName != nil){
		dictionary[kCommunityLifeDetailsClubLifeCludName] = self.cludName;
	}
	if(self.commentSum != nil){
		dictionary[kCommunityLifeDetailsClubLifeCommentSum] = self.commentSum;
	}
	if(self.content != nil){
		dictionary[kCommunityLifeDetailsClubLifeContent] = self.content;
	}
	if(self.distanceTime != nil){
		dictionary[kCommunityLifeDetailsClubLifeDistanceTime] = self.distanceTime;
	}
	if(self.idField != nil){
		dictionary[kCommunityLifeDetailsClubLifeIdField] = self.idField;
	}
	if(self.lifeType != nil){
		dictionary[kCommunityLifeDetailsClubLifeLifeType] = self.lifeType;
	}
	if(self.mobile != nil){
		dictionary[kCommunityLifeDetailsClubLifeMobile] = self.mobile;
	}
	if(self.photo != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(CommunityLifeDetailsPhoto * photoElement in self.photo){
			[dictionaryElements addObject:[photoElement toDictionary]];
		}
		dictionary[kCommunityLifeDetailsClubLifePhoto] = dictionaryElements;
	}
	dictionary[kCommunityLifeDetailsClubLifePraiseState] = @(self.praiseState);
	if(self.praiseSum != nil){
		dictionary[kCommunityLifeDetailsClubLifePraiseSum] = self.praiseSum;
	}
	if(self.thumb != nil){
		dictionary[kCommunityLifeDetailsClubLifeThumb] = self.thumb;
	}
	if(self.title != nil){
		dictionary[kCommunityLifeDetailsClubLifeTitle] = self.title;
	}
	if(self.userName != nil){
		dictionary[kCommunityLifeDetailsClubLifeUserName] = self.userName;
	}
	if(self.userthumb != nil){
		dictionary[kCommunityLifeDetailsClubLifeUserthumb] = self.userthumb;
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
		[aCoder encodeObject:self.addTime forKey:kCommunityLifeDetailsClubLifeAddTime];
	}
	if(self.address != nil){
		[aCoder encodeObject:self.address forKey:kCommunityLifeDetailsClubLifeAddress];
	}
	if(self.click != nil){
		[aCoder encodeObject:self.click forKey:kCommunityLifeDetailsClubLifeClick];
	}
	if(self.clubid != nil){
		[aCoder encodeObject:self.clubid forKey:kCommunityLifeDetailsClubLifeClubid];
	}
	if(self.cludName != nil){
		[aCoder encodeObject:self.cludName forKey:kCommunityLifeDetailsClubLifeCludName];
	}
	if(self.commentSum != nil){
		[aCoder encodeObject:self.commentSum forKey:kCommunityLifeDetailsClubLifeCommentSum];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kCommunityLifeDetailsClubLifeContent];
	}
	if(self.distanceTime != nil){
		[aCoder encodeObject:self.distanceTime forKey:kCommunityLifeDetailsClubLifeDistanceTime];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kCommunityLifeDetailsClubLifeIdField];
	}
	if(self.lifeType != nil){
		[aCoder encodeObject:self.lifeType forKey:kCommunityLifeDetailsClubLifeLifeType];
	}
	if(self.mobile != nil){
		[aCoder encodeObject:self.mobile forKey:kCommunityLifeDetailsClubLifeMobile];
	}
	if(self.photo != nil){
		[aCoder encodeObject:self.photo forKey:kCommunityLifeDetailsClubLifePhoto];
	}
	[aCoder encodeObject:@(self.praiseState) forKey:kCommunityLifeDetailsClubLifePraiseState];	if(self.praiseSum != nil){
		[aCoder encodeObject:self.praiseSum forKey:kCommunityLifeDetailsClubLifePraiseSum];
	}
	if(self.thumb != nil){
		[aCoder encodeObject:self.thumb forKey:kCommunityLifeDetailsClubLifeThumb];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:kCommunityLifeDetailsClubLifeTitle];
	}
	if(self.userName != nil){
		[aCoder encodeObject:self.userName forKey:kCommunityLifeDetailsClubLifeUserName];
	}
	if(self.userthumb != nil){
		[aCoder encodeObject:self.userthumb forKey:kCommunityLifeDetailsClubLifeUserthumb];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.addTime = [aDecoder decodeObjectForKey:kCommunityLifeDetailsClubLifeAddTime];
	self.address = [aDecoder decodeObjectForKey:kCommunityLifeDetailsClubLifeAddress];
	self.click = [aDecoder decodeObjectForKey:kCommunityLifeDetailsClubLifeClick];
	self.clubid = [aDecoder decodeObjectForKey:kCommunityLifeDetailsClubLifeClubid];
	self.cludName = [aDecoder decodeObjectForKey:kCommunityLifeDetailsClubLifeCludName];
	self.commentSum = [aDecoder decodeObjectForKey:kCommunityLifeDetailsClubLifeCommentSum];
	self.content = [aDecoder decodeObjectForKey:kCommunityLifeDetailsClubLifeContent];
	self.distanceTime = [aDecoder decodeObjectForKey:kCommunityLifeDetailsClubLifeDistanceTime];
	self.idField = [aDecoder decodeObjectForKey:kCommunityLifeDetailsClubLifeIdField];
	self.lifeType = [aDecoder decodeObjectForKey:kCommunityLifeDetailsClubLifeLifeType];
	self.mobile = [aDecoder decodeObjectForKey:kCommunityLifeDetailsClubLifeMobile];
	self.photo = [aDecoder decodeObjectForKey:kCommunityLifeDetailsClubLifePhoto];
	self.praiseState = [[aDecoder decodeObjectForKey:kCommunityLifeDetailsClubLifePraiseState] boolValue];
	self.praiseSum = [aDecoder decodeObjectForKey:kCommunityLifeDetailsClubLifePraiseSum];
	self.thumb = [aDecoder decodeObjectForKey:kCommunityLifeDetailsClubLifeThumb];
	self.title = [aDecoder decodeObjectForKey:kCommunityLifeDetailsClubLifeTitle];
	self.userName = [aDecoder decodeObjectForKey:kCommunityLifeDetailsClubLifeUserName];
	self.userthumb = [aDecoder decodeObjectForKey:kCommunityLifeDetailsClubLifeUserthumb];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityLifeDetailsClubLife *copy = [CommunityLifeDetailsClubLife new];

	copy.addTime = [self.addTime copy];
	copy.address = [self.address copy];
	copy.click = [self.click copy];
	copy.clubid = [self.clubid copy];
	copy.cludName = [self.cludName copy];
	copy.commentSum = [self.commentSum copy];
	copy.content = [self.content copy];
	copy.distanceTime = [self.distanceTime copy];
	copy.idField = [self.idField copy];
	copy.lifeType = [self.lifeType copy];
	copy.mobile = [self.mobile copy];
	copy.photo = [self.photo copy];
	copy.praiseState = self.praiseState;
	copy.praiseSum = [self.praiseSum copy];
	copy.thumb = [self.thumb copy];
	copy.title = [self.title copy];
	copy.userName = [self.userName copy];
	copy.userthumb = [self.userthumb copy];

	return copy;
}
@end
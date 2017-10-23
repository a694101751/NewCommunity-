//
//	CommunityLifePostList.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityLifePostList.h"

NSString *const kCommunityLifePostListAddress = @"address";
NSString *const kCommunityLifePostListClick = @"click";
NSString *const kCommunityLifePostListClubid = @"clubid";
NSString *const kCommunityLifePostListCludName = @"cludName";
NSString *const kCommunityLifePostListCommentSum = @"commentSum";
NSString *const kCommunityLifePostListContent = @"content";
NSString *const kCommunityLifePostListDistanceTime = @"distanceTime";
NSString *const kCommunityLifePostListIdField = @"id";
NSString *const kCommunityLifePostListPhoto = @"photo";
NSString *const kCommunityLifePostListPraiseState = @"praiseState";
NSString *const kCommunityLifePostListPraiseSum = @"praiseSum";
NSString *const kCommunityLifePostListShowcase = @"showcase";
NSString *const kCommunityLifePostListThumb = @"thumb";
NSString *const kCommunityLifePostListTitle = @"title";
NSString *const kCommunityLifePostListUserName = @"userName";
NSString *const kCommunityLifePostListAvatar = @"avatar";

@interface CommunityLifePostList ()
@end
@implementation CommunityLifePostList




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCommunityLifePostListAddress] isKindOfClass:[NSNull class]]){
		self.address = dictionary[kCommunityLifePostListAddress];
	}	
	if(![dictionary[kCommunityLifePostListClick] isKindOfClass:[NSNull class]]){
		self.click = dictionary[kCommunityLifePostListClick];
	}	
	if(![dictionary[kCommunityLifePostListClubid] isKindOfClass:[NSNull class]]){
		self.clubid = dictionary[kCommunityLifePostListClubid];
	}	
	if(![dictionary[kCommunityLifePostListCludName] isKindOfClass:[NSNull class]]){
		self.cludName = dictionary[kCommunityLifePostListCludName];
	}	
	if(![dictionary[kCommunityLifePostListCommentSum] isKindOfClass:[NSNull class]]){
		self.commentSum = dictionary[kCommunityLifePostListCommentSum];
	}	
	if(![dictionary[kCommunityLifePostListContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kCommunityLifePostListContent];
	}	
	if(![dictionary[kCommunityLifePostListDistanceTime] isKindOfClass:[NSNull class]]){
		self.distanceTime = dictionary[kCommunityLifePostListDistanceTime];
	}	
	if(![dictionary[kCommunityLifePostListIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kCommunityLifePostListIdField];
	}
    if(![dictionary[kCommunityLifePostListAvatar] isKindOfClass:[NSNull class]]){
        self.avatar = dictionary[kCommunityLifePostListAvatar];
    }
	if(dictionary[kCommunityLifePostListPhoto] != nil && [dictionary[kCommunityLifePostListPhoto] isKindOfClass:[NSArray class]]){
		NSArray * photoDictionaries = dictionary[kCommunityLifePostListPhoto];
		NSMutableArray * photoItems = [NSMutableArray array];
		for(NSDictionary * photoDictionary in photoDictionaries){
			CommunityLifePhoto * photoItem = [[CommunityLifePhoto alloc] initWithDictionary:photoDictionary];
			[photoItems addObject:photoItem];
		}
		self.photo = photoItems;
	}
	if(![dictionary[kCommunityLifePostListPraiseState] isKindOfClass:[NSNull class]]){
		self.praiseState = [dictionary[kCommunityLifePostListPraiseState] boolValue];
	}

	if(![dictionary[kCommunityLifePostListPraiseSum] isKindOfClass:[NSNull class]]){
		self.praiseSum = dictionary[kCommunityLifePostListPraiseSum];
	}	
	if(![dictionary[kCommunityLifePostListShowcase] isKindOfClass:[NSNull class]]){
		self.showcase = dictionary[kCommunityLifePostListShowcase];
	}	
	if(![dictionary[kCommunityLifePostListThumb] isKindOfClass:[NSNull class]]){
		self.thumb = dictionary[kCommunityLifePostListThumb];
	}	
	if(![dictionary[kCommunityLifePostListTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kCommunityLifePostListTitle];
	}	
	if(![dictionary[kCommunityLifePostListUserName] isKindOfClass:[NSNull class]]){
		self.userName = dictionary[kCommunityLifePostListUserName];
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
		dictionary[kCommunityLifePostListAddress] = self.address;
	}
	if(self.click != nil){
		dictionary[kCommunityLifePostListClick] = self.click;
	}
	if(self.clubid != nil){
		dictionary[kCommunityLifePostListClubid] = self.clubid;
	}
	if(self.cludName != nil){
		dictionary[kCommunityLifePostListCludName] = self.cludName;
	}
	if(self.commentSum != nil){
		dictionary[kCommunityLifePostListCommentSum] = self.commentSum;
	}
	if(self.content != nil){
		dictionary[kCommunityLifePostListContent] = self.content;
	}
	if(self.distanceTime != nil){
		dictionary[kCommunityLifePostListDistanceTime] = self.distanceTime;
	}
	if(self.idField != nil){
		dictionary[kCommunityLifePostListIdField] = self.idField;
	}
	if(self.photo != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(CommunityLifePhoto * photoElement in self.photo){
			[dictionaryElements addObject:[photoElement toDictionary]];
		}
		dictionary[kCommunityLifePostListPhoto] = dictionaryElements;
	}
	dictionary[kCommunityLifePostListPraiseState] = @(self.praiseState);
	if(self.praiseSum != nil){
		dictionary[kCommunityLifePostListPraiseSum] = self.praiseSum;
	}
	if(self.showcase != nil){
		dictionary[kCommunityLifePostListShowcase] = self.showcase;
	}
	if(self.thumb != nil){
		dictionary[kCommunityLifePostListThumb] = self.thumb;
	}
	if(self.title != nil){
		dictionary[kCommunityLifePostListTitle] = self.title;
	}
	if(self.userName != nil){
		dictionary[kCommunityLifePostListUserName] = self.userName;
	}
    if(self.avatar != nil){
        dictionary[kCommunityLifePostListAvatar] = self.avatar;
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
		[aCoder encodeObject:self.address forKey:kCommunityLifePostListAddress];
	}
	if(self.click != nil){
		[aCoder encodeObject:self.click forKey:kCommunityLifePostListClick];
	}
	if(self.clubid != nil){
		[aCoder encodeObject:self.clubid forKey:kCommunityLifePostListClubid];
	}
	if(self.cludName != nil){
		[aCoder encodeObject:self.cludName forKey:kCommunityLifePostListCludName];
	}
	if(self.commentSum != nil){
		[aCoder encodeObject:self.commentSum forKey:kCommunityLifePostListCommentSum];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kCommunityLifePostListContent];
	}
	if(self.distanceTime != nil){
		[aCoder encodeObject:self.distanceTime forKey:kCommunityLifePostListDistanceTime];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kCommunityLifePostListIdField];
	}
	if(self.photo != nil){
		[aCoder encodeObject:self.photo forKey:kCommunityLifePostListPhoto];
	}
	[aCoder encodeObject:@(self.praiseState) forKey:kCommunityLifePostListPraiseState];	if(self.praiseSum != nil){
		[aCoder encodeObject:self.praiseSum forKey:kCommunityLifePostListPraiseSum];
	}
	if(self.showcase != nil){
		[aCoder encodeObject:self.showcase forKey:kCommunityLifePostListShowcase];
	}
	if(self.thumb != nil){
		[aCoder encodeObject:self.thumb forKey:kCommunityLifePostListThumb];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:kCommunityLifePostListTitle];
	}
    if(self.avatar != nil){
        [aCoder encodeObject:self.avatar forKey:kCommunityLifePostListAvatar];
    }
	if(self.userName != nil){
		[aCoder encodeObject:self.userName forKey:kCommunityLifePostListUserName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.address = [aDecoder decodeObjectForKey:kCommunityLifePostListAddress];
	self.click = [aDecoder decodeObjectForKey:kCommunityLifePostListClick];
	self.clubid = [aDecoder decodeObjectForKey:kCommunityLifePostListClubid];
	self.cludName = [aDecoder decodeObjectForKey:kCommunityLifePostListCludName];
	self.commentSum = [aDecoder decodeObjectForKey:kCommunityLifePostListCommentSum];
	self.content = [aDecoder decodeObjectForKey:kCommunityLifePostListContent];
	self.distanceTime = [aDecoder decodeObjectForKey:kCommunityLifePostListDistanceTime];
	self.idField = [aDecoder decodeObjectForKey:kCommunityLifePostListIdField];
	self.photo = [aDecoder decodeObjectForKey:kCommunityLifePostListPhoto];
	self.praiseState = [[aDecoder decodeObjectForKey:kCommunityLifePostListPraiseState] boolValue];
	self.praiseSum = [aDecoder decodeObjectForKey:kCommunityLifePostListPraiseSum];
	self.showcase = [aDecoder decodeObjectForKey:kCommunityLifePostListShowcase];
	self.thumb = [aDecoder decodeObjectForKey:kCommunityLifePostListThumb];
	self.title = [aDecoder decodeObjectForKey:kCommunityLifePostListTitle];
	self.userName = [aDecoder decodeObjectForKey:kCommunityLifePostListUserName];
    self.avatar = [aDecoder decodeObjectForKey:kCommunityLifePostListAvatar];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityLifePostList *copy = [CommunityLifePostList new];

	copy.address = [self.address copy];
	copy.click = [self.click copy];
	copy.clubid = [self.clubid copy];
	copy.cludName = [self.cludName copy];
	copy.commentSum = [self.commentSum copy];
	copy.content = [self.content copy];
	copy.distanceTime = [self.distanceTime copy];
	copy.idField = [self.idField copy];
	copy.photo = [self.photo copy];
	copy.praiseState = self.praiseState;
	copy.praiseSum = [self.praiseSum copy];
	copy.showcase = [self.showcase copy];
	copy.thumb = [self.thumb copy];
	copy.title = [self.title copy];
	copy.userName = [self.userName copy];
    copy.avatar = [self.avatar copy];

	return copy;
}
@end

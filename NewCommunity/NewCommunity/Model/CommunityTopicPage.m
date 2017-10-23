//
//	CommunityTopicPage.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityTopicPage.h"

NSString *const kCommunityTopicPageClick = @"click";
NSString *const kCommunityTopicPageClubId = @"clubId";
NSString *const kCommunityTopicPageClubid = @"clubid";
NSString *const kCommunityTopicPageCommentSum = @"commentSum";
NSString *const kCommunityTopicPageContent = @"content";
NSString *const kCommunityTopicPageIdField = @"id";
NSString *const kCommunityTopicPagePhoto = @"photo";
NSString *const kCommunityTopicPageRareaId = @"rareaId";
NSString *const kCommunityTopicPageShowcase = @"showcase";
NSString *const kCommunityTopicPageThumb = @"thumb";
NSString *const kCommunityTopicPageTitle = @"title";

@interface CommunityTopicPage ()
@end
@implementation CommunityTopicPage




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCommunityTopicPageClick] isKindOfClass:[NSNull class]]){
		self.click = dictionary[kCommunityTopicPageClick];
	}	
	if(![dictionary[kCommunityTopicPageClubId] isKindOfClass:[NSNull class]]){
		self.clubId = dictionary[kCommunityTopicPageClubId];
	}	
	if(![dictionary[kCommunityTopicPageClubid] isKindOfClass:[NSNull class]]){
		self.clubid = dictionary[kCommunityTopicPageClubid];
	}	
	if(![dictionary[kCommunityTopicPageCommentSum] isKindOfClass:[NSNull class]]){
		self.commentSum = dictionary[kCommunityTopicPageCommentSum];
	}	
	if(![dictionary[kCommunityTopicPageContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kCommunityTopicPageContent];
	}	
	if(![dictionary[kCommunityTopicPageIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kCommunityTopicPageIdField];
	}	
	if(![dictionary[kCommunityTopicPagePhoto] isKindOfClass:[NSNull class]]){
		self.photo = dictionary[kCommunityTopicPagePhoto];
	}	
	if(![dictionary[kCommunityTopicPageRareaId] isKindOfClass:[NSNull class]]){
		self.rareaId = dictionary[kCommunityTopicPageRareaId];
	}	
	if(![dictionary[kCommunityTopicPageShowcase] isKindOfClass:[NSNull class]]){
		self.showcase = dictionary[kCommunityTopicPageShowcase];
	}	
	if(![dictionary[kCommunityTopicPageThumb] isKindOfClass:[NSNull class]]){
		self.thumb = dictionary[kCommunityTopicPageThumb];
	}	
	if(![dictionary[kCommunityTopicPageTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kCommunityTopicPageTitle];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.click != nil){
		dictionary[kCommunityTopicPageClick] = self.click;
	}
	if(self.clubId != nil){
		dictionary[kCommunityTopicPageClubId] = self.clubId;
	}
	if(self.clubid != nil){
		dictionary[kCommunityTopicPageClubid] = self.clubid;
	}
	if(self.commentSum != nil){
		dictionary[kCommunityTopicPageCommentSum] = self.commentSum;
	}
	if(self.content != nil){
		dictionary[kCommunityTopicPageContent] = self.content;
	}
	if(self.idField != nil){
		dictionary[kCommunityTopicPageIdField] = self.idField;
	}
	if(self.photo != nil){
		dictionary[kCommunityTopicPagePhoto] = self.photo;
	}
	if(self.rareaId != nil){
		dictionary[kCommunityTopicPageRareaId] = self.rareaId;
	}
	if(self.showcase != nil){
		dictionary[kCommunityTopicPageShowcase] = self.showcase;
	}
	if(self.thumb != nil){
		dictionary[kCommunityTopicPageThumb] = self.thumb;
	}
	if(self.title != nil){
		dictionary[kCommunityTopicPageTitle] = self.title;
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
	if(self.click != nil){
		[aCoder encodeObject:self.click forKey:kCommunityTopicPageClick];
	}
	if(self.clubId != nil){
		[aCoder encodeObject:self.clubId forKey:kCommunityTopicPageClubId];
	}
	if(self.clubid != nil){
		[aCoder encodeObject:self.clubid forKey:kCommunityTopicPageClubid];
	}
	if(self.commentSum != nil){
		[aCoder encodeObject:self.commentSum forKey:kCommunityTopicPageCommentSum];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kCommunityTopicPageContent];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kCommunityTopicPageIdField];
	}
	if(self.photo != nil){
		[aCoder encodeObject:self.photo forKey:kCommunityTopicPagePhoto];
	}
	if(self.rareaId != nil){
		[aCoder encodeObject:self.rareaId forKey:kCommunityTopicPageRareaId];
	}
	if(self.showcase != nil){
		[aCoder encodeObject:self.showcase forKey:kCommunityTopicPageShowcase];
	}
	if(self.thumb != nil){
		[aCoder encodeObject:self.thumb forKey:kCommunityTopicPageThumb];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:kCommunityTopicPageTitle];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.click = [aDecoder decodeObjectForKey:kCommunityTopicPageClick];
	self.clubId = [aDecoder decodeObjectForKey:kCommunityTopicPageClubId];
	self.clubid = [aDecoder decodeObjectForKey:kCommunityTopicPageClubid];
	self.commentSum = [aDecoder decodeObjectForKey:kCommunityTopicPageCommentSum];
	self.content = [aDecoder decodeObjectForKey:kCommunityTopicPageContent];
	self.idField = [aDecoder decodeObjectForKey:kCommunityTopicPageIdField];
	self.photo = [aDecoder decodeObjectForKey:kCommunityTopicPagePhoto];
	self.rareaId = [aDecoder decodeObjectForKey:kCommunityTopicPageRareaId];
	self.showcase = [aDecoder decodeObjectForKey:kCommunityTopicPageShowcase];
	self.thumb = [aDecoder decodeObjectForKey:kCommunityTopicPageThumb];
	self.title = [aDecoder decodeObjectForKey:kCommunityTopicPageTitle];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityTopicPage *copy = [CommunityTopicPage new];

	copy.click = [self.click copy];
	copy.clubId = [self.clubId copy];
	copy.clubid = [self.clubid copy];
	copy.commentSum = [self.commentSum copy];
	copy.content = [self.content copy];
	copy.idField = [self.idField copy];
	copy.photo = [self.photo copy];
	copy.rareaId = [self.rareaId copy];
	copy.showcase = [self.showcase copy];
	copy.thumb = [self.thumb copy];
	copy.title = [self.title copy];

	return copy;
}
@end
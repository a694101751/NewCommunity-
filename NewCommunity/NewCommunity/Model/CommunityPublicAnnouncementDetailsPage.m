//
//	CommunityPublicAnnouncementDetailsPage.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CommunityPublicAnnouncementDetailsPage.h"

NSString *const kCommunityPublicAnnouncementDetailsPageAddTime = @"addTime";
NSString *const kCommunityPublicAnnouncementDetailsPageClick = @"click";
NSString *const kCommunityPublicAnnouncementDetailsPageClubid = @"clubid";
NSString *const kCommunityPublicAnnouncementDetailsPageContent = @"content";
NSString *const kCommunityPublicAnnouncementDetailsPageIdField = @"id";
NSString *const kCommunityPublicAnnouncementDetailsPageThumb = @"thumb";
NSString *const kCommunityPublicAnnouncementDetailsPageTitle = @"title";

@interface CommunityPublicAnnouncementDetailsPage ()
@end
@implementation CommunityPublicAnnouncementDetailsPage




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCommunityPublicAnnouncementDetailsPageAddTime] isKindOfClass:[NSNull class]]){
		self.addTime = dictionary[kCommunityPublicAnnouncementDetailsPageAddTime];
	}	
	if(![dictionary[kCommunityPublicAnnouncementDetailsPageClick] isKindOfClass:[NSNull class]]){
		self.click = dictionary[kCommunityPublicAnnouncementDetailsPageClick];
	}	
	if(![dictionary[kCommunityPublicAnnouncementDetailsPageClubid] isKindOfClass:[NSNull class]]){
		self.clubid = dictionary[kCommunityPublicAnnouncementDetailsPageClubid];
	}	
	if(![dictionary[kCommunityPublicAnnouncementDetailsPageContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kCommunityPublicAnnouncementDetailsPageContent];
	}	
	if(![dictionary[kCommunityPublicAnnouncementDetailsPageIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kCommunityPublicAnnouncementDetailsPageIdField];
	}	
	if(![dictionary[kCommunityPublicAnnouncementDetailsPageThumb] isKindOfClass:[NSNull class]]){
		self.thumb = dictionary[kCommunityPublicAnnouncementDetailsPageThumb];
	}	
	if(![dictionary[kCommunityPublicAnnouncementDetailsPageTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kCommunityPublicAnnouncementDetailsPageTitle];
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
		dictionary[kCommunityPublicAnnouncementDetailsPageAddTime] = self.addTime;
	}
	if(self.click != nil){
		dictionary[kCommunityPublicAnnouncementDetailsPageClick] = self.click;
	}
	if(self.clubid != nil){
		dictionary[kCommunityPublicAnnouncementDetailsPageClubid] = self.clubid;
	}
	if(self.content != nil){
		dictionary[kCommunityPublicAnnouncementDetailsPageContent] = self.content;
	}
	if(self.idField != nil){
		dictionary[kCommunityPublicAnnouncementDetailsPageIdField] = self.idField;
	}
	if(self.thumb != nil){
		dictionary[kCommunityPublicAnnouncementDetailsPageThumb] = self.thumb;
	}
	if(self.title != nil){
		dictionary[kCommunityPublicAnnouncementDetailsPageTitle] = self.title;
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
		[aCoder encodeObject:self.addTime forKey:kCommunityPublicAnnouncementDetailsPageAddTime];
	}
	if(self.click != nil){
		[aCoder encodeObject:self.click forKey:kCommunityPublicAnnouncementDetailsPageClick];
	}
	if(self.clubid != nil){
		[aCoder encodeObject:self.clubid forKey:kCommunityPublicAnnouncementDetailsPageClubid];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kCommunityPublicAnnouncementDetailsPageContent];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kCommunityPublicAnnouncementDetailsPageIdField];
	}
	if(self.thumb != nil){
		[aCoder encodeObject:self.thumb forKey:kCommunityPublicAnnouncementDetailsPageThumb];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:kCommunityPublicAnnouncementDetailsPageTitle];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.addTime = [aDecoder decodeObjectForKey:kCommunityPublicAnnouncementDetailsPageAddTime];
	self.click = [aDecoder decodeObjectForKey:kCommunityPublicAnnouncementDetailsPageClick];
	self.clubid = [aDecoder decodeObjectForKey:kCommunityPublicAnnouncementDetailsPageClubid];
	self.content = [aDecoder decodeObjectForKey:kCommunityPublicAnnouncementDetailsPageContent];
	self.idField = [aDecoder decodeObjectForKey:kCommunityPublicAnnouncementDetailsPageIdField];
	self.thumb = [aDecoder decodeObjectForKey:kCommunityPublicAnnouncementDetailsPageThumb];
	self.title = [aDecoder decodeObjectForKey:kCommunityPublicAnnouncementDetailsPageTitle];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CommunityPublicAnnouncementDetailsPage *copy = [CommunityPublicAnnouncementDetailsPage new];

	copy.addTime = [self.addTime copy];
	copy.click = [self.click copy];
	copy.clubid = [self.clubid copy];
	copy.content = [self.content copy];
	copy.idField = [self.idField copy];
	copy.thumb = [self.thumb copy];
	copy.title = [self.title copy];

	return copy;
}
@end
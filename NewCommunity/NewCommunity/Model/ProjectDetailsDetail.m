//
//	ProjectDetailsDetail.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ProjectDetailsDetail.h"

NSString *const kProjectDetailsDetailAddTime = @"addTime";
NSString *const kProjectDetailsDetailClick = @"click";
NSString *const kProjectDetailsDetailCollectState = @"collectState";
NSString *const kProjectDetailsDetailComment = @"comment";
NSString *const kProjectDetailsDetailContent = @"content";
NSString *const kProjectDetailsDetailExcerpt = @"excerpt";
NSString *const kProjectDetailsDetailIdField = @"id";
NSString *const kProjectDetailsDetailThumb = @"thumb";
NSString *const kProjectDetailsDetailTitle = @"title";
NSString *const kProjectDetailsDetailSmallThumb = @"smallThumb";

@interface ProjectDetailsDetail ()
@end
@implementation ProjectDetailsDetail




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kProjectDetailsDetailAddTime] isKindOfClass:[NSNull class]]){
		self.addTime = dictionary[kProjectDetailsDetailAddTime];
	}	
	if(![dictionary[kProjectDetailsDetailClick] isKindOfClass:[NSNull class]]){
		self.click = dictionary[kProjectDetailsDetailClick];
	}	
	if(![dictionary[kProjectDetailsDetailCollectState] isKindOfClass:[NSNull class]]){
		self.collectState = [dictionary[kProjectDetailsDetailCollectState] boolValue];
	}

	if(![dictionary[kProjectDetailsDetailComment] isKindOfClass:[NSNull class]]){
		self.comment = dictionary[kProjectDetailsDetailComment];
	}	
	if(![dictionary[kProjectDetailsDetailContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kProjectDetailsDetailContent];
	}	
	if(![dictionary[kProjectDetailsDetailExcerpt] isKindOfClass:[NSNull class]]){
		self.excerpt = dictionary[kProjectDetailsDetailExcerpt];
	}	
	if(![dictionary[kProjectDetailsDetailIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kProjectDetailsDetailIdField];
	}	
	if(![dictionary[kProjectDetailsDetailThumb] isKindOfClass:[NSNull class]]){
		self.thumb = dictionary[kProjectDetailsDetailThumb];
	}	
	if(![dictionary[kProjectDetailsDetailTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kProjectDetailsDetailTitle];
	}
    if(![dictionary[kProjectDetailsDetailSmallThumb] isKindOfClass:[NSNull class]]){
        self.smallThumb = dictionary[kProjectDetailsDetailSmallThumb];
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
		dictionary[kProjectDetailsDetailAddTime] = self.addTime;
	}
	if(self.click != nil){
		dictionary[kProjectDetailsDetailClick] = self.click;
	}
	dictionary[kProjectDetailsDetailCollectState] = @(self.collectState);
	if(self.comment != nil){
		dictionary[kProjectDetailsDetailComment] = self.comment;
	}
	if(self.content != nil){
		dictionary[kProjectDetailsDetailContent] = self.content;
	}
	if(self.excerpt != nil){
		dictionary[kProjectDetailsDetailExcerpt] = self.excerpt;
	}
	if(self.idField != nil){
		dictionary[kProjectDetailsDetailIdField] = self.idField;
	}
	if(self.thumb != nil){
		dictionary[kProjectDetailsDetailThumb] = self.thumb;
	}
	if(self.title != nil){
		dictionary[kProjectDetailsDetailTitle] = self.title;
	}
    if(self.smallThumb != nil){
        dictionary[kProjectDetailsDetailSmallThumb] = self.smallThumb;
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
		[aCoder encodeObject:self.addTime forKey:kProjectDetailsDetailAddTime];
	}
	if(self.click != nil){
		[aCoder encodeObject:self.click forKey:kProjectDetailsDetailClick];
	}
	[aCoder encodeObject:@(self.collectState) forKey:kProjectDetailsDetailCollectState];	if(self.comment != nil){
		[aCoder encodeObject:self.comment forKey:kProjectDetailsDetailComment];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kProjectDetailsDetailContent];
	}
	if(self.excerpt != nil){
		[aCoder encodeObject:self.excerpt forKey:kProjectDetailsDetailExcerpt];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kProjectDetailsDetailIdField];
	}
	if(self.thumb != nil){
		[aCoder encodeObject:self.thumb forKey:kProjectDetailsDetailThumb];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:kProjectDetailsDetailTitle];
	}
    if(self.smallThumb != nil){
        [aCoder encodeObject:self.smallThumb forKey:kProjectDetailsDetailSmallThumb];
    }

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.addTime = [aDecoder decodeObjectForKey:kProjectDetailsDetailAddTime];
	self.click = [aDecoder decodeObjectForKey:kProjectDetailsDetailClick];
	self.collectState = [[aDecoder decodeObjectForKey:kProjectDetailsDetailCollectState] boolValue];
	self.comment = [aDecoder decodeObjectForKey:kProjectDetailsDetailComment];
	self.content = [aDecoder decodeObjectForKey:kProjectDetailsDetailContent];
	self.excerpt = [aDecoder decodeObjectForKey:kProjectDetailsDetailExcerpt];
	self.idField = [aDecoder decodeObjectForKey:kProjectDetailsDetailIdField];
	self.thumb = [aDecoder decodeObjectForKey:kProjectDetailsDetailThumb];
	self.title = [aDecoder decodeObjectForKey:kProjectDetailsDetailTitle];
    self.smallThumb = [aDecoder decodeObjectForKey:kProjectDetailsDetailSmallThumb];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	ProjectDetailsDetail *copy = [ProjectDetailsDetail new];

	copy.addTime = [self.addTime copy];
	copy.click = [self.click copy];
	copy.collectState = self.collectState;
	copy.comment = [self.comment copy];
	copy.content = [self.content copy];
	copy.excerpt = [self.excerpt copy];
	copy.idField = [self.idField copy];
	copy.thumb = [self.thumb copy];
	copy.title = [self.title copy];
    copy.smallThumb = [self.smallThumb copy];

	return copy;
}
@end

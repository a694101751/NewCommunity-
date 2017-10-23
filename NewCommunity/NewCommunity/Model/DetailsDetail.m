//
//	DetailsDetail.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DetailsDetail.h"

NSString *const kDetailsDetailAddTime = @"addTime";
NSString *const kDetailsDetailClick = @"click";
NSString *const kDetailsDetailComment = @"comment";
NSString *const kDetailsDetailContent = @"content";
NSString *const kDetailsDetailExcerpt = @"excerpt";
NSString *const kDetailsDetailIdField = @"id";
NSString *const kDetailsDetailThumb = @"thumb";
NSString *const kDetailsDetailTitle = @"title";
NSString *const kDetailsDetailCollectionState = @"collectState";

@interface DetailsDetail ()
@end
@implementation DetailsDetail




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDetailsDetailAddTime] isKindOfClass:[NSNull class]]){
		self.addTime = dictionary[kDetailsDetailAddTime];
	}	
	if(![dictionary[kDetailsDetailClick] isKindOfClass:[NSNull class]]){
		self.click = dictionary[kDetailsDetailClick];
	}	
	if(![dictionary[kDetailsDetailComment] isKindOfClass:[NSNull class]]){
		self.comment = dictionary[kDetailsDetailComment];
	}	
	if(![dictionary[kDetailsDetailContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kDetailsDetailContent];
	}	
	if(![dictionary[kDetailsDetailExcerpt] isKindOfClass:[NSNull class]]){
		self.excerpt = dictionary[kDetailsDetailExcerpt];
	}	
	if(![dictionary[kDetailsDetailIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kDetailsDetailIdField];
	}	
	if(![dictionary[kDetailsDetailThumb] isKindOfClass:[NSNull class]]){
		self.thumb = dictionary[kDetailsDetailThumb];
	}	
	if(![dictionary[kDetailsDetailTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kDetailsDetailTitle];
	}
    if(![dictionary[kDetailsDetailCollectionState] isKindOfClass:[NSNull class]]){
        self.collectState = dictionary[kDetailsDetailCollectionState];
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
		dictionary[kDetailsDetailAddTime] = self.addTime;
	}
	if(self.click != nil){
		dictionary[kDetailsDetailClick] = self.click;
	}
	if(self.comment != nil){
		dictionary[kDetailsDetailComment] = self.comment;
	}
	if(self.content != nil){
		dictionary[kDetailsDetailContent] = self.content;
	}
	if(self.excerpt != nil){
		dictionary[kDetailsDetailExcerpt] = self.excerpt;
	}
	if(self.idField != nil){
		dictionary[kDetailsDetailIdField] = self.idField;
	}
	if(self.thumb != nil){
		dictionary[kDetailsDetailThumb] = self.thumb;
	}
	if(self.title != nil){
		dictionary[kDetailsDetailTitle] = self.title;
	}
    if(self.collectState != nil){
        dictionary[kDetailsDetailCollectionState] = self.collectState;
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
		[aCoder encodeObject:self.addTime forKey:kDetailsDetailAddTime];
	}
	if(self.click != nil){
		[aCoder encodeObject:self.click forKey:kDetailsDetailClick];
	}
	if(self.comment != nil){
		[aCoder encodeObject:self.comment forKey:kDetailsDetailComment];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kDetailsDetailContent];
	}
	if(self.excerpt != nil){
		[aCoder encodeObject:self.excerpt forKey:kDetailsDetailExcerpt];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kDetailsDetailIdField];
	}
	if(self.thumb != nil){
		[aCoder encodeObject:self.thumb forKey:kDetailsDetailThumb];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:kDetailsDetailTitle];
	}
    if(self.collectState != nil){
        [aCoder encodeObject:self.collectState forKey:kDetailsDetailCollectionState];
    }

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.addTime = [aDecoder decodeObjectForKey:kDetailsDetailAddTime];
	self.click = [aDecoder decodeObjectForKey:kDetailsDetailClick];
	self.comment = [aDecoder decodeObjectForKey:kDetailsDetailComment];
	self.content = [aDecoder decodeObjectForKey:kDetailsDetailContent];
	self.excerpt = [aDecoder decodeObjectForKey:kDetailsDetailExcerpt];
	self.idField = [aDecoder decodeObjectForKey:kDetailsDetailIdField];
	self.thumb = [aDecoder decodeObjectForKey:kDetailsDetailThumb];
	self.title = [aDecoder decodeObjectForKey:kDetailsDetailTitle];
    self.collectState = [aDecoder decodeObjectForKey:kDetailsDetailCollectionState];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DetailsDetail *copy = [DetailsDetail new];

	copy.addTime = [self.addTime copy];
	copy.click = [self.click copy];
	copy.comment = [self.comment copy];
	copy.content = [self.content copy];
	copy.excerpt = [self.excerpt copy];
	copy.idField = [self.idField copy];
	copy.thumb = [self.thumb copy];
	copy.title = [self.title copy];
    copy.collectState = [self.collectState copy];

	return copy;
}
@end

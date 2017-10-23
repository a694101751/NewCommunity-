//
//	 EventDetailsActivity.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import " EventDetailsActivity.h"

NSString *const kEventDetailsActivityAddTime = @"addTime";
NSString *const kEventDetailsActivityContent = @"content";
NSString *const kEventDetailsActivityIdField = @"id";
NSString *const kEventDetailsActivityTitle = @"title";

@interface  EventDetailsActivity ()
@end
@implementation  EventDetailsActivity




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kEventDetailsActivityAddTime] isKindOfClass:[NSNull class]]){
		self.addTime = dictionary[kEventDetailsActivityAddTime];
	}	
	if(![dictionary[kEventDetailsActivityContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kEventDetailsActivityContent];
	}	
	if(![dictionary[kEventDetailsActivityIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kEventDetailsActivityIdField];
	}	
	if(![dictionary[kEventDetailsActivityTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kEventDetailsActivityTitle];
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
		dictionary[kEventDetailsActivityAddTime] = self.addTime;
	}
	if(self.content != nil){
		dictionary[kEventDetailsActivityContent] = self.content;
	}
	if(self.idField != nil){
		dictionary[kEventDetailsActivityIdField] = self.idField;
	}
	if(self.title != nil){
		dictionary[kEventDetailsActivityTitle] = self.title;
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
		[aCoder encodeObject:self.addTime forKey:kEventDetailsActivityAddTime];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kEventDetailsActivityContent];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kEventDetailsActivityIdField];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:kEventDetailsActivityTitle];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.addTime = [aDecoder decodeObjectForKey:kEventDetailsActivityAddTime];
	self.content = [aDecoder decodeObjectForKey:kEventDetailsActivityContent];
	self.idField = [aDecoder decodeObjectForKey:kEventDetailsActivityIdField];
	self.title = [aDecoder decodeObjectForKey:kEventDetailsActivityTitle];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	 EventDetailsActivity *copy = [ EventDetailsActivity new];

	copy.addTime = [self.addTime copy];
	copy.content = [self.content copy];
	copy.idField = [self.idField copy];
	copy.title = [self.title copy];

	return copy;
}
@end

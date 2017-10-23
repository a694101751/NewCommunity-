//
//	 EventDetailsModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import " EventDetailsModel.h"

NSString *const kEventDetailsModelActivity = @"activity";
NSString *const kEventDetailsModelCode = @"code";
NSString *const kEventDetailsModelContent = @"content";

@interface  EventDetailsModel ()
@end
@implementation  EventDetailsModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kEventDetailsModelActivity] isKindOfClass:[NSNull class]]){
		self.activity = [[ EventDetailsActivity alloc] initWithDictionary:dictionary[kEventDetailsModelActivity]];
	}

	if(![dictionary[kEventDetailsModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kEventDetailsModelCode];
	}	
	if(![dictionary[kEventDetailsModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kEventDetailsModelContent];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.activity != nil){
		dictionary[kEventDetailsModelActivity] = [self.activity toDictionary];
	}
	if(self.code != nil){
		dictionary[kEventDetailsModelCode] = self.code;
	}
	if(self.content != nil){
		dictionary[kEventDetailsModelContent] = self.content;
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
	if(self.activity != nil){
		[aCoder encodeObject:self.activity forKey:kEventDetailsModelActivity];
	}
	if(self.code != nil){
		[aCoder encodeObject:self.code forKey:kEventDetailsModelCode];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kEventDetailsModelContent];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.activity = [aDecoder decodeObjectForKey:kEventDetailsModelActivity];
	self.code = [aDecoder decodeObjectForKey:kEventDetailsModelCode];
	self.content = [aDecoder decodeObjectForKey:kEventDetailsModelContent];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	 EventDetailsModel *copy = [ EventDetailsModel new];

	copy.activity = [self.activity copy];
	copy.code = [self.code copy];
	copy.content = [self.content copy];

	return copy;
}
@end

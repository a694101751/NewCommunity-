//
//	PropertyServiceModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PropertyServiceModel.h"

NSString *const kPropertyServiceModelCode = @"code";
NSString *const kPropertyServiceModelContent = @"content";
NSString *const kPropertyServiceModelPages = @"pages";

@interface PropertyServiceModel ()
@end
@implementation PropertyServiceModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kPropertyServiceModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kPropertyServiceModelCode];
	}	
	if(![dictionary[kPropertyServiceModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kPropertyServiceModelContent];
	}	
	if(dictionary[kPropertyServiceModelPages] != nil && [dictionary[kPropertyServiceModelPages] isKindOfClass:[NSArray class]]){
		NSArray * pagesDictionaries = dictionary[kPropertyServiceModelPages];
		NSMutableArray * pagesItems = [NSMutableArray array];
		for(NSDictionary * pagesDictionary in pagesDictionaries){
			PropertyServicePage * pagesItem = [[PropertyServicePage alloc] initWithDictionary:pagesDictionary];
			[pagesItems addObject:pagesItem];
		}
		self.pages = pagesItems;
	}
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.code != nil){
		dictionary[kPropertyServiceModelCode] = self.code;
	}
	if(self.content != nil){
		dictionary[kPropertyServiceModelContent] = self.content;
	}
	if(self.pages != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(PropertyServicePage * pagesElement in self.pages){
			[dictionaryElements addObject:[pagesElement toDictionary]];
		}
		dictionary[kPropertyServiceModelPages] = dictionaryElements;
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
	if(self.code != nil){
		[aCoder encodeObject:self.code forKey:kPropertyServiceModelCode];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kPropertyServiceModelContent];
	}
	if(self.pages != nil){
		[aCoder encodeObject:self.pages forKey:kPropertyServiceModelPages];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kPropertyServiceModelCode];
	self.content = [aDecoder decodeObjectForKey:kPropertyServiceModelContent];
	self.pages = [aDecoder decodeObjectForKey:kPropertyServiceModelPages];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	PropertyServiceModel *copy = [PropertyServiceModel new];

	copy.code = [self.code copy];
	copy.content = [self.content copy];
	copy.pages = [self.pages copy];

	return copy;
}
@end
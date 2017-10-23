//
//	MyCollectionModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "MyCollectionModel.h"

NSString *const kMyCollectionModelCode = @"code";
NSString *const kMyCollectionModelContent = @"content";
NSString *const kMyCollectionModelData = @"data";

@interface MyCollectionModel ()
@end
@implementation MyCollectionModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kMyCollectionModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kMyCollectionModelCode];
	}	
	if(![dictionary[kMyCollectionModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kMyCollectionModelContent];
	}	
	if(![dictionary[kMyCollectionModelData] isKindOfClass:[NSNull class]]){
		self.data = [[MyCollectionData alloc] initWithDictionary:dictionary[kMyCollectionModelData]];
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
		dictionary[kMyCollectionModelCode] = self.code;
	}
	if(self.content != nil){
		dictionary[kMyCollectionModelContent] = self.content;
	}
	if(self.data != nil){
		dictionary[kMyCollectionModelData] = [self.data toDictionary];
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
		[aCoder encodeObject:self.code forKey:kMyCollectionModelCode];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kMyCollectionModelContent];
	}
	if(self.data != nil){
		[aCoder encodeObject:self.data forKey:kMyCollectionModelData];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kMyCollectionModelCode];
	self.content = [aDecoder decodeObjectForKey:kMyCollectionModelContent];
	self.data = [aDecoder decodeObjectForKey:kMyCollectionModelData];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	MyCollectionModel *copy = [MyCollectionModel new];

	copy.code = [self.code copy];
	copy.content = [self.content copy];
	copy.data = [self.data copy];

	return copy;
}
@end
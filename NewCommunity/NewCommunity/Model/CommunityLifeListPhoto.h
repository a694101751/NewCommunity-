#import <UIKit/UIKit.h>

@interface CommunityLifeListPhoto : NSObject

@property (nonatomic, strong) NSString * alt;
@property (nonatomic, assign) NSInteger orders;
@property (nonatomic, strong) NSString * url;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
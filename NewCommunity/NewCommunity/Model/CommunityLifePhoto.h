#import <UIKit/UIKit.h>

@interface CommunityLifePhoto : NSObject

@property (nonatomic, strong) NSString * alt;
@property (nonatomic, assign) NSInteger orders;
@property (nonatomic, strong) NSString * url;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
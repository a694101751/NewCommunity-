#import <UIKit/UIKit.h>
#import "InformationActivitiesActivityList.h"

@interface InformationActivitiesData : NSObject

@property (nonatomic, strong) NSArray * activityList;
@property (nonatomic, strong) NSString * page;
@property (nonatomic, strong) NSString * rows;
@property (nonatomic, strong) NSString * total;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
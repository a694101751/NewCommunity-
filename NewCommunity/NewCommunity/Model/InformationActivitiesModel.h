#import <UIKit/UIKit.h>
#import "InformationActivitiesData.h"

@interface InformationActivitiesModel : NSObject

@property (nonatomic, strong) NSString * code;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) InformationActivitiesData * data;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
#import <UIKit/UIKit.h>
#import "GovernmentAffairsData.h"

@interface GovernmentAffairsModel : NSObject

@property (nonatomic, strong) NSString * code;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) GovernmentAffairsData * data;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
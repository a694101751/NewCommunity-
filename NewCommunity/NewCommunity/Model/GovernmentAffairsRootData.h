#import <UIKit/UIKit.h>
#import "GovernmentAffairsRootCareList.h"
#import "GovernmentAffairsRootAdvList.h"
#import "GovernmentAffairsRootCareList.h"

@interface GovernmentAffairsRootData : NSObject

@property (nonatomic, strong) NSArray * careList;
@property (nonatomic, strong) NSArray * advList;
@property (nonatomic, strong) NSArray * topicList;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
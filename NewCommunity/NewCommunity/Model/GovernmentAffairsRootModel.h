#import <UIKit/UIKit.h>
#import "GovernmentAffairsRootData.h"

@interface GovernmentAffairsRootModel : NSObject

@property (nonatomic, strong) NSString * code;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) GovernmentAffairsRootData * data;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
#import <UIKit/UIKit.h>
#import "DetailsDetail.h"
#import "DetailsPostRecommendList.h"

@interface DetailsModel : NSObject

@property (nonatomic, strong) NSString * code;
@property (nonatomic, strong) DetailsDetail * detail;
@property (nonatomic, strong) NSArray * postRecommendList;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
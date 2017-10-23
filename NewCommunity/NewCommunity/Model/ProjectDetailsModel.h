#import <UIKit/UIKit.h>
#import "ProjectDetailsDetail.h"
#import "ProjectDetailsPostRecommendList.h"

@interface ProjectDetailsModel : NSObject

@property (nonatomic, strong) NSString * code;
@property (nonatomic, strong) ProjectDetailsDetail * detail;
@property (nonatomic, strong) NSArray * postRecommendList;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
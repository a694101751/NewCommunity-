#import <UIKit/UIKit.h>
#import "CommunityServiceData.h"

@interface CommunityServiceModel : NSObject

@property (nonatomic, strong) NSString * code;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) CommunityServiceData * data;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
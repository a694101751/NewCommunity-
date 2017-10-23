#import <UIKit/UIKit.h>
#import "CommunityNotificationData.h"

@interface CommunityNotificationModel : NSObject

@property (nonatomic, strong) NSString * code;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) CommunityNotificationData * data;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
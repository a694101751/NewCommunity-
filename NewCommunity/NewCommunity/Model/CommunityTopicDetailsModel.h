#import <UIKit/UIKit.h>
#import "CommunityTopicDetailsTopic.h"

@interface CommunityTopicDetailsModel : NSObject

@property (nonatomic, strong) NSString * code;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) CommunityTopicDetailsTopic * topic;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
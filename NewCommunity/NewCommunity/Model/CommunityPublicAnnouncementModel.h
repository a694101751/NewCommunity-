#import <UIKit/UIKit.h>
#import "CommunityPublicAnnouncementData.h"

@interface CommunityPublicAnnouncementModel : NSObject

@property (nonatomic, strong) NSString * code;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) CommunityPublicAnnouncementData * data;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
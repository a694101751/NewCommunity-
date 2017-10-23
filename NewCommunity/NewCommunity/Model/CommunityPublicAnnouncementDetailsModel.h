#import <UIKit/UIKit.h>
#import "CommunityPublicAnnouncementDetailsPage.h"

@interface CommunityPublicAnnouncementDetailsModel : NSObject

@property (nonatomic, strong) NSString * code;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) CommunityPublicAnnouncementDetailsPage * pages;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
#import <UIKit/UIKit.h>
#import "CommunityLifeDetailsClubLife.h"

@interface CommunityLifeDetailsModel : NSObject

@property (nonatomic, strong) CommunityLifeDetailsClubLife * clubLife;
@property (nonatomic, strong) NSString * code;
@property (nonatomic, strong) NSString * content;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
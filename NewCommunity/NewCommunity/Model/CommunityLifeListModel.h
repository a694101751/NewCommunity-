#import <UIKit/UIKit.h>
#import "CommunityLifeListData.h"

@interface CommunityLifeListModel : NSObject

@property (nonatomic, strong) NSString * code;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) CommunityLifeListData * data;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
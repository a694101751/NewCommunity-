#import <UIKit/UIKit.h>
#import "CommunityShareData.h"

@interface CommunityShareModel : NSObject

@property (nonatomic, strong) NSString * code;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSString * notice;
@property (nonatomic, strong) CommunityShareData * data;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end

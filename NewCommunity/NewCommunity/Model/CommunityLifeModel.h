#import <UIKit/UIKit.h>
#import "CommunityLifeData.h"

@interface CommunityLifeModel : NSObject

@property (nonatomic, strong) NSString * code;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) CommunityLifeData * data;
@property (nonatomic, strong) NSString * notice;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
#import <UIKit/UIKit.h>
#import "AttentionCommunityData.h"

@interface AttentionCommunityModel : NSObject

@property (nonatomic, strong) NSString * code;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) AttentionCommunityData * data;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
#import <UIKit/UIKit.h>
#import "AttentionCommunityPage.h"

@interface AttentionCommunityData : NSObject

@property (nonatomic, strong) NSArray * pages;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
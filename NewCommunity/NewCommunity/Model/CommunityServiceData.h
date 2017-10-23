#import <UIKit/UIKit.h>
#import "CommunityServicePostList.h"

@interface CommunityServiceData : NSObject

@property (nonatomic, strong) NSArray * postList;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
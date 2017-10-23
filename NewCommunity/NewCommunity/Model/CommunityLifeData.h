#import <UIKit/UIKit.h>
#import "CommunityLifeAdvList.h"
#import "CommunityLifePostList.h"

@interface CommunityLifeData : NSObject

@property (nonatomic, strong) NSArray * advList;
@property (nonatomic, strong) NSArray * postList;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
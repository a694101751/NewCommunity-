#import <UIKit/UIKit.h>
#import "CommunityShareAdvList.h"
#import "CommunitySharePostList.h"

@interface CommunityShareData : NSObject

@property (nonatomic, strong) NSArray * advList;
@property (nonatomic, strong) NSArray * postList;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
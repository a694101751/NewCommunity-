#import <UIKit/UIKit.h>
#import "CommunityLifeDetailsCommentListData.h"

@interface CommunityLifeDetailsCommentListModel : NSObject

@property (nonatomic, strong) NSString * code;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) CommunityLifeDetailsCommentListData * data;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
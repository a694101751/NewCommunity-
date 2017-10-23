#import <UIKit/UIKit.h>

@interface CommunityLifeDetailsCommentListPage : NSObject

@property (nonatomic, strong) NSString * avatar;
@property (nonatomic, strong) NSString * clubid;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * message;
@property (nonatomic, strong) NSString * reply;
@property (nonatomic, strong) NSString * userName;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
#import <UIKit/UIKit.h>

@interface CommunityTopicDetailsTopic : NSObject

@property (nonatomic, strong) NSString * addTime;
@property (nonatomic, strong) NSString * click;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * commentSum;
@property (nonatomic, strong) NSString * state;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end

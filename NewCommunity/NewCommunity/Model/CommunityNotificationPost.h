#import <UIKit/UIKit.h>

@interface CommunityNotificationPost : NSObject

@property (nonatomic, strong) NSString * addTime;
@property (nonatomic, strong) NSString * clubId;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * title;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
#import <UIKit/UIKit.h>

@interface CommunityTopicPage : NSObject

@property (nonatomic, strong) NSString * click;
@property (nonatomic, strong) NSString * clubId;
@property (nonatomic, strong) NSString * clubid;
@property (nonatomic, strong) NSString * commentSum;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSArray * photo;
@property (nonatomic, strong) NSString * rareaId;
@property (nonatomic, strong) NSString * showcase;
@property (nonatomic, strong) NSString * thumb;
@property (nonatomic, strong) NSString * title;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
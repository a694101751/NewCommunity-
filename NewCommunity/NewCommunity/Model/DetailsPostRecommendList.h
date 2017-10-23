#import <UIKit/UIKit.h>

@interface DetailsPostRecommendList : NSObject

@property (nonatomic, strong) NSString * addTime;
@property (nonatomic, strong) NSString * click;
@property (nonatomic, strong) NSString * comment;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * postId;
@property (nonatomic, strong) NSString * thumb;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
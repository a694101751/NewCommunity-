#import <UIKit/UIKit.h>

@interface AllCommentsPost : NSObject

@property (nonatomic, strong) NSString * addTime;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * message;
@property (nonatomic, strong) NSString * avatar;
@property (nonatomic, strong) NSString * userName;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end

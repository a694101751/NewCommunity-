#import <UIKit/UIKit.h>

@interface OneCommentPage : NSObject

@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * message;
@property (nonatomic, strong) NSString * reply;
@property (nonatomic, strong) NSString * userName;
@property (nonatomic, strong) NSString * avatar;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end

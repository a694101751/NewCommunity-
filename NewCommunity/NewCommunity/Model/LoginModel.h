#import <UIKit/UIKit.h>
#import "LoginUser.h"

@interface LoginModel : NSObject

@property (nonatomic, strong) NSString * code;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSString * state;
@property (nonatomic, strong) LoginUser * user;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
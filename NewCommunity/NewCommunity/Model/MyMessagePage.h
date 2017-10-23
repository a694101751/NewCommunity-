#import <UIKit/UIKit.h>

@interface MyMessagePage : NSObject

@property (nonatomic, strong) NSString * addTime;
@property (nonatomic, strong) NSString * avatar;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * lifeId;
@property (nonatomic, strong) NSString * message;
@property (nonatomic, strong) NSString * nickName;
@property (nonatomic, strong) NSString * type;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end

#import <UIKit/UIKit.h>
#import "MyStatePhoto.h"

@interface MyStatePage : NSObject

@property (nonatomic, strong) NSString * addTime;
@property (nonatomic, strong) NSString * clubid;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSArray * photo;
@property (nonatomic, strong) NSString * thumb;
@property (nonatomic, strong) NSString * title;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
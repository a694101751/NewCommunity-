#import <UIKit/UIKit.h>
#import "MyStateData.h"

@interface MyStateModel : NSObject

@property (nonatomic, strong) NSString * code;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) MyStateData * data;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
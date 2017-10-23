#import <UIKit/UIKit.h>
#import "PropertyServicePage.h"

@interface PropertyServiceModel : NSObject

@property (nonatomic, strong) NSString * code;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSArray * pages;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
#import <UIKit/UIKit.h>
#import "MyStatePage.h"

@interface MyStateData : NSObject

@property (nonatomic, strong) NSArray * pages;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
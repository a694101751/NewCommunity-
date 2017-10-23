#import <UIKit/UIKit.h>
#import "StreetAreaPage.h"

@interface StreetAreaData : NSObject

@property (nonatomic, strong) NSArray * pages;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
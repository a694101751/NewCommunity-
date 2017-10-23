#import <UIKit/UIKit.h>
#import "StayFocusedPage.h"

@interface StayFocusedData : NSObject

@property (nonatomic, strong) NSArray * pages;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
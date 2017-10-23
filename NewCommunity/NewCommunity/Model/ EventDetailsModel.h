#import <UIKit/UIKit.h>
#import " EventDetailsActivity.h"

@interface  EventDetailsModel : NSObject

@property (nonatomic, strong)  EventDetailsActivity * activity;
@property (nonatomic, strong) NSString * code;
@property (nonatomic, strong) NSString * content;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
#import <UIKit/UIKit.h>
#import "UnreadMessagesData.h"

@interface UnreadMessagesModel : NSObject

@property (nonatomic, strong) NSString * code;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) UnreadMessagesData * data;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
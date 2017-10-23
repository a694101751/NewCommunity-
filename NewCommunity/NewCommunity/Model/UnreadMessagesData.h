#import <UIKit/UIKit.h>

@interface UnreadMessagesData : NSObject

@property (nonatomic, strong) NSString * total;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
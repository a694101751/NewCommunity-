#import <UIKit/UIKit.h>

@interface AttentionCommunityPage : NSObject

@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) BOOL state;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
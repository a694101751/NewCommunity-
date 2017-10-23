#import <UIKit/UIKit.h>

@interface CommunitySharePostList : NSObject

@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * thumb;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
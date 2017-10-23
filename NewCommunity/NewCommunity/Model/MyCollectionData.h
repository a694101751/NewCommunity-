#import <UIKit/UIKit.h>
#import "MyCollectionPost.h"

@interface MyCollectionData : NSObject

@property (nonatomic, strong) NSString * page;
@property (nonatomic, strong) NSArray * post;
@property (nonatomic, strong) NSString * rows;
@property (nonatomic, strong) NSString * total;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
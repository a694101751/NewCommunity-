#import <UIKit/UIKit.h>

@interface MyCollectionPost : NSObject

@property (nonatomic, strong) NSString * addTime;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * postId;
@property (nonatomic, strong) NSString * thumb;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * type;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end

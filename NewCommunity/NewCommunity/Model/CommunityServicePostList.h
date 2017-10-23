#import <UIKit/UIKit.h>

@interface CommunityServicePostList : NSObject

@property (nonatomic, strong) NSString * clubid;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * thumb;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
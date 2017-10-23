#import <UIKit/UIKit.h>

@interface GovernmentAffairsRootAdvList : NSObject

@property (nonatomic, strong) NSString * direct;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * thumb;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * objectId;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end

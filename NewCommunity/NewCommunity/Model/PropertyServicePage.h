#import <UIKit/UIKit.h>

@interface PropertyServicePage : NSObject

@property (nonatomic, strong) NSString * areaId;
@property (nonatomic, strong) NSString * clubId;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * url;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
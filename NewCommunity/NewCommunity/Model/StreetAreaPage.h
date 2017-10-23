#import <UIKit/UIKit.h>

@interface StreetAreaPage : NSObject

@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * name;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
#import <UIKit/UIKit.h>

@interface InformationRootAdvList : NSObject

@property (nonatomic, strong) NSString * direct;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * thumb;
@property (nonatomic, strong) NSString * objectId;
@property (nonatomic, strong) NSString * title;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end

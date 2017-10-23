#import <UIKit/UIKit.h>

@interface DetailsDetail : NSObject

@property (nonatomic, strong) NSString * addTime;
@property (nonatomic, strong) NSString * click;
@property (nonatomic, strong) NSString * comment;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSString * excerpt;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * thumb;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * collectState;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end

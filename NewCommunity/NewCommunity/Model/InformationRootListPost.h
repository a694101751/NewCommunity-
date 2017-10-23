#import <UIKit/UIKit.h>
#import "InformationRootListPhoto.h"

@interface InformationRootListPost : NSObject

@property (nonatomic, strong) NSString * comment;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSString * excerpt;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSArray * photo;
@property (nonatomic, strong) NSString * showcase;
@property (nonatomic, strong) NSString * thumb;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * istop;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end

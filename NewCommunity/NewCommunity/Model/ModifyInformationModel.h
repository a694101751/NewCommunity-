#import <UIKit/UIKit.h>

@interface ModifyInformationModel : NSObject

@property (nonatomic, strong) NSString * code;
@property (nonatomic, assign) BOOL content;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
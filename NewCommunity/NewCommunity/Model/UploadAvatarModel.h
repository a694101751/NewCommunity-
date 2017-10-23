#import <UIKit/UIKit.h>
#import "UploadAvatarData.h"

@interface UploadAvatarModel : NSObject

@property (nonatomic, strong) NSString * code;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) UploadAvatarData * data;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
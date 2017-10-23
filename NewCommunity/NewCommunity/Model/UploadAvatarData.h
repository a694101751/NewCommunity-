#import <UIKit/UIKit.h>
#import "UploadAvatarPhoto.h"

@interface UploadAvatarData : NSObject

@property (nonatomic, strong) NSArray * photo;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
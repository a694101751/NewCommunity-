#import <UIKit/UIKit.h>

@interface UploadAvatarPhoto : NSObject

@property (nonatomic, strong) NSString * path;
@property (nonatomic, strong) NSString * url;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
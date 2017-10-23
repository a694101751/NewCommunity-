#import <UIKit/UIKit.h>

@interface CommunityPublicAnnouncementPost : NSObject

@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * thumb;
@property (nonatomic, strong) NSString * title;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
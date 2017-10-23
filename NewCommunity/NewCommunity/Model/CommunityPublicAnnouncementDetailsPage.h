#import <UIKit/UIKit.h>

@interface CommunityPublicAnnouncementDetailsPage : NSObject

@property (nonatomic, strong) NSString * addTime;
@property (nonatomic, strong) NSString * click;
@property (nonatomic, strong) NSString * clubid;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * thumb;
@property (nonatomic, strong) NSString * title;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
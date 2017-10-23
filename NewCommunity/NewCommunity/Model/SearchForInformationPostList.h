#import <UIKit/UIKit.h>

@interface SearchForInformationPostList : NSObject

@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * title;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
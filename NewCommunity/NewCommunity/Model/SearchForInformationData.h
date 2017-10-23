#import <UIKit/UIKit.h>
#import "SearchForInformationPostList.h"

@interface SearchForInformationData : NSObject

@property (nonatomic, strong) NSArray * postList;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
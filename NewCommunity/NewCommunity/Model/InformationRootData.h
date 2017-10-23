#import <UIKit/UIKit.h>
#import "InformationRootAdvList.h"
#import "InformationRootIstop.h"

@interface InformationRootData : NSObject

@property (nonatomic, strong) NSArray * advList;
@property (nonatomic, strong) NSArray * istop;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
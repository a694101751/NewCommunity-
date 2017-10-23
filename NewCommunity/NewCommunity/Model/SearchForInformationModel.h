#import <UIKit/UIKit.h>
#import "SearchForInformationData.h"

@interface SearchForInformationModel : NSObject

@property (nonatomic, strong) NSString * code;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) SearchForInformationData * data;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
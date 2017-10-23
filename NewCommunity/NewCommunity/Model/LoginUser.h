#import <UIKit/UIKit.h>

@interface LoginUser : NSObject

@property (nonatomic, strong) NSString * address;
@property (nonatomic, strong) NSString * areaId;
@property (nonatomic, strong) NSString * areaName;
@property (nonatomic, strong) NSString * avatar;
@property (nonatomic, strong) NSString * clubId;
@property (nonatomic, strong) NSString * clubName;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * nickName;
@property (nonatomic, strong) NSString * userName;
@property (nonatomic, strong) NSString * subdistrictName;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end

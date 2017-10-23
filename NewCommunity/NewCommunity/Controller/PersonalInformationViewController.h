//
//  PersonalInformationViewController.h
//  NewCommunity
//
//  Created by Aaron on 2017/9/20.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "BaseViewController.h"

typedef void(^PersonalInformationBlock)();

@interface PersonalInformationViewController : BaseViewController
@property (nonatomic, copy)PersonalInformationBlock block;
@end

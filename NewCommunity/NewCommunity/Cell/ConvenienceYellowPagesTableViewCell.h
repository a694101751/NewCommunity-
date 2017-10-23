//
//  ConvenienceYellowPagesTableViewCell.h
//  NewCommunity
//
//  Created by Aaron on 2017/9/25.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^PhoneButtonBlock)();

@interface ConvenienceYellowPagesTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UIButton *phoneButton;
@property (nonatomic, copy)PhoneButtonBlock block;
@end

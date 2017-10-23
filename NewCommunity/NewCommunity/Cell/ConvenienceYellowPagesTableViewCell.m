//
//  ConvenienceYellowPagesTableViewCell.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/25.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "ConvenienceYellowPagesTableViewCell.h"

@implementation ConvenienceYellowPagesTableViewCell

-(void)setPhoneButton:(UIButton *)phoneButton
{
    _phoneButton = phoneButton;
    _phoneButton.layer.cornerRadius = 14;
    _phoneButton.layer.borderWidth = 1;
    _phoneButton.layer.borderColor = getColor(@"24c789").CGColor;
    _phoneButton.layer.masksToBounds = YES;
}

- (IBAction)phoneButtonClick:(id)sender {
    if (self.block) {
        self.block();
    }
}


@end

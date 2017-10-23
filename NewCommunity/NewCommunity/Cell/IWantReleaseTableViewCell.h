//
//  IWantReleaseTableViewCell.h
//  NewCommunity
//
//  Created by Aaron on 2017/9/24.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "SmartTableViewCell.h"

@protocol IWantReleaseTableViewCellDelegate <NSObject>

-(void)didSelectItemWithTitle:(NSString *)title indexPathRow:(NSInteger)row;

@end

@interface IWantReleaseTableViewCell : SmartTableViewCell
@property (nonatomic, weak)id<IWantReleaseTableViewCellDelegate>delegate;
@end

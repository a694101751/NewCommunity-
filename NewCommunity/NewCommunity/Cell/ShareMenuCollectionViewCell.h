//
//  ShareMenuCollectionViewCell.h
//  NewCommunity
//
//  Created by Aaron on 2017/9/22.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ShareMenuCollectionViewCell;
@protocol ShareMenuCollectionViewCellDelegate <NSObject>

-(void)shareMenuButtonClickWithCell:(ShareMenuCollectionViewCell *)cell;

@end

@interface ShareMenuCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong)QMUIButton * button;
@property (nonatomic, weak)id<ShareMenuCollectionViewCellDelegate>delegate;
@end

//
//  CommentView.h
//  NewCommunity
//
//  Created by Aaron on 2017/9/21.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ShareMenuViewDelegate <NSObject>

-(void)shareButtonWithTitle:(NSString *)title;

@end

@interface ShareMenuView : UIView
-(instancetype)initWithTitleArry:(NSArray *)titleArray;
-(void)showShareMenuView;
@property (nonatomic, strong)UILabel * titleLabel;
@property (nonatomic, weak)id<ShareMenuViewDelegate>delegate;
@end

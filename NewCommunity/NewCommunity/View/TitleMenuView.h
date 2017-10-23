//
//  TitleMenuView.h
//  NewCommunity
//
//  Created by Aaron on 2017/9/20.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TitleMenuViewDelegate <NSObject>

-(void)buttonClick:(UIButton *)button;

@end
@interface TitleMenuView : UIView
//线条View
@property (nonatomic, strong)UIView * indicatorView;
@property (nonatomic, weak)id<TitleMenuViewDelegate>delegate;

-(instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;
@end

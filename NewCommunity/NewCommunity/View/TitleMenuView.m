//
//  TitleMenuView.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/20.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "TitleMenuView.h"

static const NSInteger kBaseTag = 200;

@implementation TitleMenuView

-(instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        CGFloat buttonWidth = SCREEN_WIDTH / titles.count;
        for (int i = 0; i < titles.count; i ++) {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setFrame:CGRectMake(i * buttonWidth, 0, buttonWidth, frame.size.height)];
            [button setTag:kBaseTag + i];
            [button setTitle:titles[i] forState:UIControlStateNormal];
            [button setTitleColor:getColor(@"a6a6a6") forState:UIControlStateNormal];
            [button setTitleColor:getColor(@"584f60") forState:UIControlStateSelected];
            [button.titleLabel setFont:[UIFont fontWithName:@"PingFangSC-Medium" size:16]];
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
        }
        
        _indicatorView = [[UIView alloc]initWithFrame:CGRectMake(14, CGRectGetHeight(self.frame) - 1.5, buttonWidth * titles.count  / titles.count / 2 - 15, 1.5)];
        _indicatorView.backgroundColor = getColor(@"584f60");
        _indicatorView.centerX = buttonWidth / 2;
        [self addSubview:_indicatorView];
    }
    return self;
}

-(void)buttonClick:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(buttonClick:)]) {
        [self.delegate buttonClick:sender];
    }
}

@end

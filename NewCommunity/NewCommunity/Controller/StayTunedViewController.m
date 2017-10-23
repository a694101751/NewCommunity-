//
//  StayTunedViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/25.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "StayTunedViewController.h"

@interface StayTunedViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *width;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height;

@end

@implementation StayTunedViewController

-(void)setWidth:(NSLayoutConstraint *)width
{
    _width = width;
    _width.constant = SCREEN_WIDTH;
}

-(void)setHeight:(NSLayoutConstraint *)height
{
    _height = height;
    _height.constant = SCREEN_WIDTH / 0.25;
}

-(void)setBackImageView:(UIImageView *)backImageView
{
    _backImageView = backImageView;
    if ([self.imageString isEqualToString:@"stayTunedFor_bg"]) {
        _backImageView.contentMode = UIViewContentModeCenter;
    }
    else
    {
        _backImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    _backImageView.image = [UIImage imageNamed:self.imageString];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

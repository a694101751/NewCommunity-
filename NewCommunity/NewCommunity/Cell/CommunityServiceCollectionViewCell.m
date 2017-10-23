//
//  CommunityServiceCollectionViewCell.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/25.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "CommunityServiceCollectionViewCell.h"

@implementation CommunityServiceCollectionViewCell

-(void)setImageView:(UIImageView *)imageView
{
    _imageView = imageView;
    _imageView.layer.cornerRadius = 5;
    _imageView.layer.masksToBounds = YES;
}

@end

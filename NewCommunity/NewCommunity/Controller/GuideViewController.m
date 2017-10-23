//
//  GuideViewController.m
//  TCCulture
//
//  Created by soldier on 2017/2/17.
//  Copyright © 2017年 Binky Lee. All rights reserved.
//

#import "GuideViewController.h"
static const    NSInteger   kGuideCount = 3;

@interface GuideViewController ()

@end


@implementation GuideViewController

-(void) viewDidLoad{
    [super viewDidLoad];
    
    
    // 引导页ScrollView
    UIScrollView *guideScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    guideScrollView.delegate = self;
    guideScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*kGuideCount, SCREEN_HEIGHT);
    guideScrollView.pagingEnabled = YES;
    guideScrollView.bounces = NO;
    guideScrollView.showsHorizontalScrollIndicator = NO;
    
    // 引导页ImageViews
    NSArray *guideImgArray;
    if (SCREEN_HEIGHT == 480)
    {
        guideImgArray = @[@"guide480h_1", @"guide480h_2", @"guide480h_3"];
    }
    else if(SCREEN_WIDTH>375)
    {
        guideImgArray = @[@"guide568h+_1", @"guide568h+_2", @"guide568h+_3"];
    }else
    {
        guideImgArray = @[@"guide480h+_1", @"guide480h+_2", @"guide480h+_3"];
    }
    UIImageView *lastGuideImageView;
    for (int i = 0; i < kGuideCount; i ++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        imageView.image = [UIImage imageNamed:guideImgArray[i]];
        
        [guideScrollView addSubview:imageView];
        
        if (i == kGuideCount-1)
        {
            lastGuideImageView = imageView;
            lastGuideImageView.userInteractionEnabled = YES;
        }
    }
    
    // 进入应用按钮
    CGFloat tempY;
    if (SCREEN_HEIGHT == 480)
    {
        tempY = SCREEN_HEIGHT-SCALE(140);
    }
    else
    {
        tempY = SCREEN_HEIGHT-SCALE(120);
    }
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(80, tempY, SCREEN_WIDTH-160, 80)];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(enterAppBtnClick)];
//    [view setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:0 alpha:0.5]];
    tapGesture.numberOfTapsRequired = 1; // 单击
    [view addGestureRecognizer:tapGesture];
    [lastGuideImageView addSubview:view];
    
    // 引导页PageControl
    if (SCREEN_HEIGHT == 480)
    {
        tempY = SCREEN_HEIGHT-19-22;
    }
    else
    {
        tempY = SCREEN_HEIGHT-34-22;
    }
    
    guidePageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, tempY, SCREEN_WIDTH, 22)];
    guidePageControl.numberOfPages = kGuideCount;
    guidePageControl.alpha = 0.8;
    guidePageControl.userInteractionEnabled = NO;
    //        guidePageControl.currentPageIndicatorTintColor = DEF_HEX_RGBA(0xff7733, 1);
    //        guidePageControl.pageIndicatorTintColor = DEF_HEX_RGBA(0xd9d9d9, 1);
    
    // 引导页控制器
    [self.view addSubview:guideScrollView];
    //    [self.view addSubview:guidePageControl];
}

-(void) enterAppBtnClick{
    //    [(AppDelegate *)[UIApplication sharedApplication].delegate enterHomeViewController];
    self.enterBtnClickBlock();
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    guidePageControl.currentPage = scrollView.contentOffset.x/SCREEN_WIDTH;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

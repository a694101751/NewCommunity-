//
//  GuideViewController.h
//  TCCulture
//
//  Created by soldier on 2017/2/17.
//  Copyright © 2017年 Binky Lee. All rights reserved.
//

#import "BaseViewController.h"

@interface GuideViewController : UIViewController <UIScrollViewDelegate>
{
    UIPageControl   *guidePageControl;
}

@property(nonatomic,strong) void (^enterBtnClickBlock)(void);

@end

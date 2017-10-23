//
//  Config.h
//  TianjinBoHai
//
//  Created by 李莹 on 15/1/16.
//  Copyright (c) 2015年 Binky Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//打印方法名，行数
#ifdef DEBUG
#   define DLOG(fmt, ...) NSLog((@"********\n%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLOG(...)
#endif

//debug log
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#   define DLogRect(rect)  DLog(@"%s x=%f, y=%f, w=%f, h=%f", #rect, rect.origin.x, rect.origin.y,rect.size.width, rect.size.height)
#   define DLogPoint(pt) DLog(@"%s x=%f, y=%f", #pt, pt.x, pt.y)
#   define DLogSize(size) DLog(@"%s w=%f, h=%f", #size, size.width, size.height)
#   define DLogColor(_COLOR) DLog(@"%s h=%f, s=%f, v=%f", #_COLOR, _COLOR.hue, _COLOR.saturation, _COLOR.value)
#   define DLogSuperViews(_VIEW) { for (UIView* view = _VIEW; view; view = view.superview) { GBLog(@"%@", view); } }
#   define DLogSubViews(_VIEW) \
{ for (UIView* view in [_VIEW subviews]) { GBLog(@"%@", view); } }
#   else
#   define DLog(...)
#   define DLogRect(rect)
#   define DLogPoint(pt)
#   define DLogSize(size)
#   define DLogColor(_COLOR)
#   define DLogSuperViews(_VIEW)
#   define DLogSubViews(_VIEW)
#   endif

#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define DOBJ(obj)  DLOG(@"%s: %@", #obj, [(obj) description])
//当前方法和行数
#define MARK    NSLog(@"********%@\nMARK: %s, %d",[self class] , __PRETTY_FUNCTION__, __LINE__)

#define WS(weakSelf) __weak __typeof(&*self) weakSelf = self

#define SCALE(X) (ceil(X * [UIScreen mainScreen].bounds.size.width/320.0))
#define SCALEIPHONE6(X) (ceil(X * [UIScreen mainScreen].bounds.size.width/375.0))

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define IntNumberFormatter(number) ({NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];     [formatter setPositiveFormat:@"###,###"]; NSString *string = [formatter stringFromNumber:number]; string;})

#define  DEF_AvatarBitmap @"touxiang"
#define  DEF_DefauleBG @"default_bg"
//背景图片高度为屏宽的一半
#define kDefaultBGHeight (SCREEN_WIDTH * 0.5)
#define DEF_MAINGREENCOLOR @"00d78d"

#define  iPhoneX (SCREEN_WIDTH == 375.f && SCREEN_HEIGHT == 812.f ? YES : NO)

#define  statusBarHeight (iPhoneX ? 44.f : 20.f)

#define  navigationBarHeight  44.f

#define  tabbarHeight  (iPhoneX ? (49.f+34.f) : 49.f)

#define  tabbarSafeBottomMargin  (iPhoneX ? 34.f : 0.f)

#define  statusBarAndNavigationBarHeight (iPhoneX ? 88.f : 64.f)

#define viewSafeAreInsets(view) ({UIEdgeInsets insets; if(@available(iOS 11.0, *)) {insets = view.safeAreaInsets;} else {insets = UIEdgeInsetsZero;} insets;})
//常用字号
#define Define_SystemFont6 [UIFont systemFontOfSize:SCALE(6)]
#define Define_SystemFont7 [UIFont systemFontOfSize:SCALE(7)]
#define Define_SystemFont8 [UIFont systemFontOfSize:SCALE(8)]
#define Define_SystemFont9 [UIFont systemFontOfSize:SCALE(9)]
#define Define_SystemFont10 [UIFont systemFontOfSize:SCALE(10)]
#define Define_SystemFont11 [UIFont systemFontOfSize:SCALE(11)]
#define Define_SystemFont12 [UIFont systemFontOfSize:SCALE(12)]
#define Define_SystemFont13 [UIFont systemFontOfSize:SCALE(13)]
#define Define_SystemFont14 [UIFont systemFontOfSize:SCALE(14)]
#define Define_SystemFont15 [UIFont systemFontOfSize:SCALE(15)]
#define Define_SystemFont16 [UIFont systemFontOfSize:SCALE(16)]
#define Define_SystemFont17 [UIFont systemFontOfSize:SCALE(17)]
#define Define_SystemFont18 [UIFont systemFontOfSize:SCALE(18)]
#define Define_SystemFont19 [UIFont systemFontOfSize:SCALE(19)]
#define Define_SystemFont20 [UIFont systemFontOfSize:SCALE(20)]
#define Define_SystemFont21 [UIFont systemFontOfSize:SCALE(21)]
#define Define_SystemFont22 [UIFont systemFontOfSize:SCALE(22)]
#define Define_SystemFont23 [UIFont systemFontOfSize:SCALE(23)]
#define Define_SystemFont24 [UIFont systemFontOfSize:SCALE(24)]
#define Define_SystemFont25 [UIFont systemFontOfSize:SCALE(25)]

#define Define_SystemIphone6Font6 [UIFont systemFontOfSize:SCALEIPHONE6(6)]
#define Define_SystemIphone6Font7 [UIFont systemFontOfSize:SCALEIPHONE6(7)]
#define Define_SystemIphone6Font8 [UIFont systemFontOfSize:SCALEIPHONE6(8)]
#define Define_SystemIphone6Font9 [UIFont systemFontOfSize:SCALEIPHONE6(9)]
#define Define_SystemIphone6Font10 [UIFont systemFontOfSize:SCALEIPHONE6(10)]
#define Define_SystemIphone6Font11 [UIFont systemFontOfSize:SCALEIPHONE6(11)]
#define Define_SystemIphone6Font12 [UIFont systemFontOfSize:SCALEIPHONE6(12)]
#define Define_SystemIphone6Font13 [UIFont systemFontOfSize:SCALEIPHONE6(13)]
#define Define_SystemIphone6Font14 [UIFont systemFontOfSize:SCALEIPHONE6(14)]
#define Define_SystemIphone6Font15 [UIFont systemFontOfSize:SCALEIPHONE6(15)]
#define Define_SystemIphone6Font16 [UIFont systemFontOfSize:SCALEIPHONE6(16)]
#define Define_SystemIphone6Font17 [UIFont systemFontOfSize:SCALEIPHONE6(17)]
#define Define_SystemIphone6Font18 [UIFont systemFontOfSize:SCALEIPHONE6(18)]
#define Define_SystemIphone6Font19 [UIFont systemFontOfSize:SCALEIPHONE6(19)]
#define Define_SystemIphone6Font20 [UIFont systemFontOfSize:SCALEIPHONE6(20)]
#define Define_SystemIphone6Font21 [UIFont systemFontOfSize:SCALEIPHONE6(21)]
#define Define_SystemIphone6Font22 [UIFont systemFontOfSize:SCALEIPHONE6(22)]
#define Define_SystemIphone6Font23 [UIFont systemFontOfSize:SCALEIPHONE6(23)]
#define Define_SystemIphone6Font24 [UIFont systemFontOfSize:SCALEIPHONE6(24)]
#define Define_SystemIphone6Font25 [UIFont systemFontOfSize:SCALEIPHONE6(25)]
#define Define_SystemIphone6Font28 [UIFont systemFontOfSize:SCALEIPHONE6(28)]
#define Define_SystemIphone6Font30 [UIFont systemFontOfSize:SCALEIPHONE6(30)]
#define Define_SystemIphone6Font40 [UIFont systemFontOfSize:SCALEIPHONE6(40)]

#define DEF_SuccessStauts 0
#define DEF_NoNexistenceStauts 2
#define DEF_TabooStauts 3
#define DEF_OverdueStauts 5
// string change to number 
#define SCTN(x) ({ NSNumber * nums = @([x integerValue]);nums;})

@interface Config : NSObject
UIColor* getColor(NSString * hexColor);
@end

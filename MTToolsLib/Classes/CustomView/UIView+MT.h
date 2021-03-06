//
//  UIView+MT.h
//  TToolsHelper
//
//  Created by xiejc on 2017/7/31.
//  Copyright © 2017年 Xiejc. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UI_IS_IPHONE4  ([[UIScreen mainScreen] bounds].size.height < 568.0)
#define UI_IS_IPHONE5  ([[UIScreen mainScreen] bounds].size.height == 568.0)
#define UI_IS_IPHONE6  ([[UIScreen mainScreen] bounds].size.height == 667.0)
#define UI_IS_IPHONE6PLUS  ([[UIScreen mainScreen] bounds].size.height == 736.0 || [[UIScreen mainScreen] bounds].size.width == 736.0)
#define UI_IS_IPHONEX (Screen_Height == 812.0 || Screen_Height == 896.0)

#define Screen_Width  [UIScreen mainScreen].bounds.size.width
#define Screen_Height [UIScreen mainScreen].bounds.size.height

#define ViewByNib(nibName) [UIView viewByNib:nibName]
#define ViewByNibWithClass(class) [UIView viewByNib:NSStringFromClass(class)]


@interface UIView (MT)

/**
 *  获取当前App的view window
 *
 *  @return 当前View的窗口
 */
+ (UIWindow *)getCurrentWindow;


/**
 从nib创建view

 @param nibName nibname
 @return view
 */
+ (id)viewByNib:(NSString *)nibName;

/**
 *  获取view的显示 ViewController
 *
 *  @return 显示ViewController
 */
- (UIViewController *)viewControllerOwnner;


/**
 *  清除view的所有子View
 */
- (void)clearAllSubViews;

/**
 *  截图视图
 *
 *  @return 截图图片
 */
- (UIImage *)captureImage;


#pragma mark - corner

/**
 *  圆角化页面
 *
 *  @param cornerR     圆角半径
 *  @param borderColor 边线颜色
 */
- (void)cornerWithRadius:(float)cornerR borderColor:(UIColor *)borderColor;

- (void)cornerWithRadius:(float)cornerR borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;

/**
 半圆角化

 @param borderColor 边线颜色
 */
- (void)cornerHalfWithBorderColor:(UIColor *)borderColor;

/**
 *  顶部圆角化页面
 *
 *  @param cornerR     圆角半径
 *  @param borderColor 边线颜色
 */
- (void)cornerTopWithRadius:(float)cornerR borderColor:(UIColor *)borderColor;


/**
 添加四边阴影颜色

 @param color color
 */
- (void)shadowWithColor:(UIColor *)color;

/**
 添加四边阴影效果
 
 @param offset 偏移量
 @param cornerR 阴影半径
 @param theColor 阴影颜色
 @param shadowOpacity 阴影透明度
 */
- (void)shadowWithOffset:(float)offset raduis:(float)cornerR color:(UIColor *)color opacity:(float)opacity;



#pragma mark - frame

- (CGFloat)x;

- (CGFloat)y;

- (CGFloat)width;

- (CGFloat)height;

- (void)resetXFrame:(float)x;

- (void)resetYFrame:(float)y;

- (void)resetWidthFrame:(float)w;

- (void)resetHeightFrame:(float)h;


@end

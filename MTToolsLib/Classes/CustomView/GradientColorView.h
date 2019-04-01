//
//  GradientColorView.h
//  AutoReport
//
//  Created by xiejc on 2017/10/19.
//  Copyright © 2017年 newbee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GradientColorView : UIView


//上下填充渐变色 location:@[@(0.4f), @(1.0f)]
- (void)fillTBChangeColorWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor location:(NSArray *)location;

//上下填充渐变色 默认location:@[@(0.5f), @(1.0f)]
- (void)fillTBChangeColorWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor;

//左右填充渐变色 默认location:@[@(0.5f), @(1.0f)]
- (void)fillLRChangeColorWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor;

//上下填充渐变色 location:@[@(0.3f),@(0.5), @(1.0f)]
- (void)fillTBChangeColorWithStartColors:(NSArray *)ColorList ;

@end

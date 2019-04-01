//
//  GradientColorView.m
//  AutoReport
//
//  Created by xiejc on 2017/10/19.
//  Copyright © 2017年 newbee. All rights reserved.
//

#import "GradientColorView.h"

typedef enum {
    ColorGradientDirection_TB,   // 上下, 默认
    ColorGradientDirection_LR,   //左右
} ColorGradientDirection;

@interface GradientColorView ()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end

@implementation GradientColorView

- (void)fillTBChangeColorWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor {
    [self fillTBChangeColorWithStartColor:startColor endColor:endColor location:@[@(0.5f), @(1.0f)]];
}

- (void)fillTBChangeColorWithStartColors:(NSArray *)ColorList {
    [self fillColorSTBChangeColorWithStartColors:ColorList location:@[@(0.06f),@(0.6),@(1.0f)] direction:ColorGradientDirection_TB];
}

- (void)fillTBChangeColorWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor location:(NSArray *)location {
    [self fillChangeColorWithStartColor:startColor endColor:endColor location:location direction:ColorGradientDirection_TB];
}

- (void)fillLRChangeColorWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor {
    [self fillLRChangeColorWithStartColor:startColor endColor:endColor location:nil];
}

- (void)fillLRChangeColorWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor location:(NSArray *)location {
    [self fillChangeColorWithStartColor:startColor endColor:endColor location:location direction:ColorGradientDirection_LR];
}

/*
 *  填充颜色
 *  startColor: 起始颜色
 *  endColor:   结束颜色
 *  location:   颜色区间
 *  type:       渐变方向
 */
- (void)fillChangeColorWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor location:(NSArray *)location direction:(ColorGradientDirection)type  {
    if (self.gradientLayer == nil) {
        //初始化CAGradientlayer对象，使它的大小为UIView的大小
        self.gradientLayer = [CAGradientLayer layer];
        
        //将CAGradientlayer对象添加在我们要设置背景色的视图的layer层
        [self.layer addSublayer:self.gradientLayer];
    }
    
    //设置渐变区域的起始和终止位置（范围为0-1）
    CGPoint startPoint;
    CGPoint endPoint;
    switch (type) {
        case ColorGradientDirection_LR:
        {
            startPoint = CGPointMake(0, 0);
            endPoint = CGPointMake(1, 0);
        }
            break;
        default:
        {
            startPoint = CGPointMake(0, 0);
            endPoint = CGPointMake(0, 1);
        }
            break;
    }

    self.gradientLayer.startPoint = startPoint;
    self.gradientLayer.endPoint = endPoint;

    //设置颜色数组
    self.gradientLayer.colors = @[(__bridge id)startColor.CGColor,
                                  (__bridge id)endColor.CGColor];
    
    //设置颜色分割点（范围：0-1）
    self.gradientLayer.locations = location;
}


/*
 *  填充颜色
 *  startColor: 起始颜色
 *  endColor:   结束颜色
 *  location:   颜色区间
 *  type:       渐变方向
 */
- (void)fillColorSTBChangeColorWithStartColors:(NSArray *)ColorList location:(NSArray *)location direction:(ColorGradientDirection)type  {
    if (self.gradientLayer == nil) {
        //初始化CAGradientlayer对象，使它的大小为UIView的大小
    
        self.gradientLayer = [CAGradientLayer layer];
        
        //将CAGradientlayer对象添加在我们要设置背景色的视图的layer层
        [self.layer addSublayer:self.gradientLayer];
    }
    
    //设置渐变区域的起始和终止位置（范围为0-1）
    CGPoint startPoint;
    CGPoint endPoint;
    switch (type) {
        case ColorGradientDirection_LR:
        {
            startPoint = CGPointMake(0, 0);
            endPoint = CGPointMake(1, 0);
        }
            break;
        default:
        {
            startPoint = CGPointMake(0, 0);
            endPoint = CGPointMake(0, 1);
        }
            break;
    }
    
    self.gradientLayer.startPoint = startPoint;
    self.gradientLayer.endPoint = endPoint;
    
    //设置颜色数组
    UIColor *starColor = [ColorList objectAtIndex:0];
    UIColor *middleColor = [ColorList objectAtIndex:1];
    UIColor *endColor = [ColorList objectAtIndex:2];
    self.gradientLayer.colors= @[(__bridge id)starColor.CGColor, (__bridge id)middleColor.CGColor, (__bridge id)endColor.CGColor];
    
    //设置颜色分割点（范围：0-1）
    self.gradientLayer.locations = location;
}





- (void)layoutSubviews {
    [super layoutSubviews];
    self.gradientLayer.frame = self.bounds;
}

@end

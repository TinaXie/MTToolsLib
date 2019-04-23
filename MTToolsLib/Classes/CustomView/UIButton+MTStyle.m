//
//  UIButton+MTStyle.m
//  BAIHC
//
//  Created by xiejc on 2019/3/28.
//  Copyright © 2019 YYCloud. All rights reserved.
//

#import "UIButton+MTStyle.h"

@implementation UIButton (MTStyle)

- (void)setShowType:(MTButtonType)type space:(CGFloat)space {
    [self layoutIfNeeded];
    [self customFrame:type space:space];
}

- (void)customFrame:(MTButtonType)type space:(CGFloat)space {
    CGFloat totalH = CGRectGetHeight(self.bounds);
    CGFloat toalW = CGRectGetWidth(self.bounds);
    
    CGFloat titleW = CGRectGetWidth(self.titleLabel.bounds);//titleLabel的宽度
    CGFloat titleH = CGRectGetHeight(self.titleLabel.bounds);//titleLabel的高度
    
    CGFloat imageW = CGRectGetWidth(self.imageView.bounds);//imageView的宽度
    CGFloat imageH = CGRectGetHeight(self.imageView.bounds);//imageView的高度
    
    CGFloat btnCenterX = CGRectGetWidth(self.bounds)/2;//按钮中心点X的坐标（以按钮左上角为原点的坐标系）
    CGFloat imageCenterX = btnCenterX - titleW/2;//imageView中心点X的坐标（以按钮左上角为原点的坐标系）
    CGFloat titleCenterX = btnCenterX + imageW/2;//titleLabel中心点X的坐标（以按钮左上角为原点的坐标系）
    
    
    CGRect titleFrame = self.titleLabel.frame;
    CGRect imageFrame = self.imageView.frame;
    
    switch (type) {
        case MTButtonType_Top:
        {
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageFrame.size.width), imageFrame.size.height + space, 0);
            self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, totalH - imageH, 0);
        }
            break;
        case MTButtonType_Bottom:
        {
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageFrame.size.width), imageFrame.size.height + space, 0);
            self.imageEdgeInsets = UIEdgeInsetsMake(totalH - imageH, (titleFrame.size.width), 0, 0);
        }
            break;
        case MTButtonType_Left:
        {
            self.titleEdgeInsets = UIEdgeInsetsMake(0, space/2, 0,  -space/2);
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -space/2, 0, space);
        }
            break;
        case MTButtonType_Right:
        {
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageW + space/2), 0, imageW + space/2);
            self.imageEdgeInsets = UIEdgeInsetsMake(0, titleW+space/2, 0, -(titleW+space/2));
        }
            break;
        default:
            break;
    }
    
}

@end

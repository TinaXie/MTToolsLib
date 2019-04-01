//
//  UIImage+MT.h
//  AutoReport
//
//  Created by xiejc on 2017/10/25.
//  Copyright © 2017年 newbee. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MT_RenderOriginImage(imageName) [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
#define MT_TintImage(imageName, colorStr) [[UIImage imageNamed:imageName] mt_imageForTintColor:MTColorHex(colorStr)]


@interface UIImage (MT)

+ (UIImage *)mt_imageNamed:(NSString *)imageName;

+ (UIImage *)mt_imageNamed:(NSString *)imageName
                  inBundle:(NSString *)bundleName;

+ (UIImage *)mt_imageNamed:(NSString *)imageName
                  inBundle:(NSString *)bundleName
              forframework:(NSString *)frameworkName;


+ (UIImage *)mt_imageWithColor:(UIColor *)color;

+ (UIImage *)mt_imageWithColor:(UIColor *)color
                          size:(CGSize)size;

+ (UIImage *)mt_imageWithColor:(UIColor *)color
                          size:(CGSize)size
                  cornerRadius:(CGFloat)cornerRadius;


- (UIImage *)mt_imageForTintColor:(UIColor *)tintColor;

- (UIImage *)mt_imageForTintColor:(UIColor *)tintColor
                        blendMode:(CGBlendMode)blendMode;


- (UIImage *)renderLRColors:(NSArray*)colors;



- (UIImage *)tintColor:(UIColor *)tintColor;

@end

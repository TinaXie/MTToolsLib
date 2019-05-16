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



/**
 *  等比缩放图片裁剪指定区域图片
 *  @param size  裁剪范围
 *
 *  @return 裁剪后的图片
 */
- (UIImage *)compressImageToSize:(CGSize)size;

/**
 *  指定Size压缩图片 (图片会压缩变形)
 *  @param size  压缩size
 *
 *  @return 压缩后的图片
 */
- (UIImage *)scaleImageToSize:(CGSize)size;

/**
 剪裁图片

 @param rect 截取图片区域
 @return 返回截取的图片
 */
- (UIImage *)cropImageInRect:(CGRect)rect;


/**
 按比例缩放图片

 @param scaleRatio 比例
 @return 返回缩放的图片
 */
- (UIImage *)scaleImageToRatio:(float)scaleRatio;

@end

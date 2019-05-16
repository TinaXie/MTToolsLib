//
//  UIImage+MT.m
//  AutoReport
//
//  Created by xiejc on 2017/10/25.
//  Copyright © 2017年 newbee. All rights reserved.
//

#import "UIImage+MT.h"

#define _MTUIKitBundleNameSuffix        @".bundle"
#define _MTUIKitFrameworkNameSuffix     @".framework"

typedef enum  {
    GradientTypeTB = 0,//从上到小
    GradientTypeLR = 1,//从左到右
    GradientTypeULLR = 2,//左上到右下
    GradientTypeURLL = 3,//右上到左下
} GradientType;


@implementation UIImage (MT)

- (UIImage *)renderLRColors:(NSArray*)colors {
    return [self renderColors:colors gradientType:GradientTypeLR];
}

- (UIImage *)renderColors:(NSArray*)colors gradientType:(GradientType)gradientType {
    NSMutableArray *ar = [NSMutableArray array];
    for(UIColor *c in colors) {
        [ar addObject:(id)c.CGColor];
    }
    
    CGFloat w = self.size.width;
    CGFloat h = self.size.height;
    
    UIGraphicsBeginImageContextWithOptions(self.size, YES, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, NULL);
    CGPoint start;
    CGPoint end;
    switch (gradientType) {
        case GradientTypeTB:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(0.0, h);
            break;
        case GradientTypeLR:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(w, 0.0);
            break;
        case GradientTypeULLR:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(w, h);
            break;
        case GradientTypeURLL:
            start = CGPointMake(w, 0.0);
            end = CGPointMake(0.0, h);
            break;
        default:
            break;
    }
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    return newImage;
}


+ (UIImage *)mt_imageNamed:(NSString *)imageName{
    return [self mt_imageNamed:imageName
                      inBundle:nil];
}

+ (UIImage *)mt_imageNamed:(NSString *)imageName
                  inBundle:(NSString *)bundleName{
    return [self mt_imageNamed:imageName
                      inBundle:bundleName
                  forframework:nil];
}

+ (UIImage *)mt_imageNamed:(NSString *)imageName
                  inBundle:(NSString *)bundleName
              forframework:(NSString *)frameworkName{
    if(!imageName || imageName.length == 0){
        return nil;
    }
    
    if(!bundleName || bundleName.length == 0){
        return [UIImage imageNamed:imageName];
    }
    
    if(![bundleName hasSuffix:_MTUIKitBundleNameSuffix]){
        bundleName = [NSString stringWithFormat:@"%@%@", bundleName, _MTUIKitBundleNameSuffix];
    }
    
    NSString *_imageName = [bundleName stringByAppendingPathComponent:imageName];
    UIImage *image = [UIImage imageNamed:_imageName];
    if(image){
        return image;
    }
    
    if(!frameworkName || frameworkName.length == 0){
        return nil;
    }
    
    if(![frameworkName hasSuffix:_MTUIKitFrameworkNameSuffix]){
        frameworkName = [NSString stringWithFormat:@"%@%@", frameworkName, _MTUIKitFrameworkNameSuffix];
    }
    
    bundleName = [NSString stringWithFormat:@"Frameworks/%@/%@", frameworkName, bundleName];
    
    _imageName = [bundleName stringByAppendingPathComponent:imageName];
    return [UIImage imageNamed:_imageName];
}

+ (UIImage *)mt_imageWithColor:(UIColor *)color{
    return [self mt_imageWithColor:color size:CGSizeMake(1.0, 1.0)];
}

+ (UIImage *)mt_imageWithColor:(UIColor *)color size:(CGSize)size{
    if(!color || size.width == 0 || size.height == 0){
        return nil;
    }
    
    CGRect rect = (CGRect){CGPointZero, size};
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)mt_imageWithColor:(UIColor *)color size:(CGSize)size cornerRadius:(CGFloat)cornerRadius {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, UIScreen.mainScreen.scale);
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(contextRef, color.CGColor);
    CGContextFillRect(contextRef, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContextWithOptions(size, NO, UIScreen.mainScreen.scale);
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius];
    [bezierPath addClip];
    
    [image drawInRect:rect];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


- (UIImage *)mt_imageForTintColor:(UIColor *)tintColor{
    return [self mt_imageForTintColor:tintColor blendMode:kCGBlendModeDestinationIn];
}

- (UIImage *)mt_imageForTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode{
    if(!tintColor){
        return self;
    }
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [UIScreen mainScreen].scale);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    
    [self drawInRect:bounds blendMode:blendMode alpha:1.0];
    
    if (blendMode != kCGBlendModeDestinationIn) {
        [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0];
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)tintColor:(UIColor *)tintColor {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextClipToMask(context, rect, self.CGImage);
    [tintColor setFill];
    CGContextFillRect(context, rect);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


/**
 *  等比缩放图片裁剪指定区域图片
 *
 *  @param size  裁剪范围
 *
 *  @return 裁剪后的图片
 */
- (UIImage *)compressImageToSize:(CGSize)size {
    // 原图宽
    CGFloat imageWidth = self.size.width;
    // 原图高
    CGFloat imageHeight = self.size.height;
    
    // 缩放比例
    CGFloat widthScale = imageWidth /size.width;
    CGFloat heightScale = imageHeight /size.height;
    
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(CGSizeMake(size.width, size.height));
    
    // 横屏图片
    if (widthScale > heightScale) {
        [self drawInRect:CGRectMake(0, 0, imageWidth /heightScale , size.height)];
    } else { // 竖屏图片
        [self drawInRect:CGRectMake(0, 0, size.width , imageHeight /widthScale)];
    }
    
    // 从当前context中创建一个改变大小后的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    return newImage;
}

/**
 *  指定Size压缩图片 (图片会压缩变形)
 *
 *  @param size  压缩size
 *
 *  @return 压缩后的图片
 */
- (UIImage *)scaleImageToSize:(CGSize)size {
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    // 从当前context中创建一个改变大小后的图片
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    // 返回新的改变大小后的图片
    return scaledImage;
}

//剪裁图片
- (UIImage *)cropImageInRect:(CGRect)rect {
    CGImageRef subImageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    
    UIGraphicsBeginImageContext(smallBounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallBounds, subImageRef);
    UIImage *smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    return smallImage;
}



- (UIImage *)scaleImageToRatio:(float)scaleRatio {
    UIGraphicsBeginImageContext(CGSizeMake(self.size.width * scaleRatio,
                                           self.size.height * scaleRatio));
    [self drawInRect:CGRectMake(0, 0,
                                self.size.width * scaleRatio,
                                self.size.height * scaleRatio)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}


@end

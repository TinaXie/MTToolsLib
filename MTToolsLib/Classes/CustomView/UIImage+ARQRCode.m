//
//  UIImage+ARQRCode.m
//  AutoReport
//
//  Created by 吴晓泉 on 2017/6/12.
//  Copyright © 2017年 newbee. All rights reserved.
//

#import "UIImage+ARQRCode.h"

@implementation UIImage (ARQRCode)

/**
 *  生成二维码
 */
+ (UIImage *)creatCIQRCodeImageWithString:(NSString *)dataString
                                     size:(CGFloat)size {
    return [UIImage creatCICodeImageWithString:dataString size:CGSizeMake(size, size) filterName:@"CIQRCodeGenerator"];
}

/**
 *  生成条形码
 */
+ (UIImage *)creatCIBarCodeImageWithString:(NSString *)dataString
                                      size:(CGSize)size {
    return [UIImage creatCICodeImageWithString:dataString size:size filterName:@"CICode128BarcodeGenerator"];
}



+ (UIImage *)creatCICodeImageWithString:(NSString *)dataString
                                   size:(CGSize)size
                             filterName:(NSString *)filterName {
    if (filterName == nil || dataString == nil) {
        return nil;
    }
    
    CIFilter *filter = [CIFilter filterWithName:filterName];
    [filter setDefaults];
    NSData *data = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKeyPath:@"inputMessage"];
    CIImage *outputImage = [filter outputImage];
    
    UIImage *barImage = [UIImage resizeCodeImage:outputImage size:size];
    return barImage;
}



/**
 *  根据CIImage生成指定大小的UIImage
 *
 *  @param image CIImage
 *  @param size  图片宽度
 *
 *  @return 生成的高清的UIImage
 */
+ (UIImage *)resizeCodeImage:(CIImage *)image size:(CGSize)size {
    if (image == nil) {
        return nil;
    }
    CGRect extent = CGRectIntegral(image.extent);
    
    CGFloat scaleWidth = size.width/CGRectGetWidth(extent);
    CGFloat scaleHeight = size.height/CGRectGetHeight(extent);
    
    size_t width = CGRectGetWidth(extent) * scaleWidth;
    size_t height = CGRectGetHeight(extent) * scaleHeight;
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceGray();
    CGContextRef contentRef = CGBitmapContextCreate(nil, width, height, 8, 0, colorSpaceRef, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef imageRef = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(contentRef, kCGInterpolationNone);
    CGContextScaleCTM(contentRef, scaleWidth, scaleHeight);
    CGContextDrawImage(contentRef, extent, imageRef);
    CGImageRef imageRefResized = CGBitmapContextCreateImage(contentRef);
    CGContextRelease(contentRef);
    CGImageRelease(imageRef);
    UIImage *img = [UIImage imageWithCGImage:imageRefResized];
    return img;
}

@end



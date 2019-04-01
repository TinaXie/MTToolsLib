//
//  UIImage+ARQRCode.h
//  AutoReport
//
//  Created by 吴晓泉 on 2017/6/12.
//  Copyright © 2017年 newbee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ARQRCode)

//生成二维码
+ (UIImage *)creatCIQRCodeImageWithString:(NSString *)dataString
                                     size:(CGFloat)size;

/**
 *  根据CIImage生成指定大小的UIImage
 *
 *  @param image CIImage
 *  @param size  图片宽度
 *
 *  @return 生成的高清的UIImage
 */
+ (UIImage *)creatNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat)size;


- (UIImage *)imageWithRoundedCornersSize:(float)cornerRadius;


@end

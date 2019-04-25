//
//  UIImage+ARQRCode.h
//  AutoReport
//
//  Created by 吴晓泉 on 2017/6/12.
//  Copyright © 2017年 newbee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ARQRCode)

/**
 *  生成二维码
 */
+ (UIImage *)creatCIQRCodeImageWithString:(NSString *)dataString
                                     size:(CGFloat)size;

/**
 *  生成条形码
 */
+ (UIImage *)creatCIBarCodeImageWithString:(NSString *)dataString
                                      size:(CGSize)size;




@end

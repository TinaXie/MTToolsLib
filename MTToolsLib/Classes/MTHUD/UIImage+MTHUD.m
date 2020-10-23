//
//  UIImage+MTHUD.m
//  MTToolsLib
//
//  Created by xiejc on 2020/10/23.
//

#import "UIImage+MTHUD.h"
#import "MTHUD.h"

@implementation UIImage (MTHUD)

+ (nullable UIImage *)bundle_imageNamed:(NSString *)imageName {
    CGFloat scale = [UIScreen mainScreen].scale;
    NSString *scaleStr = @"@2x";
    if (scale == 3.0) {
        scaleStr = @"@3x";
    }
    NSString *name = [imageName stringByAppendingString:scaleStr];
    NSString *imagePath = [[self bundle] pathForResource:name ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    if (!image) {
        // 兼容业务方自己设置图片的方式
        image = [UIImage imageNamed:imageName];
    }
    if (image == nil) {
        NSLog(@"====error:image:%@\n%@", imageName, image);
    }
    return image;
}


+ (NSBundle *)bundle {
    NSBundle *bundle = [NSBundle bundleForClass:[MTHUD class]];
    NSURL *bundleURL = [bundle URLForResource:@"MTHUD" withExtension:@"bundle"];
    return [NSBundle bundleWithURL:bundleURL];
}


@end

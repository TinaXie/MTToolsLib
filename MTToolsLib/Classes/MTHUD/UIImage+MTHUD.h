//
//  UIImage+MTHUD.h
//  MTToolsLib
//
//  Created by xiejc on 2020/10/23.
//

#import <UIKit/UIKit.h>

#define MTHUDImage(imageName) [UIImage bundle_imageNamed:imageName]

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (MTHUD)

+ (nullable UIImage *)bundle_imageNamed:(NSString *)imageName;

@end

NS_ASSUME_NONNULL_END

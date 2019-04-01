//
//  UIFont+MT.h
//  ARThirdTools
//
//  Created by xiejc on 2019/1/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define MTUIFontNamePingFangHK_Ultralight @"PingFangHK-Ultralight"
#define MTUIFontNamePingFangHK_Light @"PingFangHK-Light"
#define MTUIFontNamePingFangHK_Thin @"PingFangHK-Thin"
#define MTUIFontNamePingFangHK_Regular @"PingFangHK-Regular"
#define MTUIFontNamePingFangHK_Medium @"PingFangHK-Medium"
#define MTUIFontNamePingFangHK_Semibold @"PingFangHK-Semibold"

#define MTUIFontNamePingFangSC_Ultralight @"PingFangSC-Ultralight"
#define MTUIFontNamePingFangSC_Light @"PingFangSC-Light"
#define MTUIFontNamePingFangSC_Thin @"PingFangSC-Thin"
#define MTUIFontNamePingFangSC_Regular @"PingFangSC-Regular"
#define MTUIFontNamePingFangSC_Medium @"PingFangSC-Medium"
#define MTUIFontNamePingFangSC_Semibold @"PingFangSC-Semibold"

#define MTUIFontNamePingFangTC_Ultralight @"PingFangTC-Ultralight"
#define MTUIFontNamePingFangTC_Light @"PingFangTC-Light"
#define MTUIFontNamePingFangTC_Thin @"PingFangTC-Thin"
#define MTUIFontNamePingFangTC_Regular @"PingFangTC-Regular"
#define MTUIFontNamePingFangTC_Medium @"PingFangTC-Medium"
#define MTUIFontNamePingFangTC_Semibold @"PingFangTC-Semibold"

#define MTUIFontNameHelvetica_ @"Helvetica"
#define MTUIFontNameHelvetica_Bold @"Helvetica-Bold"
#define MTUIFontNameHelvetica_BoldOblique @"Helvetica-BoldOblique"
#define MTUIFontNameHelvetica_Light @"Helvetica-Light"
#define MTUIFontNameHelvetica_LightOblique @"Helvetica-LightOblique"
#define MTUIFontNameHelvetica_Oblique @"Helvetica-Oblique"

#define MTUIFontNameHelveticaNeue_ @"HelveticaNeue"
#define MTUIFontNameHelveticaNeue_Bold @"HelveticaNeue-Bold"
#define MTUIFontNameHelveticaNeue_BoldItalic @"HelveticaNeue-BoldItalic"
#define MTUIFontNameHelveticaNeue_CondensedBlack @"HelveticaNeue-CondensedBlack"
#define MTUIFontNameHelveticaNeue_CondensedBold @"HelveticaNeue-CondensedBold"
#define MTUIFontNameHelveticaNeue_Italic @"HelveticaNeue-Italic"
#define MTUIFontNameHelveticaNeue_Light @"HelveticaNeue-Light"
#define MTUIFontNameHelveticaNeue_LightItalic @"HelveticaNeue-LightItalic"
#define MTUIFontNameHelveticaNeue_Medium @"HelveticaNeue-Medium"
#define MTUIFontNameHelveticaNeue_MediumItalic @"HelveticaNeue-MediumItalic"
#define MTUIFontNameHelveticaNeue_UltraLight @"HelveticaNeue-UltraLight"
#define MTUIFontNameHelveticaNeue_UltraLightItalic @"HelveticaNeue-UltraLightItalic"
#define MTUIFontNameHelveticaNeue_Thin @"HelveticaNeue-Thin"
#define MTUIFontNameHelveticaNeue_ThinItalic @"HelveticaNeue-ThinItalic"

#define MT_PingFangSC_LightFont(size)    [UIFont mt_PingFangSC_LightFontOfSize:size]
#define MT_PingFangSC_RegularFont(size)  [UIFont mt_PingFangSC_RegularFontOfSize:size]
#define MT_PingFangSC_MediumFont(size)   [UIFont mt_PingFangSC_MediumFontOfSize:size]

#define MT_DefaultFontOfSize(size)      [UIFont mt_defaultFontOfSize:size]
#define MT_BoldDefaultFontOfSize(size)  [UIFont mt_boldDefaultFontOfSize:size]


@interface UIFont (MT)

+ (UIFont *)mt_defaultFontOfSize:(CGFloat)fontSize;
+ (UIFont *)mt_boldDefaultFontOfSize:(CGFloat)fontSize;

+ (UIFont *)mt_PingFangSC_UltralightFontOfSize:(CGFloat)fontSize;
+ (UIFont *)mt_PingFangSC_LightFontOfSize:(CGFloat)fontSize;
+ (UIFont *)mt_PingFangSC_ThinFontOfSize:(CGFloat)fontSize;
+ (UIFont *)mt_PingFangSC_RegularFontOfSize:(CGFloat)fontSize;
+ (UIFont *)mt_PingFangSC_MediumFontOfSize:(CGFloat)fontSize;
+ (UIFont *)mt_PingFangSC_SemiboldFontOfSize:(CGFloat)fontSize;

+ (UIFont *)mt_fontWithName:(NSString *)fontName size:(CGFloat)fontSize;

@end

NS_ASSUME_NONNULL_END

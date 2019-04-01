//
//  UIFont+MT.m
//  ARThirdTools
//
//  Created by xiejc on 2019/1/31.
//

#import "UIFont+MT.h"

typedef NS_ENUM(NSUInteger, MTUIFontStyle){
    MTUIFontStyleNormal,
    MTUIFontStyleBold,
    MTUIFontStyleItalic
};


MTUIFontStyle MTUIFontStyleFromFontName(NSString *fontName){
    NSString *component = [fontName componentsSeparatedByString:@"-"].lastObject.lowercaseString;
    if(!component || component.length == 0){
        return MTUIFontStyleNormal;
    }
    
    if([component rangeOfString:@"italic"].location != NSNotFound){
        return MTUIFontStyleItalic;
    }
    
    if([component rangeOfString:@"medium"].location != NSNotFound){
        return MTUIFontStyleBold;
    }
    
    if([component rangeOfString:@"bold"].location != NSNotFound){
        return MTUIFontStyleBold;
    }
    
    return MTUIFontStyleNormal;
}


@implementation UIFont (MT)


+ (UIFont *)mt_defaultFontOfSize:(CGFloat)fontSize{
    return [self mt_PingFangSC_RegularFontOfSize:fontSize];
}

+ (UIFont *)mt_boldDefaultFontOfSize:(CGFloat)fontSize{
    return [self mt_PingFangSC_MediumFontOfSize:fontSize];
}

+ (UIFont *)mt_PingFangSC_UltralightFontOfSize:(CGFloat)fontSize{
    return [self mt_fontWithName:MTUIFontNamePingFangSC_Ultralight size:fontSize];
}

+ (UIFont *)mt_PingFangSC_LightFontOfSize:(CGFloat)fontSize{
    return [self mt_fontWithName:MTUIFontNamePingFangSC_Light size:fontSize];
}

+ (UIFont *)mt_PingFangSC_ThinFontOfSize:(CGFloat)fontSize{
    return [self mt_fontWithName:MTUIFontNamePingFangSC_Thin size:fontSize];
}

+ (UIFont *)mt_PingFangSC_RegularFontOfSize:(CGFloat)fontSize{
    return [self mt_fontWithName:MTUIFontNamePingFangSC_Regular size:fontSize];
}

+ (UIFont *)mt_PingFangSC_MediumFontOfSize:(CGFloat)fontSize{
    return [self mt_fontWithName:MTUIFontNamePingFangSC_Medium size:fontSize];
}

+ (UIFont *)mt_PingFangSC_SemiboldFontOfSize:(CGFloat)fontSize{
    return [self mt_fontWithName:MTUIFontNamePingFangSC_Semibold size:fontSize];
}

+ (UIFont *)mt_fontWithName:(NSString *)fontName size:(CGFloat)fontSize{
    if(!fontName || fontName.length == 0){
        return [self systemFontOfSize:fontSize];
    }
    
    UIFont *font = [self fontWithName:fontName size:fontSize];
    if(font){
        return font;
    }
    
    MTUIFontStyle fontStyle = MTUIFontStyleFromFontName(fontName);
    if(fontStyle == MTUIFontStyleItalic){
        return [self italicSystemFontOfSize:fontSize];
    }
    
    if(fontStyle == MTUIFontStyleBold){
        return [self boldSystemFontOfSize:fontSize];
    }
    
    return [self systemFontOfSize:fontSize];
}


@end

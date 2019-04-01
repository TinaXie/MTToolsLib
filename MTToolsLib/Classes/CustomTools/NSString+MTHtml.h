//
//  NSString+MTHtml.h
//  ARThirdTools
//
//  Created by xiejc on 2019/4/1.
//

#import <Foundation/Foundation.h>

@interface NSString (MTHtml)

+ (NSAttributedString *)mt_attributedString:(NSString *)string
                           highlightedColor:(UIColor *)highlightedColor
                            highlightedFont:(UIFont *)highlightedFont;

+ (NSAttributedString *)mt_attributedHTML:(NSString *)HTML;

+ (NSAttributedString *)mt_attributedHTMLForPingFangSCRegularFont:(NSString *)HTML;

+ (NSAttributedString *)mt_attributedHTML:(NSString *)HTML forFont:(NSString *)fontName;

@end

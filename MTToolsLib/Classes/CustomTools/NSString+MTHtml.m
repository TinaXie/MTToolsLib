//
//  NSString+MTHtml.m
//  ARThirdTools
//
//  Created by xiejc on 2019/4/1.
//

#import "NSString+MTHtml.h"
#import "UIFont+MT.h"
#import "MTStringSymbolRange.h"

@implementation NSString (MTHtml)

+ (NSAttributedString *)mt_attributedString:(NSString *)string
                           highlightedColor:(UIColor *)highlightedColor
                            highlightedFont:(UIFont *)highlightedFont{
    if(!string || string.length == 0){
        return nil;
    }
    
    MTStringSymbolRange *symbolRange = [[MTStringSymbolRange alloc] initWithBeginSymbol:@"{" endSymbol:@"}" formatString:string];
    NSArray<NSValue *> *ranges = [symbolRange allRangesForPairedSymbol];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:[symbolRange replacedString]];
    for(NSValue *range in ranges){
        if(highlightedColor){
            [attributedString addAttribute:NSForegroundColorAttributeName
                                     value:highlightedColor
                                     range:range.rangeValue];
        }
        
        if(highlightedFont){
            [attributedString addAttribute:NSFontAttributeName
                                     value:highlightedFont
                                     range:range.rangeValue];
        }
    }
    
    return [attributedString copy];
}

+ (NSAttributedString *)mt_attributedHTML:(NSString *)HTML{
    return [self mt_attributedHTML:HTML forFont:nil];
}

+ (NSAttributedString *)mt_attributedHTMLForPingFangSCRegularFont:(NSString *)HTML{
    return [self mt_attributedHTML:HTML forFont:MTUIFontNamePingFangSC_Regular];
}

+ (NSAttributedString *)mt_attributedHTML:(NSString *)HTML forFont:(NSString *)fontName{
    if(!HTML || HTML.length == 0){
        return nil;
    }
    
    NSData *HTMLData = [HTML dataUsingEncoding:NSUnicodeStringEncoding];
    if(!HTMLData){
        return nil;
    }
    
    NSDictionary<NSString *, id> *options = @{NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType};
    NSAttributedString *attributedString = [[self alloc] initWithData:HTMLData options:options documentAttributes:nil error:nil];
    if(!fontName || fontName.length == 0){
        return attributedString;
    }
    
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:attributedString.string];
    [attributedString enumerateAttributesInRange:NSMakeRange(0, attributedString.string.length) options:0 usingBlock:^(NSDictionary<NSString *,id> * _Nonnull attrs, NSRange range, BOOL * _Nonnull stop) {
        NSMutableDictionary<NSString *, id> *attributes = [NSMutableDictionary dictionary];
        [attributes addEntriesFromDictionary:attrs];
        UIFont *font = attributes[NSFontAttributeName];
        if(font){
            attributes[NSFontAttributeName] = [UIFont mt_fontWithName:fontName size:font.pointSize];
            [mutableAttributedString setAttributes:attributes range:range];
        }
    }];
    
    return [mutableAttributedString copy];
}

@end

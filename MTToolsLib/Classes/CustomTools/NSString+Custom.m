//
//  NSString+Custom.m
//  ToolsHelper
//
//  Created by xiejc on 16/3/8.
//  Copyright © 2016年 bitcar . All rights reserved.
//

#import "NSString+Custom.h"
#import "NSString+MT.h"

@implementation NSString (Custom)

- (NSString *)mt_stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement {
    return [self stringByReplacingOccurrencesOfString:target withString:StringWithDefaultValue(replacement, @"")];
}

@end

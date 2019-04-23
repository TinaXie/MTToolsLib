//
//  NSString+MTDate.m
//  BAIHC
//
//  Created by xiejc on 2019/4/23.
//  Copyright © 2019 YYCloud. All rights reserved.
//

#import "NSString+MTDate.h"
#import "NSString+MT.h"

@implementation NSString (MTDate)

- (NSString *)dayString {
    return [self dayStringWithDateFormatter:@"yyyy-MM-dd HH:mm:ss" stringFormatter:@"yyyy-MM-dd"];
}

- (NSString *)dayDotString {
    return [self dayStringWithDateFormatter:@"yyyy-MM-dd HH:mm:ss" stringFormatter:@"yyyy.MM.dd"];
}

- (NSString *)dayStringWithDateFormatter:(NSString *)dateFormatter stringFormatter:(NSString *)stringFormatter {
    if ([NSString isNullString:self]) {
        return @"";
    }
    if (dateFormatter == nil || stringFormatter == nil) {
        return self;
    }

    // 日期格式化类
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = dateFormatter;
    NSDate *date = [format dateFromString:self];
    
    //转化为新格式
    format.dateFormat = stringFormatter;
    NSString *newString = [format stringFromDate:date];
    return newString;
}

@end

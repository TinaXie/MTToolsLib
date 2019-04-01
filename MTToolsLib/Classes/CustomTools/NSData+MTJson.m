//
//  NSData+MTJson.m
//  ZhongCaiHuaXiaCRM_iOS
//
//  Created by xiejc on 2019/1/31.
//  Copyright © 2019 xiejc. All rights reserved.
//

#import "NSData+MTJson.h"

@implementation NSData (MTJson)

- (NSString *)convertToJson {
    NSString *jsonString = [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range = {0, jsonString.length};
    
    //去掉字符串中的空格
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    NSRange range2 = {0, mutStr.length};
    
    //去掉字符串中的换行符
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    return mutStr;
}


@end


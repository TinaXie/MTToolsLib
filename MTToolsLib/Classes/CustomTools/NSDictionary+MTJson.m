//
//  NSDictionary+MTJson.m
//  ZhongCaiHuaXiaCRM_iOS
//
//  Created by xiejc on 2019/1/31.
//  Copyright © 2019 xiejc. All rights reserved.
//

#import "NSDictionary+MTJson.h"
#import "NSData+MTJson.h"

@implementation NSDictionary (MTJson)


+ (instancetype)convertFromJson:(NSString *)json {
    if (json == nil) {
        return nil;
    }
    
    NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json 解析失败：%@", err.localizedDescription);
        return nil;
    }
    return dic;
}

- (NSString *)convertToJson {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = nil;
    if (!jsonData) {
        NSLog(@"NSDictionary convertToJson error:%@",error);
    } else {
        jsonString = [jsonData convertToJson];
    }
    return jsonString;
}

@end

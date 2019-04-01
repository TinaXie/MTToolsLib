//
//  NSDictionary+MTJson.h
//  ZhongCaiHuaXiaCRM_iOS
//
//  Created by xiejc on 2019/1/31.
//  Copyright © 2019 xiejc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (MTJson)


/**
 将Json字符串转成Dictionary

 @param json json字符串
 @return 字符串
 */
+ (instancetype)convertFromJson:(NSString *)json;


/**
 将数据转换成Json数据

 @return json数据
 */
- (NSString *)convertToJson;

@end

NS_ASSUME_NONNULL_END

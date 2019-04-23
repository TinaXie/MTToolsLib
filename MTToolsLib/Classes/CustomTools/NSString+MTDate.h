//
//  NSString+MTDate.h
//  BAIHC
//
//  Created by xiejc on 2019/4/23.
//  Copyright © 2019 YYCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (MTDate)


/**
 格式化时间字符串: yyyy-MM-dd HH:mm:ss -> yyyy-MM-dd

 @return 日期字符串
 */
- (NSString *)dayString;

/**
 格式化时间字符串: yyyy-MM-dd HH:mm:ss -> yyyy.MM.dd
 
 @return 日期字符串
 */
- (NSString *)dayDotString;


/**
 格式化时间字符串

 @param dateFormatter 输入字符串的日期格式
 @param stringFormatter 输出字符串的格式
 @return 日期字符串
 */
- (NSString *)dayStringWithDateFormatter:(NSString *)dateFormatter stringFormatter:(NSString *)stringFormatter;

@end

NS_ASSUME_NONNULL_END

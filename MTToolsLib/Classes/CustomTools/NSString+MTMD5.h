//
//  NSString+MTMD5.h
//  ARThirdTools
//
//  Created by xiejc on 2018/12/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (MTMD5)


/**
 字符串md5加密
 1、先把字符串 转大写
 2、进行utf8编码
 3、进行MD5加密
 4、将加密后的字符串转大写

 @return MD5签名
 */
- (NSString *)md5;

@end

NS_ASSUME_NONNULL_END

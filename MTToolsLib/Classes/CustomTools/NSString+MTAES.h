//
//  NSString+MTAES.h
//  ARThirdTools
//
//  Created by xiejc on 2019/2/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (MTAES)


/**
 
 加密字符串 /AES128/CBC - kCCOptionPKCS7Padding

 @param content 字符串
 @param key 密钥
 @param kIV 密钥偏移量
 @return 加密后字符串
 */
+ (NSString *)encryptAES:(NSString *)content key:(NSString *)key kIV:(NSString *)kIV;


/**
 
 解密字符串 /AES128/CBC - kCCOptionPKCS7Padding - 暂时解析错误
 
 @param content 字符串
 @param key 密钥
 @param kIV 密钥偏移量
 @return 解密后字符串
 */
+ (NSString *)decryptAES:(NSString *)content key:(NSString *)key kIV:(NSString *)kIV;


@end

NS_ASSUME_NONNULL_END

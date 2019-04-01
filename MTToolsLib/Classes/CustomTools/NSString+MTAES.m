//
//  NSString+MTAES.m
//  ARThirdTools
//
//  Created by xiejc on 2019/2/2.
//

#import "NSString+MTAES.h"

#import <CommonCrypto/CommonCrypto.h>
#import <CommonCrypto/CommonDigest.h>


size_t const kKeySize = kCCKeySizeAES128;

@implementation NSString (MTAES)

//加密字符串 /AES128/CBC - kCCOptionPKCS7Padding
+ (NSString *)encryptAES:(NSString *)content key:(NSString *)key kIV:(NSString *)kIV {
    // 系统默认使用 CBC，然后指明使用 PKCS7Padding
    return [self encryptAES:content key:key kIV:kIV alg:kCCAlgorithmAES options:kCCOptionPKCS7Padding];
}

+ (NSString *)decryptAES:(NSString *)content key:(NSString *)key kIV:(NSString *)kIV {
    return [self decryptAES:content key:key kIV:kIV alg:kCCAlgorithmAES options:kCCOptionPKCS7Padding];
}

+ (NSString *)decryptAES:(NSString *)content key:(NSString *)key kIV:(NSString *)kIV alg:(CCAlgorithm)alg options:(CCOptions)options {
    NSData *contentData = [content dataUsingEncoding:NSUTF8StringEncoding];
    NSUInteger dataLength = contentData.length;
    
    // 为结束符'\0' +1
    char keyPtr[kKeySize];
    memset(keyPtr, 0, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    // 密文长度 <= 明文长度 + BlockSize
    size_t encryptSize = dataLength + kCCBlockSizeAES128;
    void *encryptedBytes = malloc(encryptSize);
    size_t actualOutSize = 0;
    
    NSData *initVector = [kIV dataUsingEncoding:NSUTF8StringEncoding];
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          alg,
                                          options,
                                          keyPtr,
                                          kKeySize,
                                          initVector.bytes,
                                          contentData.bytes,
                                          dataLength,
                                          encryptedBytes,
                                          encryptSize,
                                          &actualOutSize);
    
    if (cryptStatus == kCCSuccess) {
        // 对加密后的数据进行 base64 编码
        return [[NSData dataWithBytesNoCopy:encryptedBytes length:actualOutSize] base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    }
    free(encryptedBytes);
    return nil;
}

+ (NSString *)encryptAES:(NSString *)content key:(NSString *)key kIV:(NSString *)kIV alg:(CCAlgorithm)alg options:(CCOptions)options {
    NSData *contentData = [content dataUsingEncoding:NSUTF8StringEncoding];
    NSUInteger dataLength = contentData.length;
    
    // 为结束符'\0' +1
    char keyPtr[kKeySize + 1];
    memset(keyPtr, 0, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    // 密文长度 <= 明文长度 + BlockSize
    size_t encryptSize = dataLength + kCCBlockSizeAES128;
    void *encryptedBytes = malloc(encryptSize);
    size_t actualOutSize = 0;
    
    NSData *initVector = [kIV dataUsingEncoding:NSUTF8StringEncoding];
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          alg,
                                          options,
                                          keyPtr,
                                          kKeySize,
                                          initVector.bytes,
                                          contentData.bytes,
                                          dataLength,
                                          encryptedBytes,
                                          encryptSize,
                                          &actualOutSize);
    
    if (cryptStatus == kCCSuccess) {
        // 对加密后的数据进行 base64 编码
        return [[NSData dataWithBytesNoCopy:encryptedBytes length:actualOutSize] base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    }
    free(encryptedBytes);
    return nil;
}


+ (NSData *)decryptAESData:(NSData *)contentData key:(NSString *)key kIV:(NSString *)kIV {
    NSUInteger dataLength = contentData.length;
    void const *initVectorBytes = [kIV dataUsingEncoding:NSUTF8StringEncoding].bytes;
    void const *contentBytes = contentData.bytes;

    
    // 为结束符'\0' +1
    char keyPtr[kKeySize + 1];
    memset(keyPtr, 0, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    size_t operationSize = dataLength + kCCBlockSizeAES128;
    void *operationBytes = malloc(operationSize);
    if (operationBytes == NULL) {
        return nil;
    }
    size_t actualOutSize = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmAES,
                                          kCCOptionPKCS7Padding,
                                          keyPtr,
                                          kKeySize,
                                          initVectorBytes,
                                          contentBytes,
                                          dataLength,
                                          operationBytes,
                                          operationSize,
                                          &actualOutSize);
    
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:operationBytes length:actualOutSize];
    }
    free(operationBytes);
    operationBytes = NULL;
    return nil;
}

@end


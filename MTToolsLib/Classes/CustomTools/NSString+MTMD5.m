//
//  NSString+MTMD5.m
//  ARThirdTools
//
//  Created by xiejc on 2018/12/20.
//

#import "NSString+MTMD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (MTMD5)


- (NSString *)md5
{
    NSString *upStr = [self uppercaseString];
    const char *cStr = [upStr UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    NSString *md5Str = [NSString stringWithFormat:
                        @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                        result[0], result[1], result[2], result[3],
                        result[4], result[5], result[6], result[7],
                        result[8], result[9], result[10], result[11],
                        result[12], result[13], result[14], result[15]
                        ];
    md5Str = [md5Str uppercaseString];
    return md5Str;
}


@end

//
//  NSURL+MT.m
//  ARThirdTools
//
//  Created by xiejc on 2019/4/1.
//

#import "NSURL+MT.h"

@implementation NSURL (MT)

- (NSDictionary<NSString *,NSString *> *)mt_params{
    return [self.class mt_paramsWithString:self.query];
}

+ (NSDictionary<NSString *,NSString *> *)mt_paramsWithString:(NSString *)string{
    if(string == nil || string.length == 0){
        return nil;
    }
    
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"&;"];
    NSMutableDictionary<NSString *, NSString *> *dictionary = [NSMutableDictionary dictionary];
    NSScanner *scanner = [[NSScanner alloc] initWithString:string];
    
    while(![scanner isAtEnd]){
        NSString *pairString = nil;
        [scanner scanUpToCharactersFromSet:characterSet intoString:&pairString];
        [scanner scanCharactersFromSet:characterSet intoString:NULL];
        NSArray *array = [pairString componentsSeparatedByString:@"="];
        if(array.count >= 2){
            NSString *key = [[array firstObject] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            // 防止出现多个'='分割key-value错误的问题
            NSString *value = [pairString substringFromIndex:(key.length + 1)];
            dictionary[key] = value;
        }
    }
    
    return [dictionary copy];
}

@end

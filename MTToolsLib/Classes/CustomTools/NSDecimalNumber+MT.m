//
//  NSDecimalNumber+MT.m
//  ARThirdTools
//
//  Created by xiejc on 2019/2/12.
//

#import "NSDecimalNumber+MT.h"
#import "NSString+MT.h"

@implementation NSDecimalNumber (MT)

+ (NSDecimalNumber *)addNumber:(NSNumber *)num1 secondNumber:(NSNumber *)num2 {
    NSDecimalNumber *firstNumber = [NSDecimalNumber decimalNumberWithString:[num1 stringValue]];
    NSDecimalNumber *secondNumber = [NSDecimalNumber decimalNumberWithString:[num2 stringValue]];
    NSDecimalNumber *total = [firstNumber decimalNumberByAdding:secondNumber];
    return total;
}

+ (NSDecimalNumber *)addDecimalNumber:(NSDecimalNumber *)num1 secondNumber:(NSNumber *)num2 {
    if (num1 == nil) {
        if (num2 == nil) {
            return nil;
        }
        return [NSDecimalNumber decimalNumberWithString:[num2 stringValue]];
    }

    if (num2 == nil) {
        return num1;
    }

    NSDecimalNumber *secondNumber = [NSDecimalNumber decimalNumberWithString:[num2 stringValue]];
    NSDecimalNumber *total = [num1 decimalNumberByAdding:secondNumber];
    return total;
}


+ (NSDecimalNumber *)multipyingStringNumber:(NSString *)numStr withInteger:(NSInteger)intNum {
    if ([NSString isNullString:numStr]) {
        return nil;
    }
    NSString *num2Str = [NSString stringWithFormat:@"%ld", (long)intNum];
    return [self multipyingStringNumber:numStr secondNumber:num2Str];
}


+ (NSDecimalNumber *)multipyingStringNumber:(NSString *)num1Str secondNumber:(NSString *)num2Str {
    if ([NSString isNullString:num1Str] || [NSString isNullString:num2Str]) {
        return nil;
    }

    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:num1Str];
    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:num2Str];
    return [self multipyingDecimalNumber:num1 secondNumber:num2];
}

+ (NSDecimalNumber *)multipyingDecimalNumber:(NSDecimalNumber *)num1 secondNumber:(NSDecimalNumber *)num2 {
    if (num1 == nil || num2 == nil) {
        return nil;
    }
    
    NSDecimalNumber *result = [num1 decimalNumberByMultiplyingBy:num2];
    return result;
}

@end

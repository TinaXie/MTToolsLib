//
//  NSDecimalNumber+MT.h
//  ARThirdTools
//
//  Created by xiejc on 2019/2/12.
//

#import <Foundation/Foundation.h>


@interface NSDecimalNumber (MT)

+ (NSDecimalNumber *)addNumber:(NSNumber *)num1 secondNumber:(NSNumber *)num2;

+ (NSDecimalNumber *)addDecimalNumber:(NSDecimalNumber *)num1 secondNumber:(NSNumber *)num2;

+ (NSDecimalNumber *)multipyingStringNumber:(NSString *)num1Str secondNumber:(NSString *)num2Str;

+ (NSDecimalNumber *)multipyingStringNumber:(NSString *)numStr withInteger:(NSInteger)intNum;

+ (NSDecimalNumber *)multipyingDecimalNumber:(NSDecimalNumber *)num1 secondNumber:(NSDecimalNumber *)num2;


@end


//
//  MTStringSymbolRange.h
//  ARThirdTools
//
//  Created by xiejc on 2019/4/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MTStringSymbolRange : NSObject

- (instancetype)initWithBeginSymbol:(NSString *)beginSymbol
                          endSymbol:(NSString *)endSymbol
                       formatString:(NSString *)formatString;

- (NSArray<NSValue *> *)allRangesForPairedSymbol;

- (NSString *)replacedString;

@end

NS_ASSUME_NONNULL_END

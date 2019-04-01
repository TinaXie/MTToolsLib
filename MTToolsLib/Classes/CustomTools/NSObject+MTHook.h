//
//  NSObject+MTHook.h
//  ARThirdTools
//
//  Created by xiejc on 2019/4/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (MTHook)

+ (void)mt_swizzle:(SEL)swizzleSelector
          original:(SEL)originalSelector
               cls:(BOOL)cls;
@end

NS_ASSUME_NONNULL_END

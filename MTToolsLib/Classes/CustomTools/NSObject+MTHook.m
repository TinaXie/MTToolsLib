//
//  NSObject+MTHook.m
//  ARThirdTools
//
//  Created by xiejc on 2019/4/1.
//

#import "NSObject+MTHook.h"
#import <objc/runtime.h>

@implementation NSObject (MTHook)

static Method _MTSwizzleMethodGet(Class cls, SEL sel, BOOL isCls){
    if(isCls){
        return class_getClassMethod(cls, sel);
    }
    
    return class_getInstanceMethod(cls, sel);
}

+ (void)mt_swizzle:(SEL)swizzleSelector
          original:(SEL)originalSelector
               cls:(BOOL)cls{
    Method swizzleMethod = _MTSwizzleMethodGet(self, swizzleSelector, cls);
    Method originalMethod = _MTSwizzleMethodGet(self, originalSelector, cls);
    if(!swizzleMethod || !originalMethod){
        return;
    }
    
    class_addMethod(self,
                    originalSelector,
                    method_getImplementation(originalMethod),
                    method_getTypeEncoding(originalMethod));
    
    class_addMethod(self,
                    swizzleSelector,
                    method_getImplementation(swizzleMethod),
                    method_getTypeEncoding(swizzleMethod));
    
    method_exchangeImplementations(originalMethod, swizzleMethod);
}

@end

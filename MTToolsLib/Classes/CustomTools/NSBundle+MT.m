//
//  NSBundle+MT.m
//  ARThirdTools
//
//  Created by xiejc on 2019/3/29.
//

#import "NSBundle+MT.h"

@implementation NSBundle (MT)

+ (NSBundle *)getBundleByName:(NSString *)bundleName {
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle"];
    if(bundlePath){
        return [NSBundle bundleWithPath:bundlePath];
    }
    return nil;
}


@end

//
//  NSBundle+MT.h
//  ARThirdTools
//
//  Created by xiejc on 2019/3/29.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (MT)

+ (NSBundle *)getBundleByName:(NSString *)bundleName;

@end

NS_ASSUME_NONNULL_END

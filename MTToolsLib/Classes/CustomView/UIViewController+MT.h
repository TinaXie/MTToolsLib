//
//  UIViewController+MT.h
//  ARThirdTools
//
//  Created by xiejc on 2019/2/15.
//

#import <UIKit/UIKit.h>

#define InstanceSBVC(SBName, vcID) [UIViewController instanceFromStoryBoard:SBName ID:vcID]


@interface UIViewController (MT)

+ (UIViewController *)instanceFromStoryBoard:(NSString *)storyBoard ID:(NSString *)VCID;

+ (UIViewController *)getCurrentTopViewController;

+ (UIViewController *)topViewController:(UIViewController *)vc;


@end


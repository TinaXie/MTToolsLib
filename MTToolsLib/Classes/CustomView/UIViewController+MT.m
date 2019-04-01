//
//  UIViewController+MT.m
//  ARThirdTools
//
//  Created by xiejc on 2019/2/15.
//

#import "UIViewController+MT.h"

@implementation UIViewController (MT)

+ (UIViewController *)instanceFromStoryBoard:(NSString *)storyBoard ID:(NSString *)VCID {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:storyBoard bundle:nil];
    if (sb) {
        UIViewController *viewController = [sb instantiateViewControllerWithIdentifier:VCID];
        return viewController;
    }
    return nil;
}

+ (UIViewController *)getCurrentTopViewController {
    UIViewController *rootViewController = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    UIViewController *topViewController = [self topViewController:rootViewController];
    return topViewController;
}

+ (UIViewController *)topViewController:(UIViewController *)vc {
    UIViewController *topVC = nil;
    if ([vc isKindOfClass:[UINavigationController class]]) {
        topVC = [self topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        topVC = [self topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        topVC = vc;
    }
    while (topVC.presentedViewController) {
        topVC = [self topViewController:topVC.presentedViewController];
    }
    return topVC;
}

@end

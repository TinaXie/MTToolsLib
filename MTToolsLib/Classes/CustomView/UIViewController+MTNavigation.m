//
//  UIViewController+MTNavigation.m
//  ARThirdTools
//
//  Created by xiejc on 2018/12/20.
//

#import "UIViewController+MTNavigation.h"

@implementation UIViewController (MTNavigation)

- (id)preViewControllerWithPreCount:(NSUInteger)preCount {
    id preVC = nil;
    UINavigationController *navVC = self.navigationController;
    if (navVC) {
        NSUInteger index = [navVC.viewControllers indexOfObject:self];
        long preIndex = index - preCount;
        if (preIndex >= 0) {
            preVC = [navVC.viewControllers objectAtIndex:preIndex];
        }
    }
    return preVC;
}

- (id)preViewController {
    return [self preViewControllerWithPreCount:1];
}

- (void)replaceWithViewController:(UIViewController *)destinationViewController animated:(BOOL)animated {
    return [self pushViewController:destinationViewController fromPreCount:1 animated:animated];
}

- (void)pushViewController:(UIViewController *)destinationViewController fromPreCount:(NSUInteger)preCount animated:(BOOL)animated {
    UINavigationController *navVC = self.navigationController;
    
    if (navVC == nil || destinationViewController == nil) {
        NSLog(@"pushViewController nav or destinationViewController is nil");
        return;
    }
    
    NSUInteger index = [navVC.viewControllers indexOfObject:self];
    long preIndex = index - preCount;
    preIndex = MAX(0, preIndex);
    
    NSMutableArray *newVCList = [NSMutableArray array];
    for (int i = 0; i <= preIndex; i++) {
        [newVCList addObject:[navVC.viewControllers objectAtIndex:i]];
    }
    
    [newVCList addObject:destinationViewController];
    [navVC setViewControllers:newVCList animated:animated];
}

- (void)popToViewControllerWithPreCount:(NSUInteger)preCount animated:(BOOL)animated {
    UINavigationController *navVC = self.navigationController;
    
    if (navVC == nil) {
        NSLog(@"popToViewControllerWithPreCount navigation is nil");
        return;
    }
    
    NSUInteger index = [navVC.viewControllers indexOfObject:self];
    long preIndex = index - preCount;
    preIndex = MAX(0, preIndex);
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, preIndex + 1)];
    NSArray *newVCList = [navVC.viewControllers objectsAtIndexes:indexSet];
    [navVC setViewControllers:newVCList animated:animated];
}

@end

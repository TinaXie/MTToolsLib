//
//  UIViewController+MTNavigation.h
//  ARThirdTools
//
//  Created by xiejc on 2018/12/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (MTNavigation)


- (id)preViewControllerWithPreCount:(NSUInteger)preCount;

- (id)preViewController;

- (void)replaceWithViewController:(UIViewController *)destinationViewController animated:(BOOL)animated;

- (void)pushViewController:(UIViewController *)destinationViewController fromPreCount:(NSUInteger)preCount animated:(BOOL)animated;

- (void)popToViewControllerWithPreCount:(NSUInteger)preCount animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END

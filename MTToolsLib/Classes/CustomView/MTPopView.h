//
//  MTPopView.h
//  ARThirdTools
//
//  Created by xiejc on 2019/3/28.
//
//  弹出窗口
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MTPopView : UIView

- (instancetype)initWithContentView:(UIView *)contentView;

- (void)showWithAnimated:(BOOL)animated completedBlock:(nullable void(^)(void))completedBlock;

- (void)hideAnimated:(BOOL)animated completedBlock:(nullable void(^)(void))completedBlock;

@end

NS_ASSUME_NONNULL_END

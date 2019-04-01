//
//  MTHUD.h
//  ZhongCaiHuaXiaCRM_iOS
//
//  Created by xiejc on 2019/2/12.
//  Copyright © 2019 xiejc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MTHUD : UIView


/**
 弹出闪现的成功提示窗口
 */
+ (void)showDurationSuccessHUD:(NSString *)message;

/**
 弹出闪现的成功提示窗口

 @param message 信息
 @param animated 是否需要动画
 @param completedBlock 完成Block
 */
+ (void)showDurationSuccessHUD:(NSString *)message animated:(BOOL)animated completedBlock:(nullable void(^)(void))completedBlock;

/**
 弹出闪现的失败提示窗口
 
 @param message 文字
 */
+ (void)showDurationFailureHUD:(NSString *)message;

/**
 弹出闪现的失败提示窗口
 
 @param message 文字
 @param animated 是否需要动画
 @param completedBlock 结束回调
 */
+ (void)showDurationFailureHUD:(NSString *)message animated:(BOOL)animated completedBlock:(nullable void(^)(void))completedBlock;


/**
 弹出闪现的提醒的提示窗口
 
 @param message 文字
 */
+ (void)showDurationWarningHUD:(NSString *)message;

/**
 弹出闪现的提醒的提示窗口
 
 @param message 文字
 @param animated 是否需要动画
 @param completedBlock 结束回调
 */
+ (void)showDurationWarningHUD:(NSString *)message animated:(BOOL)animated completedBlock:(nullable void(^)(void))completedBlock;


/**
 弹出加载中图文提示窗口
 
 @param message 文字
 */
+ (void)showLoadingHUDWithMessage:(NSString *)message;


/**
 弹出加载中图文提示窗口

 @param message 文字
 @param animated 是否需要动画
 @param completedBlock 结束回调
 */
+ (void)showLoadingHUDWithMessage:(NSString *)message animated:(BOOL)animated completedBlock:(nullable void(^)(void))completedBlock;


/**
 弹出闪现的左图右文提示窗口
 
 @param message 文字
 @param image 图片
 @param animated 是否需要动画
 @param completedBlock 结束回调
 */
+ (void)showDurationLeftRightHUDWithMessage:(NSString *)message image:(UIImage *)image animated:(BOOL)animated completedBlock:(nullable void(^)(void))completedBlock;


/**
 弹出闪现的上图下文提示窗口
 
 @param message 文字
 @param image 图片
 @param animated 是否需要动画
 @param completedBlock 结束回调
 */
+ (void)showDurationUpDownHUDWithMessage:(NSString *)message image:(UIImage *)image animated:(BOOL)animated completedBlock:(nullable void(^)(void))completedBlock;


/**
 弹出左图右文提示窗口
 
 @param message 文字
 @param image 图片
 @param animated 是否需要动画
 @param completedBlock 结束回调
 */
+ (void)showLeftRightHUDWithMessage:(NSString *)message image:(UIImage *)image animated:(BOOL)animated completedBlock:(nullable void(^)(void))completedBlock;


/**
 弹出上图下文提示窗口
 
 @param message 文字
 @param image 图片
 @param animated 是否需要动画
 @param completedBlock 结束回调
 */
+ (void)showUpDownHUDWithMessage:(NSString *)message image:(UIImage *)image animated:(BOOL)animated completedBlock:(nullable void(^)(void))completedBlock;


/**
 隐藏HUD弹出窗口
 */
+ (void)hideHUD;

/**
 隐藏HUD弹出窗口

 @param animated 是否需要动画
 @param completedBlock 结束回调
 */
+ (void)hideHUD:(BOOL)animated completedBlock:(nullable void(^)(void))completedBlock;

@end

NS_ASSUME_NONNULL_END

//
//  MTHUD.m
//  ZhongCaiHuaXiaCRM_iOS
//
//  Created by xiejc on 2019/2/12.
//  Copyright © 2019 xiejc. All rights reserved.
//

#import "MTHUD.h"
#import "UIView+MT.h"
#import "UIFont+MT.h"
#import "UIColor+MT.h"

#define MTHUDShowDuration 0.25
#define MTHUDHideDuration 0.2
#define MTHUDDisplayDuration 1.2

#define MTHUDImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"MTHUD.bundle/%@", imageName]]

@interface MTHUD ()

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIImageView *iconImgView;
@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;

@end

@implementation MTHUD

+ (instancetype)instance {
    static MTHUD *hudView = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        hudView = [[MTHUD alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
    });
    return hudView;
}

+ (void)showDurationSuccessHUD:(NSString *)message {
    [self showDurationSuccessHUD:message animated:YES completedBlock:nil];
}

+ (void)showDurationSuccessHUD:(NSString *)message animated:(BOOL)animated completedBlock:(nullable void(^)(void))completedBlock {
    [self showDurationUpDownHUDWithMessage:message image:MTHUDImage(@"toast_success") animated:animated completedBlock:completedBlock];
}

+ (void)showDurationFailureHUD:(NSString *)message {
    [self showDurationFailureHUD:message animated:YES completedBlock:nil];
}

+ (void)showDurationFailureHUD:(NSString *)message animated:(BOOL)animated completedBlock:(nullable void(^)(void))completedBlock {
    [self showDurationUpDownHUDWithMessage:message image:MTHUDImage(@"toast_failure") animated:animated completedBlock:completedBlock];
}

+ (void)showDurationWarningHUD:(NSString *)message {
    [self showDurationWarningHUD:message animated:YES completedBlock:nil];
}

+ (void)showDurationWarningHUD:(NSString *)message animated:(BOOL)animated completedBlock:(nullable void(^)(void))completedBlock {
    [self showDurationLeftRightHUDWithMessage:message image:MTHUDImage(@"toast_prompt") animated:animated completedBlock:completedBlock];
}

+ (void)showDurationLeftRightHUDWithMessage:(NSString *)message image:(UIImage *)image animated:(BOOL)animated completedBlock:(nullable void(^)(void))completedBlock {
    [self showLeftRightHUDWithMessage:message image:image animated:animated completedBlock:^{
        [self hideHUD:animated completedBlock:completedBlock];
    }];
}

+ (void)showDurationUpDownHUDWithMessage:(NSString *)message image:(UIImage *)image animated:(BOOL)animated completedBlock:(nullable void(^)(void))completedBlock {
    [self showUpDownHUDWithMessage:message image:image animated:animated completedBlock:^{
        [self hideHUD:animated completedBlock:completedBlock];
    }];
}

+ (void)showLoadingHUDWithMessage:(NSString *)message {
    [self showLoadingHUDWithMessage:message animated:NO completedBlock:nil];
}

+ (void)showLoadingHUDWithMessage:(NSString *)message animated:(BOOL)animated completedBlock:(nullable void(^)(void))completedBlock {
    MTHUD *hudView = [MTHUD instance];
    [hudView refreshLoadingCenterView:message];
    [hudView showWithAnimated:animated completedBlock:completedBlock];
}

+ (void)showLeftRightHUDWithMessage:(NSString *)message image:(UIImage *)image animated:(BOOL)animated completedBlock:(nullable void(^)(void))completedBlock {
    MTHUD *hudView = [MTHUD instance];
    [hudView refreshLeftRightCenterView:message image:image];
    [hudView showWithAnimated:animated completedBlock:completedBlock];
}

+ (void)showUpDownHUDWithMessage:(NSString *)message image:(UIImage *)image animated:(BOOL)animated completedBlock:(nullable void(^)(void))completedBlock {
    MTHUD *hudView = [MTHUD instance];
    [hudView refreshUpDownView:message image:image];
    [hudView showWithAnimated:animated completedBlock:completedBlock];
}

+ (void)hideHUD {
    [self hideHUD:NO completedBlock:nil];
}

+ (void)hideHUD:(BOOL)animated completedBlock:(nullable void(^)(void))completedBlock {
    MTHUD *hudView = [MTHUD instance];
    [hudView hideAnimated:animated completedBlock:completedBlock];
}


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        self.containerView = [[UIView alloc] init];
        self.containerView.backgroundColor = [[UIColor blackColor] colorWithAlpha:0.75];
        [self.containerView cornerWithRadius:3.0 borderColor:nil];
        [self addSubview:self.containerView];

        self.iconImgView = [[UIImageView alloc] init];
        self.iconImgView.backgroundColor = [UIColor clearColor];
        [self.containerView addSubview:self.iconImgView];
        
        self.messageLabel = [[UILabel alloc] init];
        self.messageLabel.backgroundColor = [UIColor clearColor];
        self.messageLabel.textColor = [UIColor whiteColor];
        self.messageLabel.font = MT_PingFangSC_LightFont(16.0);
        self.messageLabel.textAlignment = NSTextAlignmentCenter;
        [self.containerView addSubview:self.messageLabel];
        
        self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        self.activityIndicator.backgroundColor = [UIColor clearColor];
        [self.containerView addSubview:self.activityIndicator];
    }
    return self;
}

- (void)showWithAnimated:(BOOL)animated completedBlock:(nullable void(^)(void))completedBlock {
    self.alpha = 0.0;
    [self removeFromSuperview];
    [self.currentWindow addSubview:self];
    if (animated) {
        [UIView animateWithDuration:MTHUDShowDuration animations:^{
            self.alpha = 1.0;
        } completion:^(BOOL finished) {
            if (completedBlock) {
                completedBlock();
            }
        }];
    } else {
        self.alpha = 1.0;
    }
}

- (void)hideAnimated:(BOOL)animated completedBlock:(nullable void(^)(void))completedBlock {
    if (animated) {
        [UIView animateWithDuration:MTHUDHideDuration delay:MTHUDDisplayDuration options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.alpha = 0.0;
        } completion:^(BOOL finished) {
            [self hideAnimated:NO completedBlock:completedBlock];
        }];
    } else {
        [self removeFromSuperview];
        [self resetView];
        if (completedBlock) {
            completedBlock();
        }
    }
}


/**
 重置页面
 */
- (void)resetView {
    [self removeFromSuperview];
    self.messageLabel.text = nil;
    self.iconImgView.image = nil;
    [self.activityIndicator stopAnimating];
}

/**
 左图右文结构的弹出窗口
 
 @param message 信息
 @param image 图片
 */
- (void)refreshLeftRightCenterView:(NSString *)message image:(UIImage *)image {
    [self.activityIndicator stopAnimating];
    self.activityIndicator.hidden = YES;
    
    self.messageLabel.hidden = self.iconImgView.hidden = NO;
    self.messageLabel.text = message;
    self.iconImgView.image = image;
    [self updateLeftRightViewFrame];
}

/**
 上图下文结构的加载中结构

 @param message 信息
 */
- (void)refreshLoadingCenterView:(NSString *)message {
    self.iconImgView.hidden = YES;
    self.activityIndicator.hidden = self.messageLabel.hidden = NO;
    self.messageLabel.text = message;
    
    [self updateUpDownViewFrame];
    [self.activityIndicator startAnimating];
}


/**
 上图下文结构的弹出窗口

 @param message 信息
 @param image 图片
 */
- (void)refreshUpDownView:(NSString *)message image:(UIImage *)image {
    [self.activityIndicator stopAnimating];
    self.activityIndicator.hidden = YES;

    self.messageLabel.hidden = self.iconImgView.hidden = NO;
    self.messageLabel.text = message;
    self.iconImgView.image = image;

    [self updateUpDownViewFrame];
}


/**
 更新frame - 左图右文结构的弹出窗口
 */
- (void)updateLeftRightViewFrame {
    CGFloat containerH =  44.0;

    CGFloat imageW = 20.0;
    CGFloat imageH = imageW;
    CGFloat imageX = 17.0;
    CGFloat imageY = (containerH - imageH) * 0.5;
    
    UIView *showView = nil;
    if (!self.iconImgView.hidden) {
        showView = self.iconImgView;
    }
    if (!self.activityIndicator.hidden) {
        showView = self.activityIndicator;
    }
    
    showView.frame = CGRectMake(imageX, imageY, imageW, imageH);

    CGFloat messageX = CGRectGetMaxX(showView.frame) + 8.0;
    CGFloat messageY = 0;
    CGFloat messageW = [self getMessageWidth:self.messageLabel.text];
    CGFloat messageH = containerH;
    self.messageLabel.frame = CGRectMake(messageX, messageY, messageW, messageH);

    CGFloat containerW = CGRectGetMaxX(self.messageLabel.frame) + 10.0;
    CGFloat containerX = (CGRectGetWidth(self.bounds) - containerW) * 0.5;
    CGFloat containerY = (CGRectGetHeight(self.bounds) - containerH) * 0.5;
    self.containerView.frame = CGRectMake(containerX, containerY, containerW, containerH);
}

/**
 更新frame - 上图下文结构的弹出窗口
 */
- (void)updateUpDownViewFrame {
    CGFloat containerW = [self getMessageWidth:self.messageLabel.text] + 20.0;
    containerW = MAX(containerW, 124.0);
    CGFloat containerH =  87.0;
    CGFloat containerX = (CGRectGetWidth(self.bounds) - containerW) * 0.5;
    CGFloat containerY = (CGRectGetHeight(self.bounds) - containerH) * 0.5;
    self.containerView.frame = CGRectMake(containerX, containerY, containerW, containerH);

    CGFloat imageW = 30.0;
    CGFloat imageH = imageW;
    CGFloat imageX = (CGRectGetWidth(self.containerView.bounds) - imageW) * 0.5;
    CGFloat imageY = 13.0;

    UIView *showView = nil;
    if (!self.iconImgView.hidden) {
        showView = self.iconImgView;
    }
    if (!self.activityIndicator.hidden) {
        showView = self.activityIndicator;
    }
    
    showView.frame = CGRectMake(imageX, imageY, imageW, imageH);

    CGFloat messageX = 0.0;
    CGFloat messageY = CGRectGetMaxY(showView.frame) + 10.0;
    CGFloat messageW = CGRectGetWidth(self.containerView.bounds);
    CGFloat messageH = 22.0;
    self.messageLabel.frame = CGRectMake(messageX, messageY, messageW, messageH);
}



/**
 *  获取window
 */
- (UIWindow *)currentWindow {
    NSEnumerator *frontToBackWindows = [[[UIApplication sharedApplication] windows] reverseObjectEnumerator];
    for (UIWindow *window in frontToBackWindows)
        if (window.windowLevel == UIWindowLevelNormal) {
            return window;
            break;
        }
    return nil;
}


- (CGFloat)getMessageWidth:(NSString *)text {
    NSDictionary *attrs = @{NSFontAttributeName: self.messageLabel.font};
    CGFloat width = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.width;
    return width;
}

@end

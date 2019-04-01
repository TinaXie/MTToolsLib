//
//  MTPopView.m
//  ARThirdTools
//
//  Created by xiejc on 2019/3/28.
//

#import "MTPopView.h"
#import "UIView+MT.h"

#define MTShowDuration 0.25
#define MTHideDuration 0.2

@interface MTPopView ()

@property (nonatomic, strong) UIView *contentView;

@end

@implementation MTPopView

- (instancetype)initWithContentView:(UIView *)contentView {
    if (self = [self initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)]) {
        self.contentView = contentView;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    }
    return self;
}

- (void)setContentView:(UIView *)contentView {
    _contentView = contentView;
    [self clearAllSubViews];
    [self addSubview:contentView];
}

- (void)showWithAnimated:(BOOL)animated completedBlock:(nullable void(^)(void))completedBlock {
    self.alpha = 0.0;
    [self removeFromSuperview];
    UIWindow *currentWindow = [UIView getCurrentWindow];
    [currentWindow addSubview:self];
    if (animated) {
        [UIView animateWithDuration:MTShowDuration animations:^{
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
        [UIView animateWithDuration:MTHideDuration delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
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
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.contentView.center = self.center;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

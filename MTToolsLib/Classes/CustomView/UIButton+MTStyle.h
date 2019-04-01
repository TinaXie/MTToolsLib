//
//  UIButton+MTStyle.h
//  BAIHC
//
//  Created by xiejc on 2019/3/28.
//  Copyright © 2019 YYCloud. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, MTButtonType) {
    MTButtonType_Right = 0, //图片在右
    MTButtonType_Left, //图片在左
    MTButtonType_Bottom, //图片在下
    MTButtonType_Top //图片在上
};


@interface UIButton (MTStyle)

- (void)setShowType:(MTButtonType)type space:(CGFloat)space;

@end

NS_ASSUME_NONNULL_END

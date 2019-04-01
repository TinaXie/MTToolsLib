//
//  UIView+subScript.m
//  MyReader
//
//  Created by xiejc on 2018/11/13.
//  Copyright © 2018 xiejc. All rights reserved.
//

#import "UIView+subScript.h"

@implementation UIView (subScript)


- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x {
    CGRect r = self.frame;
    r.origin.x = x;
    self.frame = r;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y {
    CGRect r = self.frame;
    r.origin.y = y;
    self.frame = r;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect r = self.frame;
    r.size.width = width;
    self.frame = r;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect r = self.frame;
    r.size.height = height;
    self.frame = r;
}


@end

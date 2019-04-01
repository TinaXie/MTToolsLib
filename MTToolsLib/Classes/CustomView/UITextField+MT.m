//
//  UITextField+MT.m
//  ARThirdTools
//
//  Created by xiejc on 2019/3/26.
//

#import "UITextField+MT.h"

@implementation UITextField (MT)

- (void)changePLTextColor:(UIColor *)plColor {
    NSDictionary *plAttr = @{NSForegroundColorAttributeName:plColor};
    NSAttributedString *attrPL = [[NSAttributedString alloc] initWithString:self.placeholder attributes:plAttr];
    self.attributedPlaceholder = attrPL;
}

@end

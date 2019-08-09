//
//  UIViewController+MTTextView.m
//  BAIHC
//
//  Created by xiejc on 2019/4/30.
//  Copyright © 2019 YYCloud. All rights reserved.
//

#import "UIViewController+MTTextView.h"

@implementation UIViewController (MTTextView)

- (void)addTextFieldListChangeNotification:(NSArray<UITextField *> *)textFieldList {
    for (UITextField *textField in textFieldList) {
        [self addTextFieldChangeNotification:textField];
    }
}

- (void)addTextFieldChangeNotification:(UITextField *)textField {
    [textField addTarget:self action:@selector(mttextFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

- (NSInteger)maxLengthOfTextField:(UITextField *)textField  {
    NSInteger maxLength = 100;
    return maxLength;
}


- (void)mttextFieldDidChange:(UITextField *)textField {
    NSInteger maxLength = 100;
    if ([self respondsToSelector:@selector(maxLengthOfTextField:)]) {
        maxLength = [self maxLengthOfTextField:textField];
    }
    
    //获取高亮部分
    UITextRange *selectedRange = [textField markedTextRange];
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    
    NSString *toBeString = textField.text;
    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
    if (!position) {
        if (toBeString.length > maxLength) {
            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:maxLength];
            if (rangeIndex.length == 1)  {
                textField.text = [toBeString substringToIndex:maxLength];
            } else {
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, maxLength)];
                textField.text = [toBeString substringWithRange:rangeRange];
            }
        }
    }
}


@end

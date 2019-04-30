//
//  UIViewController+MTTextView.h
//  BAIHC
//
//  Created by xiejc on 2019/4/30.
//  Copyright © 2019 YYCloud. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (MTTextView)

- (void)addTextFieldListChangeNotification:(NSArray<UITextField *> *)textFieldList;

- (void)addTextFieldChangeNotification:(UITextField *)textField;

- (NSInteger)maxLengthOfTextField:(UITextField *)textField;

@end

NS_ASSUME_NONNULL_END

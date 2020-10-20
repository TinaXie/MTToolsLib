//
//  PHTextView.h
//  MaiChe
//
//  Created by xiejc on 15/3/5.
//  Copyright (c) 2015年 BitEP. All rights reserved.
//
//  TextView with placeholder
//

#import <UIKit/UIKit.h>

@interface PHTextView : UITextView

/**
 *  占位字符串
 */
@property (nonatomic, strong) NSString *placeholder;

/**
 *  TextView内容
 */
@property (nonatomic, strong) NSString *realText;

@end

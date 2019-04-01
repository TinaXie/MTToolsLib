//
//  PHTextView.m
//  MaiChe
//
//  Created by xiejc on 15/3/5.
//  Copyright (c) 2015年 BitEP. All rights reserved.
//

#import "PHTextView.h"
#import "NSString+Custom.m"

@interface PHTextView ()

- (void) beginEdit:(NSNotification*) notification;

- (void) endEdit:(NSNotification*) notification;


@end

@implementation PHTextView



- (void)awakeFromNib {
    [super awakeFromNib];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(beginEdit:) name:UITextViewTextDidBeginEditingNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(endEdit:) name:UITextViewTextDidEndEditingNotification object:self];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (NSString *)realText {
    if ([self.text isEqualToString:self.placeholder]) {
        return @"";
    }
    return self.text;
}

- (void)setPlaceholder:(NSString *)str {
    if (![_placeholder isEqualToString:str]) {
        _placeholder = nil;
    }
    _placeholder = str;
    [self endEdit:nil];
}

- (void)beginEdit:(NSNotification*) notification {
    if ([self.text isEqualToString:self.placeholder]) {
        self.text = nil;
    }
    self.textColor = [UIColor blackColor];
}

- (void)endEdit:(NSNotification*) notification {
    if ([NSString isNullString:self.text]) {
        self.text = self.placeholder;
        self.textColor = [UIColor grayColor];
    } else {
        
        self.textColor = [UIColor blackColor];
    }
}

@end

//
//  ReuseScrollView.h
//  MaiChe
//
//  Created by xiejc on 15/9/23.
//  Copyright (c) 2015年 BitEP. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ReuseScrollView;

@protocol ReuseScrollDelegate <UIScrollViewDelegate>

//获取scroll个数
- (NSUInteger)numberOfPageInReuseScrollView:(ReuseScrollView *)reuseScrollView;

//获取显示view
- (UIView *)reuseScrollView:(ReuseScrollView *)reuseScrollView viewAtIndex:(NSUInteger)pageIndex;

//view加载
- (void)reuseScrollView:(ReuseScrollView *)reuseScrollView loadView:(UIView *)view atIndex:(NSUInteger)pageIndex;

//view将从页面移除
- (void)reuseScrollView:(ReuseScrollView *)reuseScrollView WillRemoveView:(UIView *)view atIndex:(NSUInteger)pageIndex;

@end

@interface ReuseScrollView : UIScrollView

@property (nonatomic, assign) id<ReuseScrollDelegate> reuseDelegate;

@property (nonatomic, assign) NSUInteger currentPage;

- (void)reloadData;

- (void)loadCurrentScrollView;

- (UIView *)viewOfPage:(NSUInteger)page;

@end

//
//  ReuseScrollView.m
//  MaiChe
//
//  Created by xiejc on 15/9/23.
//  Copyright (c) 2015年 BitEP. All rights reserved.
//

#import "ReuseScrollView.h"

@interface ReuseScrollView ()

@property (nonatomic, strong) NSMutableArray *viewList;

@property (nonatomic, strong) NSMutableArray *reuseViewList;

@property (nonatomic, strong) UIPageControl *pageControl;


@end

@implementation ReuseScrollView

- (instancetype)init {
    if (self = [super init]) {
        [self initData];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initData];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initData];
}

- (void)initData {
    self.viewList = [NSMutableArray arrayWithCapacity:3];
    self.reuseViewList = [NSMutableArray arrayWithCapacity:3];
    self.currentPage = 0;
    self.pagingEnabled = YES;
}

- (void)setReuseDelegate:(id<ReuseScrollDelegate>)reuseDelegate {
    _reuseDelegate = reuseDelegate;
    self.delegate = reuseDelegate;
}


- (UIView *)viewOfPage:(NSUInteger)page {
    if (page >= self.viewList.count) {
        return nil;
    }
    
    id img = [self.viewList objectAtIndex:page];
    if([img isKindOfClass:[NSNull class]]) {
        return nil;
    }

    return img;
}

/**
 *  清除scrollView
 */
- (void)clearScrollView {
    @autoreleasepool {
        for (int i=0; i<self.viewList.count;i++) {
            [self removePageView:i];
        }
        [self.viewList removeAllObjects];
        
        for (UIView *aView in self.subviews) {
            [aView removeFromSuperview];
        }
    }
}

- (void)reloadData {
    [self clearScrollView];
    self.currentPage = 0;
    NSUInteger totalPage = 0;
    if ([self.reuseDelegate respondsToSelector:@selector(numberOfPageInReuseScrollView:)]) {
        totalPage = [self.reuseDelegate numberOfPageInReuseScrollView:self];
    }

    for (NSUInteger i = 0; i < totalPage; i++) {
        [self.viewList addObject:[NSNull null]];
    }
    
    self.contentSize = CGSizeMake(totalPage * self.frame.size.width, self.frame.size.height);
    self.contentOffset = CGPointMake(self.frame.size.width * self.currentPage, 0);
    [self loadCurrentScrollView];
}



/**
 *  加载当前页面
 */
- (void)loadCurrentScrollView {
    @autoreleasepool {
//        [self removePageView:self.currentPage - 2];
//        [self removePageView:self.currentPage + 2];
        [self loadPageView:self.currentPage];
//        [self loadPageView:self.currentPage + 1];
//        [self loadPageView:self.currentPage - 1];
    }
}

/**
 *  移除某一页
 */
- (void)removePageView:(NSInteger)page {
    if (page >= self.viewList.count) {
        return;
    }

    id aView = [self.viewList objectAtIndex:page];
    if ([aView isKindOfClass:[NSNull class]] || ![aView isKindOfClass:[UIView class]]) {
        return;
    }
    if ([self.reuseDelegate respondsToSelector:@selector(reuseScrollView:WillRemoveView:atIndex:)]) {
        [self.reuseDelegate reuseScrollView:self WillRemoveView:aView atIndex:page];
    }

    [self.viewList replaceObjectAtIndex:page withObject:[NSNull null]];
    [self.reuseViewList addObject:aView];
    [aView removeFromSuperview];
}


- (void)loadPageView:(NSInteger)page {
    NSUInteger totalPage = self.viewList.count;
    if (page < 0 || page >= totalPage || [self.viewList objectAtIndex:page] != [NSNull null]) {
        return;
    }

    float w = self.frame.size.width;
    float h = self.frame.size.height;
    UIView *currentView;
    if (self.reuseViewList.count > 0) {
        currentView = [self.reuseViewList objectAtIndex:0];
    } else if ([self.reuseDelegate respondsToSelector:@selector(reuseScrollView:viewAtIndex:)]) {
        currentView = [self.reuseDelegate reuseScrollView:self viewAtIndex:page];
    }

    currentView.frame = CGRectMake(page * w, 0, w, h);

    [self addSubview:currentView];
    [self.viewList replaceObjectAtIndex:page withObject:currentView];
    [self.reuseViewList removeObject:currentView];

    if ([self.reuseDelegate respondsToSelector:@selector(reuseScrollView:loadView:atIndex:)]) {
        [self.reuseDelegate reuseScrollView:self loadView:currentView atIndex:page];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat scrollView_W = CGRectGetWidth(self.frame);
    CGFloat scrollView_H = CGRectGetHeight(self.frame);
    
    [self.viewList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[UIView class]]) {
            [(UIView *)obj setFrame:CGRectMake(idx * scrollView_W, 0, scrollView_W, scrollView_H)];
        }
    }];
    self.contentSize = CGSizeMake(self.viewList.count * scrollView_W, 0);
}

@end

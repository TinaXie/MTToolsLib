//
//  MTKeyChain.h
//  ARThirdTools
//
//  Created by xiejc on 2018/12/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MTKeyChain : NSObject

/**
 *  保存
 *
 *  @param service KeyChain存储名
 *  @param data    数据
 */
+ (void)save:(NSString *)service data:(id)data;

/**
 *  加载
 *
 *  @param service KeyChain存储名
 *
 *  @return 实例
 */
+ (id)load:(NSString *)service;

/**
 *  删除
 *
 *  @param service KeyChain存储名
 */
+ (void)delete:(NSString *)service;

@end

NS_ASSUME_NONNULL_END

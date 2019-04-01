//
//  NSArray+MTJson.h
//  ARThirdTools
//
//  Created by xiejc on 2019/2/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (MTJson)

/**
 将数据转换成Json数据
 
 @return json数据
 */
- (NSString *)convertToJson;

@end

NS_ASSUME_NONNULL_END

//
//  NSData+MTJson.h
//  ZhongCaiHuaXiaCRM_iOS
//
//  Created by xiejc on 2019/1/31.
//  Copyright © 2019 xiejc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (MTJson)

- (NSString *)convertToJson;

- (NSData *)convertFromJson;

@end

NS_ASSUME_NONNULL_END

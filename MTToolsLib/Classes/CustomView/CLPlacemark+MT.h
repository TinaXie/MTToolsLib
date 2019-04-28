//
//  CLPlacemark+MT.h
//  BAIHC
//
//  Created by xiejc on 2019/4/28.
//  Copyright © 2019 YYCloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CLPlacemark (MT)

- (NSString *)fullAddress;

- (NSString *)locationAddress;

@end

NS_ASSUME_NONNULL_END

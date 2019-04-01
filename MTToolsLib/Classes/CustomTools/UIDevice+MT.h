//
//  UIDevice+MT.h
//  ARThirdTools
//
//  Created by xiejc on 2019/1/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (MT)


/**
 获取设备当前系统版本号

 @return 系统版本号
 */
+ (NSString *)iOSVersion;


/**
 获取当前APP版本号

 @return APP版本号
 */
+ (NSString *)APPVersion;


/**
 获取当前设备序列号

 @return 设备序列号
 */
+ (NSString *)deviceUUID;

/**
 获取设备型号然后手动转化为对应名称

 @return 手机型号名称
 */
+ (NSString *)getDeviceName;


- (void)callPhone:(NSString *)phoneNumber;

@end

NS_ASSUME_NONNULL_END

//
//  MTAppStore.h
//  ARThirdTools
//
//  Created by xiejc on 2018/12/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MTAppStore : NSObject


+ (instancetype)singleton;


/**
 返回App在AppStore中的地址
 
 @param appID AppID
 @return 地址
 */
+ (NSString *)appURL:(NSString *)appID;

/**
 *  程序外，打开Appstore中的应用页面
 */
/**
 *  跳出程序,打开Appstore中的应用页面
 *
 *  @param appID AppID
 */
+ (void)openAppInAppStore:(NSString *)appID;

/**
 *  程序内，打开APPSTORE中应用页面
 *
 *  @param presentVC 要显示应用页面的 ViewController
 *  @param appID     appID
 */
- (void)showAppStoreViewInVC:(UIViewController *)presentVC appID:(NSString *)appID;

@end

NS_ASSUME_NONNULL_END

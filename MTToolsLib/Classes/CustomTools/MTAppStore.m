//
//  MTAppStore.m
//  ARThirdTools
//
//  Created by xiejc on 2018/12/20.
//

#import "MTAppStore.h"

#import <StoreKit/StoreKit.h>

static MTAppStore *appStoreMangerSingleton;


@interface MTAppStore ()<SKStoreProductViewControllerDelegate>

@end

@implementation MTAppStore

+ (instancetype)singleton {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (appStoreMangerSingleton == nil) {
            appStoreMangerSingleton = [[MTAppStore alloc] init];
        }
    });
    return appStoreMangerSingleton;
}

+ (NSString *)appURL:(NSString *)appID {
    return [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@", appID];
}


+ (void)openAppInAppStore:(NSString *)appID {
    NSString *appURL = [self appURL:appID];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appURL]];
}
- (void)showAppStoreViewInVC:(UIViewController *)presentVC appID:(NSString *)appID {
    SKStoreProductViewController *skStoreProductVC = [[SKStoreProductViewController alloc] init];
    skStoreProductVC.delegate = self;
    NSDictionary *skProductParams = @{SKStoreProductParameterITunesItemIdentifier:appID};
    [skStoreProductVC loadProductWithParameters:skProductParams completionBlock:^(BOOL result, NSError *error) {
        if (result) {
            [presentVC presentViewController:skStoreProductVC
                                    animated:YES
                                  completion:nil];
        } else {
            NSLog(@"showAppStoreViewInVC error: %@", error.localizedDescription);
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"无法跳转到AppStore" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
            [alertVC addAction:[UIAlertAction actionWithTitle:@"好" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                [alertVC dismissViewControllerAnimated:YES completion:nil];
            }]];
            [presentVC presentViewController:alertVC animated:YES completion:nil];
        }
    }];
}


#pragma mark - SKStoreProductViewControllerDelegate

- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController {
    [viewController dismissViewControllerAnimated:YES completion:nil];
}



@end

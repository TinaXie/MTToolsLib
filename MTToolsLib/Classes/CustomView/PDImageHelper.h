//
//  PDImageHelper.h
//  AutoReport
//
//  Created by 吴晓泉 on 2017/5/16.
//  Copyright © 2017年 newbee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PDImageHelper : NSObject

@property (copy, nonatomic) NSString *bundleName;

- (instancetype)initWithBundleName:(NSString *)name;

- (UIImage *)imageNamed:(NSString *)imageName;

@end

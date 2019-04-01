//
//  PDImageHelper.m
//  AutoReport
//
//  Created by 吴晓泉 on 2017/5/16.
//  Copyright © 2017年 newbee. All rights reserved.
//

#import "PDImageHelper.h"

@implementation PDImageHelper

- (instancetype)initWithBundleName:(NSString *)name
{
    self = [super init];
    if (self) {
        _bundleName = [name copy];
    }
    return self;
}

- (UIImage *)imageNamed:(NSString *)imageName{
    if (imageName != nil && imageName.length > 0){
        NSString *imagePath = [NSString stringWithFormat:@"%@/%@",self.bundleName,imageName];
        return [UIImage imageNamed:imagePath];
    }
    
    return nil;
}

@end

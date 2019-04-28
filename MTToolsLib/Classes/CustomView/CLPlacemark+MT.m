//
//  CLPlacemark+MT.m
//  BAIHC
//
//  Created by xiejc on 2019/4/28.
//  Copyright © 2019 YYCloud. All rights reserved.
//

#import "CLPlacemark+MT.h"

@implementation CLPlacemark (MT)

- (NSString *)fullAddress {
    NSDictionary *dic = self.addressDictionary;
    NSLog(@"CLPlacemark fullAddress dic:%@", dic);

    NSString *State = [dic objectForKey:@"State"];
    if(isNullString(State)){
        State = @"";
    }
    
    NSString *city = [dic objectForKey:@"City"];
    if(isNullString(city)){
        city = @"";
    }
    
    NSString *SubLocality = [dic objectForKey:@"SubLocality"];
    if(isNullString(SubLocality)){
        SubLocality = @"";
    }
    
    NSString *Street = [dic objectForKey:@"Street"];
    if(isNullString(Street)){
        Street = @"";
    }
    
    NSString *fullAddress = [NSString stringWithFormat:@"%@%@%@%@",State,city,SubLocality,Street];
    DLog(@"CLPlacemark fullAddress:%@", fullAddress);

    return fullAddress;
}

- (NSString *)locationAddress {
    NSArray *addressLines = self.addressDictionary[@"FormattedAddressLines"];
    // 将详细地址拼接成一个字符串
    NSString *address = [addressLines componentsJoinedByString:@""];
    if (address == nil) {
        address = self.fullAddress;
    }
    DLog(@"CLPlacemark locationAddress:%@", address);
    return address;

}

@end

//
//  NSArray+MTJson.m
//  ARThirdTools
//
//  Created by xiejc on 2019/2/5.
//

#import "NSArray+MTJson.h"
#import "NSData+MTJson.h"

@implementation NSArray (MTJson)

- (NSString *)convertToJson {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = nil;
    if (!jsonData) {
        NSLog(@"NSArray convertToJson error:%@",error);
    } else {
        jsonString = [jsonData convertToJson];
    }
    return jsonString;
}


@end

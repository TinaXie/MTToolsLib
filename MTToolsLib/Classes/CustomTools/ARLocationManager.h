//
//  ARLocationManager.h
//  AutoReport
//
//  Created by ishaolin on 2017/6/14.
//  Copyright © 2017年 newbee. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface ARLocationManager : NSObject

@property (nonatomic, strong, readonly) CLLocation *location;

+ (instancetype)sharedManager;

- (void)startUpdatingLocation;

- (void)stopUpdatingLocation;

- (void)requestAuthorization;

@end

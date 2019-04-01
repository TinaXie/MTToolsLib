//
//  ARLocationManager.m
//  AutoReport
//
//  Created by ishaolin on 2017/6/14.
//  Copyright © 2017年 newbee. All rights reserved.
//

#import "ARLocationManager.h"
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

@interface ARLocationManager()<CLLocationManagerDelegate>{
    CLLocationManager *_locationManager;
}

@end

@implementation ARLocationManager

+ (instancetype)sharedManager{
    static ARLocationManager *_manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[self alloc] init];
    });
    
    return _manager;
}

- (instancetype)init{
    if(self = [super init]){
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.distanceFilter = 10.0;
        _locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        _locationManager.pausesLocationUpdatesAutomatically = YES;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceiveUserLoginSuccessNotification:) name:@"kDNNotificationLoginSucess" object:nil];
    }
    
    return self;
}

- (void)didReceiveUserLoginSuccessNotification:(NSNotification *)notification{
    [self requestAuthorization];
}

- (void)startUpdatingLocation{
    [_locationManager startUpdatingLocation];
}

- (void)stopUpdatingLocation{
    [_locationManager stopUpdatingLocation];
}

- (void)requestAuthorization{
    CLAuthorizationStatus authorizationStatus = [CLLocationManager authorizationStatus];
    if(authorizationStatus == kCLAuthorizationStatusNotDetermined || authorizationStatus == kCLAuthorizationStatusRestricted){
        [_locationManager requestWhenInUseAuthorization];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation *location = locations.firstObject;
    if(location){
        _location = location;
    }
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end

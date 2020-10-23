//
//  MTViewController.m
//  MTToolsLib
//
//  Created by fayxjc@163.com on 04/01/2019.
//  Copyright (c) 2019 fayxjc@163.com. All rights reserved.
//

#import "MTViewController.h"
#import "MTTools.h"

@interface MTViewController ()

@end

@implementation MTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [MTHUD showDurationSuccessHUD:@"test" animated:YES completedBlock:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

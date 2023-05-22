//
//  HKViewController.m
//  CategoryCollection
//
//  Created by Hi-Kung on 05/22/2023.
//  Copyright (c) 2023 Hi-Kung. All rights reserved.
//

#import "HKViewController.h"
#import <CategoryCollection/UIView+hk_gradient.h>

@interface HKViewController ()

@end

@implementation HKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self gradientSetting];
}

- (void)gradientSetting {
    self.view.hk_setColors(@[[UIColor whiteColor], [UIColor greenColor]]).hk_setStartPoint(CGPointMake(0, 0.5)).hk_setEndPoint(CGPointMake(0, 1));
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

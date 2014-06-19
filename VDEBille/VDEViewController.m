//
//  VDEViewController.m
//  VDEBille
//
//  Created by Utilisation on 18/06/2014.
//  Copyright (c) 2014 Utilisation. All rights reserved.
//

#import "VDEViewController.h"
#import"VDEViewController+configureView.h"
#import "VDEViewController+coreMotion.h"

@implementation VDEViewController

- (void)viewDidLoad
{
  [super viewDidLoad];

  theMotionManager = [[CMMotionManager alloc]init];
  theSamplingFrequency = 0.01; // 10 images per second
  theXContact = NO;
  theYContact = NO;
  bubbleFish  = NO;
  

  
  [self becomeFirstResponder];
  
  [self configureandDisplaySubviews];
  [theMotionManager startDeviceMotionUpdates];
  [self startTimer];
  [self startTimerBubble ];
  [self playMusic:@"ocean"];
  

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

-(BOOL)shouldAutorotate
{
  return NO;
}

@end

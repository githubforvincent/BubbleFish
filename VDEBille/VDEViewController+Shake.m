//
//  VDEViewController+Shake.m
//  VDEBille
//
//  Created by Utilisation on 19/06/2014.
//  Copyright (c) 2014 Utilisation. All rights reserved.
//

#import "VDEViewController+Shake.h"
#import "VDEViewController+configureView.h"

@implementation VDEViewController (Shake)


-(void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
  
  NSLog(@"motion began");
  theBackgroundNumber++;
  [self selectBackground:theBackgroundNumber%4];
  
}



@end

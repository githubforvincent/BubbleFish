//
//  VDEViewController+configureView.m
//  VDEBille
//
//  Created by Utilisation on 18/06/2014.
//  Copyright (c) 2014 Utilisation. All rights reserved.
//

#import "VDEViewController+configureView.h"
#import "VDEViewController.h"

@implementation VDEViewController (configureView)


-(void) configureandDisplaySubviews{
  
  UIView *mainView        = [[UIView alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
  [self setView:mainView];
  theViewWidth  = [[UIScreen mainScreen] bounds].size.width;
  theViewHeight = [[UIScreen mainScreen] bounds].size.height;
  

  
#pragma mark theBackground
  //------------------------------------------------------------------------

  theFirstBackground        = [[UIImageView alloc] initWithFrame:self.view.frame];
  theFirstBackground.image  = [UIImage imageNamed:@"firstBackground"];

  // theFirstBackground.transform = CGAffineTransformMakeRotation(M_PI);
  [self.view addSubview:theFirstBackground];

  theSecondBackground       = [[UIImageView alloc] initWithFrame:self.view.frame];
  theSecondBackground.image = [UIImage imageNamed:@"secondBackground"];
  [self.view addSubview:theSecondBackground];

  theThirdBackground        = [[UIImageView alloc] initWithFrame:self.view.frame];
  theThirdBackground.image  = [UIImage imageNamed:@"thirdBackground"];
  [self.view addSubview:theThirdBackground];

  theFourthBackground       = [[UIImageView alloc] initWithFrame:self.view.frame];
  theFourthBackground.image = [UIImage imageNamed:@"fourthBackground"];
  [self.view addSubview:theFourthBackground];

  [theFirstBackground   setFrame:CGRectMake(0,0,theViewWidth, theViewHeight)];
  [theSecondBackground  setFrame:CGRectMake(0,0,theViewWidth, theViewHeight)];
  [theThirdBackground   setFrame:CGRectMake(0,0,theViewWidth, theViewHeight)];
  [theFourthBackground  setFrame:CGRectMake(0,0,theViewWidth, theViewHeight)];

  theFirstBackground.hidden   = YES;
  theSecondBackground.hidden  = YES;
  theThirdBackground.hidden   = YES;
  theFourthBackground.hidden  = YES;
  
  theBackgroundArray = @[theFirstBackground, theSecondBackground, theThirdBackground,theFourthBackground];
  [self selectBackground:theBackgroundNumber];
  
  
#pragma mark theLabels
  //------------------------------------------------------------------------
  
  thePosition = [[UILabel alloc]init];
  thePosition.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.2];
  thePosition.textAlignment = NSTextAlignmentCenter;
  [self.view addSubview:thePosition];
  
  [thePosition  setFrame:CGRectMake(0,100,theViewWidth, 30)];
  
  theAngles = [[UILabel alloc]init];
  theAngles.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.2];
  theAngles.textAlignment = NSTextAlignmentCenter;
  [self.view addSubview:theAngles];
  
  [theAngles  setFrame:CGRectMake(0,150,theViewWidth, 30)];
  

#pragma mark theMobile
//------------------------------------------------------------------------

  theMobile = [[UIImageView alloc] init];
  theMobile.image = [UIImage imageNamed:@"mobile"];
  [self.view addSubview:theMobile];
  theCurrentX =theViewWidth/2-25;
  theCurrentY =theViewHeight/2-25;
  [theMobile   setFrame:CGRectMake(theCurrentX,theCurrentY,50,50)];
  
  
}

-(void) selectBackground:(int)aBck {
//------------------------------------------------------------------------
  // remove all the views
  for ( UIImageView* p_background in theBackgroundArray) {
    p_background.hidden = YES;
  }
  
  // select the view to display
  [[theBackgroundArray objectAtIndex:aBck] setHidden:NO];

}
  
@end

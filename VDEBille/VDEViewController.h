//
//  VDEViewController.h
//  VDEBille
//
//  Created by Utilisation on 18/06/2014.
//  Copyright (c) 2014 Utilisation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface VDEViewController : UIViewController <AVAudioPlayerDelegate> {
  
  CMMotionManager *theMotionManager;
  NSTimer         *theTimer;
  NSTimer         *theBubbleTimer;
  BOOL            bubbleFish;
  
  UIImageView *theFirstBackground;
  UIImageView *theSecondBackground;
  UIImageView *theThirdBackground;
  UIImageView *theFourthBackground;
  
  NSArray     *theBackgroundArray;
  int theBackgroundNumber;
  
  int theViewWidth, theViewHeight;
  
  UIImageView *theMobile;
  
  UILabel *thePosition;
  UILabel *theAngles;
  
  BOOL theXContact;
  BOOL theYContact;
  
  float theXAcc;
  float theYAcc;
  double theDirectionAngle;
  double theCurrentDirectionAngle;
  float theCurrentX;
  float theCurrentY;
  
  NSTimeInterval  theSamplingFrequency;
  
  AVAudioPlayer *theMusicPlayer;
  AVAudioPlayer *theBingPlayer;
  
 
  

  
}

@end

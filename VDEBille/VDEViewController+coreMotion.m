//
//  VDEViewController+coreMotion.m
//  VDEBille
//
//  Created by Utilisation on 18/06/2014.
//  Copyright (c) 2014 Utilisation. All rights reserved.
//

#import "VDEViewController+coreMotion.h"

@implementation VDEViewController (coreMotion)


-(void) startTimer {
  //---------------------------------------------------------------------------------------------------------------------------
  theTimer = [NSTimer scheduledTimerWithTimeInterval:theSamplingFrequency target:self selector:@selector(updateDisplay) userInfo:nil repeats:YES];
}

-(void) startTimerBubble {
   theBubbleTimer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(bubbleFish) userInfo:nil repeats:YES];
}

-(void) updateDisplay{
  //---------------------------------------------------------------------------------------------------------------------------

   theXAcc=[[theMotionManager deviceMotion] gravity].x;
   theYAcc=[[theMotionManager deviceMotion] gravity].y;
  
   theXAcc = roundf(theXAcc*100)/100.00;
   theYAcc = roundf(theYAcc*100)/100.00;
  
   theDirectionAngle = roundf(atan(theYAcc/theXAcc)*100)/100;
  if (theDirectionAngle <0) {
     theDirectionAngle = (3.14*2) + theDirectionAngle;
  }
  
  if ( (theXAcc/2) ) {
  theMobile.image = [UIImage imageNamed:@"mobile"];
  } else {
      theMobile.image = [UIImage imageNamed:@"bubbleFish"];
  }
  
  
  // Essai de rotation de l'image... raté !!!
  //---------------------------------------------------------------------------------------------------------------------------

        // theMobile.transform = CGAffineTransformMakeRotation(theXAcc);
        //theMobile.transform = CGAffineTransformMakeRotation(theYAcc);
        
       /*
        if ( (!(isnan(theDirectionAngle))) && (theCurrentDirectionAngle != theDirectionAngle)) { // direction change
           NSLog(@"angle : %f", theDirectionAngle);
          //theMobile.transform = CGAffineTransformMakeRotation(theDirectionAngle);
          [UIView animateWithDuration:0 delay:0.0 options:UIViewAnimationOptionTransitionNone
                           animations:^{
                             theMobile.transform = CGAffineTransformRotate(theMobile.transform, theDirectionAngle);
                           }
                           completion:nil];
        }
  */
  //---------------------------------------------------------------------------------------------------------------------------

  
   theAngles.text = [NSString stringWithFormat:@"Angle : x = %1.2f°, y = %1.2f°", theXAcc*90, theYAcc*90];
  
   theCurrentX = theCurrentX+theXAcc*40;
   theCurrentY = theCurrentY-theYAcc*40;
 
   if ( theCurrentX < 0.0)                { theCurrentX = 0.0;}
   if ( theCurrentY < 0.0)                { theCurrentY = 0.0;}
   if ( theCurrentX > theViewWidth-50)    { theCurrentX =theViewWidth-50;}
   if ( theCurrentY > theViewHeight-50)   { theCurrentY =theViewHeight-50;}


  int theRandomSound=(arc4random() % 5) + 1;
  if ( theXContact == NO ) {
    if (( theCurrentX <=0) || (theCurrentX >= theViewWidth-50)){
      // NSLog(@"play sound X %d", theRandomSound);
      [self playSound:[NSString stringWithFormat:@"squeeze-toy-%d", theRandomSound]];
    }
  }
  
  if ( theYContact == NO ) {
    if (( theCurrentY <=0) || (theCurrentY >= theViewHeight-50)){
      // NSLog(@"play sound Y %d", theRandomSound);
      [self playSound:[NSString stringWithFormat:@"squeeze-toy-%d", theRandomSound]];
    }
  }
  
  thePosition.text = [NSString stringWithFormat:@"Position : x = %1.2f, y = %1.2f", theCurrentX , theCurrentY];

  [theMobile   setFrame:CGRectMake(theCurrentX,theCurrentY,50,50)];
  
  // record the current values
  theYContact = ( theCurrentY <=0) || (theCurrentY >= theViewHeight-50);
  theXContact = ( theCurrentX <=0) || (theCurrentX >= theViewWidth-50);
  theCurrentDirectionAngle = theDirectionAngle;
  
}

-(void) bubbleFish {
  //---------------------------------------------------------------------------------------------------------------------------

  if (bubbleFish ){ // a little bit of random ness
    theMobile.image = [UIImage imageNamed:@"mobile"];
    }else {
      theMobile.image = [UIImage imageNamed:@"bubbleFish"];
    }
  bubbleFish = !bubbleFish;
}

-(void) playSound: (NSString*) theSoundFileName {
  //---------------------------------------------------------------------------------------------------------------------------
  NSError *err;
  NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:theSoundFileName ofType:@"mp3"];
  NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath];
  theBingPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:&err];
  if(theMusicPlayer){
    theBingPlayer.delegate = self;
    [theBingPlayer play];
  }
  
}

-(void) playMusic: (NSString*) theSoundFileName {
  //---------------------------------------------------------------------------------------------------------------------------
  NSError *err;
  NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:theSoundFileName ofType:@"mp3"];
  NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath];
  theMusicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:&err];
  if(theMusicPlayer){
    theMusicPlayer.delegate = self;
    theMusicPlayer.numberOfLoops = -1;
    [theMusicPlayer play];
  }
}

@end
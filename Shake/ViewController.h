//
//  ViewController.h
//  Shake
//
//  Created by SDT-1 on 2014. 1. 22..
//  Copyright (c) 2014년 T. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface ViewController : UIViewController<AVAudioPlayerDelegate,AVAudioRecorderDelegate,UIAccelerometerDelegate>{
    AVAudioPlayer *audioPlayer;
    AVAudioPlayer *audioPlayer2;
    float valueX;
    float valueY;
    
    float value2X;
    float value2Y;
    
    CGPoint ballMovement;
}
@property (weak, nonatomic) IBOutlet UIImageView *movingImage;
@property (weak, nonatomic) IBOutlet UIImageView *ball;
-(void)star;

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration;
- (void)initializerTimer;
- (void)animateBall:(NSTimer *)theTimer;

@end

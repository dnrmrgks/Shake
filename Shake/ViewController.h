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
    float valueX;
    float valueY;
}
@property (weak, nonatomic) IBOutlet UIImageView *movingImage;
-(void)star;
- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration;


@end

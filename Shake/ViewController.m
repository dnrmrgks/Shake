//
//  ViewController.m
//  Shake
//
//  Created by SDT-1 on 2014. 1. 22..
//  Copyright (c) 2014년 T. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation ViewController
{
    
    
    AVAudioPlayer *player;
   
}

-(void)star{
    
    [[UIAccelerometer sharedAccelerometer]setUpdateInterval:0.1];
    [[UIAccelerometer sharedAccelerometer]setDelegate:self];
}

-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration{
 

    int movingobject = 40;
    movingobject =arc4random() %39;
    valueX= acceleration.x *100.0;
    valueY= acceleration.y *100.0;
    
    float newValueX = (int) (self.movingImage.center.x+valueX);
    float newValueY = (int) (self.movingImage.center.y+valueY);
    
   
    if(newValueX > (320 -movingobject)){
        
        newValueX = (320 -movingobject);
    }
    if(newValueX <(0+ movingobject)){
        
        newValueX = (0 +movingobject);
    }
    
    if(newValueY > (400-movingobject)){
        
        newValueY = (400-movingobject);
    }
    
    if(newValueY <(0+movingobject)){
        newValueY = (0+movingobject);
    }
    
    CGPoint Position = CGPointMake(newValueX, newValueY);
    self.movingImage.center = Position;
}


-(void)sound1{
    
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"music1" ofType:@"mp3"];
    NSURL *fileUrl=[NSURL fileURLWithPath:filePath];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:fileUrl error:nil];
    [audioPlayer play];
    
}

- (void)ChangeSound:(NSTimer *)timer {
    
    [audioPlayer stop];
    NSString *filePath2 = [[NSBundle mainBundle]pathForResource:@"music2" ofType:@"mp3"];
    NSURL *fileUrl2 = [ NSURL fileURLWithPath:filePath2];
    audioPlayer2 = [[AVAudioPlayer alloc]initWithContentsOfURL:fileUrl2 error:nil];
    [audioPlayer2 play];
}
-(void)alpha{
    
    [UIView animateWithDuration:0.7 animations:^{
        self.image.alpha = (self.image.alpha == 0.0) ? 0.6: 0.0;
        if(self.image. alpha ==0.6){
            self.image.alpha ==0.0;
        }
        else{
            self.image.alpha==0.6;
        }
    }];
    
    
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self sound1];
    
    [NSTimer scheduledTimerWithTimeInterval:20 target:self selector:@selector(ChangeSound:) userInfo:nil repeats:NO];

    
    AVAudioSession *session = [AVAudioSession sharedInstance];
    __autoreleasing NSError *error = nil;
    [session setCategory:AVAudioSessionCategoryAmbient error:&error];
 
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
    [self star];
     }

- (BOOL)canBecomeFirstResponder {
    return YES;
}
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent*)event {
    
    
    [self alpha];
    
    
    
    
   /* NSString *filePath2 = [[NSBundle mainBundle]pathForResource:@"music2" ofType:@"mp3"];
    NSURL *fileUrl2 = [ NSURL fileURLWithPath:filePath2];
    audioPlayer2 = [[AVAudioPlayer alloc]initWithContentsOfURL:fileUrl2 error:nil];  */
    //[NSTimer scheduledTimerWithTimeInterval:20 target:self selector:@selector(ChangeSound:) userInfo:nil repeats:NO];
        
    
    
    
    NSLog(@"Shaking start");
}



- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent*)event {
    NSLog(@"Shaking end");
    
    
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent*)event {
    NSLog(@"Shaking cancel");
}


@end

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





- (void)viewDidLoad
{
    [super viewDidLoad];
 
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
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent*)event {
    
   
    
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"music1" ofType:@"mp3"];
    NSURL *fileUrl=[NSURL fileURLWithPath:filePath];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:fileUrl error:nil];
    [audioPlayer play];
                   
    
    
    NSLog(@"Shaking start");
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent*)event {
    NSLog(@"Shaking end");
    
    [audioPlayer stop];
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent*)event {
    NSLog(@"Shaking cancel");
}


@end

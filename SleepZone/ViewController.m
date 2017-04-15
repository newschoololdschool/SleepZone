//
//  ViewController.m
//  SleepZone
//
//  Created by Aaron Schachter on 4/14/17.
//  Copyright © 2017 New School Old School. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@property (assign, nonatomic) BOOL isPlayingRain;
@property (assign, nonatomic) BOOL isPlayingShusher;
@property (strong, nonatomic) AVAudioPlayer *rainPlayer;
@property (strong, nonatomic) AVAudioPlayer *shusherPlayer;
@property (weak, nonatomic) IBOutlet UISwitch *shusherSwitch;
@property (weak, nonatomic) IBOutlet UIView *shusherContainerView;
@property (weak, nonatomic) IBOutlet UIView *rainContainerView;

@property (weak, nonatomic) IBOutlet UISwitch *rainSwitch;
- (IBAction)rainSwitchValueChanged:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance] setActive: YES error: nil];
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];

    NSString *shusherSoundFilePath = [NSString stringWithFormat:@"%@/shh.m4a",[[NSBundle mainBundle] resourcePath]];
    NSURL *shusherSoundFileURL = [NSURL fileURLWithPath:shusherSoundFilePath];
    
    self.shusherPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:shusherSoundFileURL error:nil];
    self.shusherPlayer.numberOfLoops = -1;

    [self.shusherSwitch setOn:NO];
    self.isPlayingShusher = NO;

    NSString *rainFilePath = [NSString stringWithFormat:@"%@/rain.wav",[[NSBundle mainBundle] resourcePath]];
    NSURL *rainFileURL = [NSURL fileURLWithPath:rainFilePath];
    self.rainPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:rainFileURL error:nil];
    self.rainPlayer.numberOfLoops = -1;
    [self.rainPlayer setVolume:0.25];

    [self.rainSwitch setOn:NO];
    self.isPlayingRain = NO;
    
     UITapGestureRecognizer *shusherTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleShusherTap:)];
    [self.shusherContainerView addGestureRecognizer:shusherTap];
    UITapGestureRecognizer *rainTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleRainTap:)];
    [self.rainContainerView addGestureRecognizer:rainTap];
}

- (void)handleRainTap:(UITapGestureRecognizer *)recognizer {
    [self togglePlayingRain];
}

- (void)handleShusherTap:(UITapGestureRecognizer *)recognizer {
    [self togglePlayingShusher];
}

- (void)togglePlayingRain {
    self.isPlayingRain = !self.isPlayingRain;

    if (self.isPlayingRain) {
        [self.rainPlayer play];
    } else {
        [self.rainPlayer pause];
    }
    [self.rainSwitch setOn:self.isPlayingRain animated:YES];
}

- (void)togglePlayingShusher {
    self.isPlayingShusher = !self.isPlayingShusher;

    if (self.isPlayingShusher) {
        [self.shusherPlayer play];
    } else {
        [self.shusherPlayer pause];
    }
    [self.shusherSwitch setOn:self.isPlayingShusher animated:YES];
}

@end

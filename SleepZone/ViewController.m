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

@property (strong, nonatomic) AVAudioPlayer *rainPlayer;
@property (strong, nonatomic) AVAudioPlayer *shusherPlayer;
@property (weak, nonatomic) IBOutlet UISwitch *shusherSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *rainSwitch;
- (IBAction)rainSwitchValueChanged:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *shusherSoundFilePath = [NSString stringWithFormat:@"%@/shh.m4a",[[NSBundle mainBundle] resourcePath]];
    NSURL *shusherSoundFileURL = [NSURL fileURLWithPath:shusherSoundFilePath];
    
    self.shusherPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:shusherSoundFileURL error:nil];
    self.shusherPlayer.numberOfLoops = -1;
    [self.shusherSwitch setOn:NO];

    NSString *rainFilePath = [NSString stringWithFormat:@"%@/rain.wav",[[NSBundle mainBundle] resourcePath]];
    NSURL *rainFileURL = [NSURL fileURLWithPath:rainFilePath];
    self.rainPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:rainFileURL error:nil];
    self.rainPlayer.numberOfLoops = -1;
    [self.rainPlayer setVolume:0.5];
    [self.rainSwitch setOn:NO];
}

- (IBAction)shusherSwitchValueChanged:(id)sender {
    if (self.shusherSwitch.isOn) {
        [self.shusherPlayer play];
    } else {
        [self.shusherPlayer pause];
    }
}

- (IBAction)rainSwitchValueChanged:(id)sender {
    if (self.rainSwitch.isOn) {
        [self.rainPlayer play];
    } else {
        [self.rainPlayer pause];
    }
}
@end

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

@property (strong, nonatomic) AVAudioPlayer *player;
@property (weak, nonatomic) IBOutlet UISwitch *shusherSwitch;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *shusherSoundFilePath = [NSString stringWithFormat:@"%@/shh.m4a",[[NSBundle mainBundle] resourcePath]];
    NSURL *shusherSoundFileURL = [NSURL fileURLWithPath:shusherSoundFilePath];
    
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:shusherSoundFileURL error:nil];
    self.player.numberOfLoops = -1;
    [self.shusherSwitch setOn:NO];
}

- (IBAction)shusherSwitchValueChanged:(id)sender {
    if (self.shusherSwitch.isOn) {
        [self.player play];
    } else {
        [self.player pause];
    }
}

@end

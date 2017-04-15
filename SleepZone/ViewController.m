//
//  ViewController.m
//  SleepZone
//
//  Created by Aaron Schachter on 4/14/17.
//  Copyright © 2017 New School Old School. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UISwitch *shusherSwitch;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)shusherSwitchValueChanged:(id)sender {
    NSLog(@"shusherValue:%d", self.shusherSwitch.isOn);
}

@end

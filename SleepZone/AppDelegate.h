//
//  AppDelegate.h
//  SleepZone
//
//  Created by Aaron Schachter on 4/14/17.
//  Copyright © 2017 New School Old School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end


//
//  ClotheMeAppDelegate.m
//  ClotheMe
//
//  Created by Alex Tsang on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ClotheMeAppDelegate.h"
#import "ClotheMeViewController.h"

@implementation ClotheMeAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[ClotheMeViewController alloc] initWithNibName:@"ClotheMeViewController" bundle:nil]; 
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    [Crittercism initWithAppID: @"4cd78d3e66d787328d00003c"
                        andKey:@"4cd78d3e66d787328d00003csvlorgmd"
                     andSecret:@"7ep0tvnqelpffj9munxhtwidwbjbxyqu"
         andMainViewController:self.viewController];
    
    return YES;
}

@end

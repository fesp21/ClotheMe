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
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[ClotheMeViewController alloc] initWithNibName:@"ClotheMeViewController" bundle:nil]; 
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    [Crittercism initWithAppID: @"4e22f32addf5202545008f70"
                        andKey:@"4e22f32addf5202545008f70upufmecd"
                     andSecret:@"16cshrqonwzopdpyg2bjsakuu87mvkzy"
         andMainViewController:_viewController];
    
    return YES;
}

@end

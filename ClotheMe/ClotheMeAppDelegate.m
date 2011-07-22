//
//  ClotheMeAppDelegate.m
//  ClotheMe
//
//  Created by Alex Tsang on 7/16/11.
//  Copyright 2011 Altsa. All rights reserved.
//

#import "ClotheMeAppDelegate.h"

@implementation ClotheMeAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{   
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.viewController = [[[ClotheMeViewController alloc] initWithNibName:nil bundle:nil] autorelease]; 
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    //Don't autorelease cos crittercism needs its own copies
	NSDictionary *privatedatadc = [JSONLoader fileAsDictionary:@"PrivateInfo/info" withExtention:@"json"];
    [Crittercism initWithAppID:[[[privatedatadc objectForKey:@"CrittercismData"] objectForKey:@"AppID"] copy]
                        andKey:[[[privatedatadc objectForKey:@"CrittercismData"] objectForKey:@"Key"] copy]
                     andSecret:[[[privatedatadc objectForKey:@"CrittercismData"] objectForKey:@"Secret"] copy]
         andMainViewController:_viewController];
    
    return YES;
}

- (void)dealloc {
    self.window = nil;
    self.viewController = nil;
    
    [super dealloc];
}

@end

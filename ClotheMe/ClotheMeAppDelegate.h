//
//  ClotheMeAppDelegate.h
//  ClotheMe
//
//  Created by Alex Tsang on 7/16/11.
//  Copyright 2011 Altsa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShirtViewController.h"
#import "ClotheMeViewController.h"
#import "Crittercism.h"
#import "JSONLoader.h"

@class ClotheMeViewController;

@interface ClotheMeAppDelegate : UIResponder <UIApplicationDelegate>

@property (retain) UIWindow *window;
@property (retain) ClotheMeViewController *viewController;

@end

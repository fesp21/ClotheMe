//
//  ClotheMeAppDelegate.h
//  ClotheMe
//
//  Created by Alex Tsang on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Crittercism.h"
#import "ShirtViewController.h"

@class ClotheMeViewController;

@interface ClotheMeAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ClotheMeViewController *viewController;

@end

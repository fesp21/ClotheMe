//
//  ClotheMeViewController.h
//  ClotheMe
//
//  Created by Alex Tsang on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShirtViewController.h"
#import "Crittercism.h"

@interface ClotheMeViewController : UIViewController {
    ShirtViewController *_shirtViewController;
    ShirtViewController *_pantsViewController;
}

@property(nonatomic, retain) ShirtViewController *shirtViewController;
@property(nonatomic, retain) ShirtViewController *pantsViewController;

-(IBAction)sayHello:(id)sender;
-(IBAction)crittercismPressed:(id)sender;
-(void)makeCrittercismButton;
-(IBAction)launchCrittercism:(id)sender;

@end

//
//  ClotheMeViewController.h
//  ClotheMe
//
//  Created by Alex Tsang on 7/16/11.
//  Copyright 2011 Altsa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShirtViewController.h"
#import "Crittercism.h"

@interface ClotheMeViewController : UIViewController {
    ShirtViewController *_shirtViewController;
    ShirtViewController *_pantsViewController;
}

@property(retain) ShirtViewController *shirtViewController;
@property(retain) ShirtViewController *pantsViewController;

- (IBAction)crittercismPressed:(id)sender;
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event;

@end
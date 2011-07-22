//
//  ShirtViewController.h
//  ClotheMe
//
//  Created by Alex Tsang on 7/16/11.
//  Copyright 2011 Altsa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Crittercism.h"
#import "JSONLoader.h"
#import "Ebay.h"

@interface ShirtViewController : UIViewController {
    UIScrollView* scrollView;
    NSMutableArray* urls;
}

- (void)loadImages:(NSArray*)images descriptions:(NSArray*)desc;
- (IBAction)goToUrl:(id)sender;

@property (nonatomic, retain) UIScrollView* scrollView;

@end


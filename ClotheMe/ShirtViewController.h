//
//  ShirtViewController.h
//  ClotheMe
//
//  Created by Alex Tsang on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShirtViewController : UIViewController {
    UIScrollView* scrollView;
    NSArray* urls;
}

-(void)loadImages:(NSArray*)images urls:(NSArray*)surls;
-(IBAction)sayHello:(id)sender;
-(IBAction)goToUrl:(id)sender;

@property (nonatomic, retain) UIScrollView* scrollView;

@end


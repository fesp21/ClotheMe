//
//  ClotheMeViewController.m
//  ClotheMe
//
//  Created by Alex Tsang on 7/16/11.
//  Copyright 2011 Altsa. All rights reserved.
//

#import "ClotheMeViewController.h"
#import "ShirtViewController.h"

@implementation ClotheMeViewController

@synthesize shirtViewController = _shirtViewController, pantsViewController = _pantsViewController;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self becomeFirstResponder];
    
    if (self.shirtViewController == nil) {    
        UIScrollView* shirtView = [[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 218)] autorelease];
        [self.view addSubview:shirtView];
        self.shirtViewController = [[[ShirtViewController alloc] initWithNibName:nil bundle:nil] autorelease];
        self.shirtViewController.scrollView = shirtView;
        
        [self.shirtViewController loadImages:[NSArray arrayWithObjects:
                                              [UIImage imageNamed:@"shirtred.png"],
                                              [UIImage imageNamed:@"shirtblack.png"],
                                              [UIImage imageNamed:@"shirtyellow.png"], nil] 
                                        descriptions:[NSArray arrayWithObjects:
                                                      @"red%20shirt",
                                                      @"black%20shirt",
                                                      @"yellow%20striped%20shirt",nil]]; 
    }

    if (self.pantsViewController == nil) {    
        UIScrollView* pantsView = [[[UIScrollView alloc] initWithFrame:CGRectMake(0, 218, 320, 262)] autorelease];
        [self.view addSubview:pantsView];
        self.pantsViewController = [[[ShirtViewController alloc] initWithNibName:nil bundle:nil] autorelease];
        self.pantsViewController.scrollView = pantsView;
        
        [self.pantsViewController loadImages:[NSArray arrayWithObjects:
                                              [UIImage imageNamed:@"pantsblue.png"],
                                              [UIImage imageNamed:@"pantssweat.png"],
                                              [UIImage imageNamed:@"pantsgrey.png"], nil] 
                                descriptions:[NSArray arrayWithObjects:
                                              @"blue%20pants",
                                              @"black%20sweats",
                                              @"grey%20pants",nil]];         
    }
    
    UIButton *feedbackBtn = [[UIButton alloc] initWithFrame:CGRectMake(258.0f, 440.0f, 102.0/2, 60.0/2)];
    [feedbackBtn setImage:[UIImage imageNamed:@"btn-crittercism.png"] forState:UIControlStateNormal];
    [feedbackBtn setImage:[UIImage imageNamed:@"btn-crittercism-pressed.png"] forState:UIControlEventTouchDown];
    [feedbackBtn addTarget:self action:@selector(crittercismPressed:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:feedbackBtn];
    [feedbackBtn release];
}

- (IBAction)crittercismPressed:(id)sender {
    [Crittercism showCrittercism];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (event.type == UIEventSubtypeMotionShake) {
        int shirtindex = _shirtViewController.scrollView.contentOffset.x/320;
        int pantsindex = _shirtViewController.scrollView.contentOffset.x/320;
        int randomindex = arc4random()%3;
        
        while (randomindex == shirtindex) {
            randomindex = arc4random()%3;
        }
        
        randomindex *= 320;
        [_shirtViewController.scrollView scrollRectToVisible:CGRectMake(randomindex, 0, 320, 10) animated:YES];
        randomindex = arc4random()%3;
        
        while (randomindex == pantsindex) {
            randomindex = arc4random()&3;
        }
        
        randomindex *= 320;
        [_pantsViewController.scrollView scrollRectToVisible:CGRectMake(randomindex, 0, 320, 10) animated:YES];
    }
}

- (BOOL)canBecomeFirstResponder { 
    return YES; 
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

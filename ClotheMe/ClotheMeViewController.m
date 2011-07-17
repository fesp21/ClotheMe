//
//  ClotheMeViewController.m
//  ClotheMe
//
//  Created by Alex Tsang on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ClotheMeViewController.h"
#import "ShirtViewController.h"

@implementation ClotheMeViewController

@synthesize shirtViewController = _shirtViewController, pantsViewController = _pantsViewController;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.shirtViewController == nil) {    
        UIScrollView* shirtView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 218)];
        [self.view addSubview:shirtView];
        self.shirtViewController = [[ShirtViewController alloc] initWithNibName:nil bundle:nil];
        self.shirtViewController.scrollView = shirtView;
        
        [self.shirtViewController loadImages:[NSArray arrayWithObjects:
                                              [UIImage imageNamed:@"shirtred.png"],
                                              [UIImage imageNamed:@"shirtblack.png"],
                                              [UIImage imageNamed:@"shirtyellow.png"], nil] 
                                        urls:[NSArray arrayWithObjects:
                                              [NSURL URLWithString:@"http://m.bananarepublic.gap.com/product.html?dn=bp813533072&dv=0&shopid=2&pdn=bc10894"],
                                              [NSURL URLWithString:@"http://m.gap.com/product.html?dn=gp835908012&dv=1&shopid=0&pdn=gc5216"],
                                              [NSURL URLWithString:@"http://m.oldnavy.gap.com/product.html?dn=op867390002&dv=0&shopid=1&pdn=oc5256"], nil]]; 
    }
    
    if (self.pantsViewController == nil) {    
        UIScrollView* pantsView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 218, 320, 262)];
        [self.view addSubview:pantsView];
        self.pantsViewController = [[ShirtViewController alloc] initWithNibName:nil bundle:nil];
        self.pantsViewController.scrollView = pantsView;
        
        [self.pantsViewController loadImages:[NSArray arrayWithObjects:
                                              [UIImage imageNamed:@"pantsblue.png"],
                                              [UIImage imageNamed:@"pantssweat.png"],
                                              [UIImage imageNamed:@"pantsgrey.png"], nil] 
                                        urls:[NSArray arrayWithObjects:
                                              [NSURL URLWithString:@"http://m.oldnavy.gap.com/product.html?dn=op633496062&dv=1&shopid=1&pdn=oc5211"],
                                              [NSURL URLWithString:@"http://m.oldnavy.gap.com/product.html?dn=op814861022&dv=1&shopid=1&pdn=oc5211"],
                                              [NSURL URLWithString:@"http://m.oldnavy.gap.com/product.html?dn=op859468022&dv=1&shopid=1&pdn=oc5211"], nil]];         
    }
    
    UIButton *feedbackBtn = [[UIButton alloc] initWithFrame:CGRectMake(258.0f, 440.0f, 102.0/2, 60.0/2)];
    [feedbackBtn setImage:[UIImage imageNamed:@"btn-crittercism.png"] forState:UIControlStateNormal];
    [feedbackBtn setImage:[UIImage imageNamed:@"btn-crittercism-pressed.png"] forState:UIControlEventTouchDown];
    [feedbackBtn addTarget:self action:@selector(crittercismPressed:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:feedbackBtn];
}

- (IBAction)crittercismPressed:(id)sender {
    [Crittercism showCrittercism];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

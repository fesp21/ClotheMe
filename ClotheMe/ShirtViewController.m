//
//  ShirtViewController.m
//  ClotheMe
//
//  Created by Alex Tsang on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ShirtViewController.h"

@implementation ShirtViewController

@synthesize scrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)loadImages:(NSArray*)images urls:(NSArray*)surls {
    urls = surls;
    
    [scrollView setBackgroundColor:[UIColor whiteColor]];
    [scrollView setShowsHorizontalScrollIndicator:NO];
    
    NSArray *colors = [NSArray arrayWithObjects:[UIColor whiteColor], [UIColor whiteColor], [UIColor whiteColor], nil];
    for (int i = 0; i < images.count; i++) {
        CGRect frame;
        frame.origin.x = scrollView.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = scrollView.frame.size;
        UIView *subview = [[UIView alloc] initWithFrame:frame];
        subview.backgroundColor = [colors objectAtIndex:i];
        [scrollView addSubview:subview];
        
        UIImage *clotheView;
        
        clotheView = [[images objectAtIndex:i] copy];
        
        UIButton *testButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, clotheView.size.width, clotheView.size.height)];
        [testButton setImage:clotheView forState:UIControlStateNormal];
        testButton.center = CGPointMake(scrollView.frame.size.width * i+320/2, 220/2);
        [testButton setTag:i];
        [testButton addTarget:self action:@selector(goToUrl:) forControlEvents:UIControlEventTouchDown];
        [scrollView addSubview:testButton];
    }
    
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * colors.count, scrollView.frame.size.height);
    
    scrollView.pagingEnabled = true;
}

-(IBAction)goToUrl:(id)sender {
    [[UIApplication sharedApplication] openURL:[urls objectAtIndex:((UIButton*)sender).tag]];
}

#pragma mark - View lifecycle

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

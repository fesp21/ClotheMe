//
//  ShirtViewController.m
//  ClotheMe
//
//  Created by Alex Tsang on 7/16/11.
//  Copyright 2011 Altsa. All rights reserved.
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

-(void) addGradient:(UIButton *) _button {
	
	// Add Border
	CALayer *layer = _button.layer;
	layer.cornerRadius = 8.0f;
    layer.masksToBounds = YES;
    layer.borderWidth = 1.0f;
    layer.borderColor = [UIColor colorWithWhite:0.5f alpha:0.2f].CGColor;
	
	// Add Shine
	CAGradientLayer *shineLayer = [CAGradientLayer layer];
    shineLayer.frame = layer.bounds;
    shineLayer.colors = [NSArray arrayWithObjects:
                         (id)[UIColor colorWithWhite:1.0f alpha:0.4f].CGColor,
                         (id)[UIColor colorWithWhite:1.0f alpha:0.2f].CGColor,
                         (id)[UIColor colorWithWhite:0.75f alpha:0.2f].CGColor,
                         (id)[UIColor colorWithWhite:0.4f alpha:0.2f].CGColor,
                         (id)[UIColor colorWithWhite:1.0f alpha:0.4f].CGColor,
                         nil];
    shineLayer.locations = [NSArray arrayWithObjects:
                            [NSNumber numberWithFloat:0.0f],
                            [NSNumber numberWithFloat:0.5f],
                            [NSNumber numberWithFloat:0.5f],
                            [NSNumber numberWithFloat:0.8f],
                            [NSNumber numberWithFloat:1.0f],
                            nil];
    [layer addSublayer:shineLayer];
}

- (void)loadImages:(NSArray*)images descriptions:(NSArray*)desc {
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
        [subview release];
        
        UIImage *clotheView = [[images objectAtIndex:i] copy];
        UIButton *testButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, clotheView.size.width, clotheView.size.height)];
        [testButton setImage:clotheView forState:UIControlStateNormal];
        testButton.center = CGPointMake(scrollView.frame.size.width * i+320/2, 220/2);
        [testButton setTag:i];
        [testButton addTarget:self action:@selector(goToUrl:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:testButton];
        [testButton release];
        [clotheView release];
        
        UIButton *pricetag = [[UIButton alloc] initWithFrame:CGRectMake(scrollView.frame.size.width*i+320-70, 0, 70, 20)];
        [pricetag setTitle:[NSString stringWithFormat:@"$%.2f",[Ebay averagePriceForProduct:[desc objectAtIndex:i]]] forState:UIControlStateNormal];
        [pricetag setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [pricetag setTag:i];
        [pricetag addTarget:self action:@selector(goToUrl:) forControlEvents:UIControlEventTouchUpInside];
        [self addGradient:pricetag];
        [scrollView addSubview:pricetag];
        [pricetag release];
        
        UIImageView *ebayLogo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ebay.png"]];
        [ebayLogo setCenter:CGPointMake(scrollView.frame.size.width*i+320-30, 34)];
        [scrollView addSubview:ebayLogo];
        [ebayLogo release];
    }
    
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * colors.count, scrollView.frame.size.height);
    
    scrollView.pagingEnabled = true;
    
    urls = [[NSMutableArray alloc] init];
    
    for(NSString* description in desc) {
        NSURL *url = [Ebay urlForProduct:description];
        [urls addObject:url];
    }
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

//
//  ARRootViewController.m
//  AsyncRequestHandler
//
//  Created by Tom Arnfeld on 24/02/2012.
//  Copyright (c) 2012 Tom Arnfeld. All rights reserved.
//

#import "ARRootViewController.h"
#import "ARRequestHandler.h"
#import <QuartzCore/QuartzCore.h>

@implementation ARRootViewController

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

#pragma mark - View lifecycle

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_button setFrame:CGRectMake(60, 216, 200, 44)];
    [_button setTitle:@"Perform Request" forState:UIControlStateNormal];
    [_button setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin];
    [_button addTarget:self action:@selector(tappedButton:) forControlEvents:UIControlEventTouchUpInside];
    
    _indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [_indicator setFrame:CGRectMake(149, 229, 22, 22)];
    [_indicator setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin];
    [_indicator setHidden:NO];
    [_indicator startAnimating];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 220, 320, 40)];
    [_label setTextAlignment:UITextAlignmentCenter];
    [_label setText:@"Request Completed."];
    
    [self.view addSubview:_button];
    [self.view addSubview:_indicator];
    [self.view addSubview:_label];
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

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

# pragma mark - Events

- (void)tappedButton:(id)sender
{
    [_button setHidden:YES];
    [_indicator setHidden:NO];
    [_indicator startAnimating];
    
    NSString *requestUri = @"http://api.twtmore.com/";
    NSDictionary *params = nil;
    
    [ARRequestHandler performPostRequestWithUri:requestUri params:params completionHandler:^(NSDictionary *response, NSError *error) {
        
        NSLog(@"%@", error);
        NSLog(@"%@", response);
    }];
}

@end

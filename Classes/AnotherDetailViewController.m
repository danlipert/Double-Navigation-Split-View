    //
//  AnotherDetailViewController.m
//  NavSplit
//
//  Created by Dan Lipert on 12/30/11.
//  Copyright 2011 Dan Lipert. All rights reserved.
//

#import "AnotherDetailViewController.h"


@implementation AnotherDetailViewController

-(id)init
{
	if(self = [super init])
	{

	}
	return self;
}

-(void)viewDidLoad
{
	[self.view setBackgroundColor:[UIColor purpleColor]];
}

-(void)viewDidAppear:(BOOL)animated
{
	[[[UIApplication sharedApplication] delegate] addMenuButton];
}

#pragma mark -
#pragma mark splitviewcontroller delegate calls these

- (void)showRootPopoverButtonItem:(UIBarButtonItem *)barButtonItem {
    // Add the popover button to the left navigation item.
	[self.navigationItem setRightBarButtonItem:barButtonItem];
}


- (void)invalidateRootPopoverButtonItem:(UIBarButtonItem *)barButtonItem {
    // Remove the popover button.
	[self.navigationItem setRightBarButtonItem:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

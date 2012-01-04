//
//  DoubleNavSplitAppDelegate.m
//  DoubleNavSplit
//
//  Created by Dan Lipert on 1/3/12.
//  Copyright 2012 Dan Lipert. All rights reserved.
//

#import "DoubleNavSplitAppDelegate.h"


#import "RootViewController.h"
#import "AnotherDetailViewController.h"

@implementation DoubleNavSplitAppDelegate

@synthesize window, splitViewController, rightNavigationController, leftNavigationController;
@synthesize popoverController, popoverButtonItem;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch.
	RootViewController *rootViewController = [[[RootViewController alloc] initWithStyle:UITableViewStylePlain] autorelease];
    [leftNavigationController setViewControllers:[NSArray arrayWithObject:rootViewController]];;
	
	AnotherDetailViewController *anotherDetailViewController = [[[AnotherDetailViewController alloc] init] autorelease];
	[rightNavigationController setViewControllers:[NSArray arrayWithObject:anotherDetailViewController]];
	
	[splitViewController setDelegate:self];
    // Add the split view controller's view to the window and display.
    [self.window addSubview:splitViewController.view];
    [self.window makeKeyAndVisible];
    
    return YES;
}

#pragma mark -
#pragma mark split view delegate

- (void)splitViewController:(UISplitViewController*)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem*)barButtonItem forPopoverController:(UIPopoverController*)pc {
    
    // Keep references to the popover controller and the popover button, and tell the detail view controller to show the button.
    barButtonItem.title = @"Menu";
    self.popoverController = pc;
    self.popoverButtonItem = barButtonItem;
	[self.rightNavigationController.topViewController showRootPopoverButtonItem:self.popoverButtonItem];
}


- (void)splitViewController:(UISplitViewController*)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
	
    // Nil out references to the popover controller and the popover button, and tell the detail view controller to hide the button.
    [self.rightNavigationController.topViewController invalidateRootPopoverButtonItem:self.popoverButtonItem];
    self.popoverController = nil;
    self.popoverButtonItem = nil;
}

-(void)dismissPopover
{
	[self.popoverController dismissPopoverAnimated:YES];
}

-(void)addMenuButton
{
	[self.rightNavigationController.topViewController showRootPopoverButtonItem:self.popoverButtonItem];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [splitViewController release];
    [window release];
    [super dealloc];
}


@end


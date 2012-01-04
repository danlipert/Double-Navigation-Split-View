//
//  DoubleNavSplitAppDelegate.h
//  DoubleNavSplit
//
//  Created by Dan Lipert on 1/3/12.
//  Copyright 2012 Dan Lipert. All rights reserved.
//

#import <UIKit/UIKit.h>


@class RootViewController;
@class DetailViewController;

@interface DoubleNavSplitAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    
    UISplitViewController *splitViewController;
    
	UINavigationController *leftNavigationController;
	UINavigationController *rightNavigationController;
	
	UIPopoverController *popoverController;
	UIBarButtonItem *popoverButtonItem;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UISplitViewController *splitViewController;

@property (nonatomic, retain) IBOutlet UINavigationController *leftNavigationController;
@property (nonatomic, retain) IBOutlet UINavigationController *rightNavigationController;

@property (nonatomic, retain) UIPopoverController *popoverController;
@property (nonatomic, retain) UIBarButtonItem *popoverButtonItem;

@end

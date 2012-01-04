//
//  RootViewController.m
//  DoubleNavSplit
//
//  Created by Dan Lipert on 1/3/12.
//  Copyright 2012 independent developer. All rights reserved.
//

#import "RootViewController.h"
#import "AnotherDetailViewController.h"

@implementation RootViewController


#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
}


// Ensure that the view controller supports rotation and that the split view can therefore show in both portrait and landscape.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CellIdentifier";
    
    // Dequeue or create a cell of the appropriate type.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    // Configure the cell.
	if(indexPath.row == 0)
	{
		[cell.textLabel setText:@"Push new menu"];
	} else {
		if(indexPath.row %2 == 0)
		{
			cell.textLabel.text = [NSString stringWithFormat:@"Row %d Green", indexPath.row];
		} else {
			cell.textLabel.text = [NSString stringWithFormat:@"Row %d Purple", indexPath.row];

		}
	}
	
    return cell;
}



#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	if(indexPath.row == 0)
	{
		RootViewController *rootViewController = [[[RootViewController alloc] initWithStyle:UITableViewStylePlain] autorelease];
		[[[[UIApplication sharedApplication] delegate] leftNavigationController] pushViewController:rootViewController animated:YES];
	} else {
		//first invalidate current popover if it exists
		[[[UIApplication sharedApplication] delegate] dismissPopover];
		 
		AnotherDetailViewController *anotherDetailViewController = [[[AnotherDetailViewController alloc] init] autorelease];
		
		if(indexPath.row %2 == 0)
		{
			[anotherDetailViewController.view setBackgroundColor:[UIColor greenColor]];
		}
		
		[[[[UIApplication sharedApplication] delegate] rightNavigationController] pushViewController:anotherDetailViewController animated:YES];
		 
		//add button if neccessary
		[[[UIApplication sharedApplication] delegate] addMenuButton];

	}
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end


//
//  TodayScreenView.m
//  TodayScreen
//
//  Created by Mac Pro on 5/25/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TodayScreenView.h"
#import "WidgetViewControllerSuperClass.h"


@implementation TodayScreenView

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	//self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg2.png"]];
	todayScreenTableViewController = [[TodayScreenTableViewController alloc] initWithStyle:UITableViewStylePlain];
	
	tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg2.png"]];
	//tableView = todayScreenTableViewController.view;
	[tableView addSubview:todayScreenTableViewController.view];	
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

#pragma mark -
#pragma mark Add New Widget Modal Status Window

- (void)AddNewWidgetViewController:(AddNewWidgetViewController *)controller widgetType:(NSInteger) widgetType
{
	[todayScreenTableViewController addNewWidget:widgetType];
	[self dismissModalViewControllerAnimated:YES];
}

- (void)showModalAddWindow:(id)sender
{
	AddNewWidgetViewController *addNewWidgetViewController = [[AddNewWidgetViewController alloc] init];
    addNewWidgetViewController.delegate = self;
    
    [self presentModalViewController:addNewWidgetViewController animated:YES];
    [addNewWidgetViewController release];    
}


- (void)cancelAddWidget
{
	[self dismissModalViewControllerAnimated:YES];
}


-(IBAction) controlEditingTable:(id)sender {
	if([todayScreenTableViewController isEditing] == NO) {
		[self startEditingTable:sender];
	} else {
		[self stopEditingTable:sender];
	}
}
- (void) startEditingTable:(id)sender {
	//UITableViewCell *test = [todayScreenTableViewController.tableView cellForRowAtIndexPath:[NSIndexPath indexPathWithIndex:1]];
	//test.backgroundColor = [UIColor blackColor];
	[todayScreenTableViewController setEditing:YES animated:YES];
	[todayScreenTableViewController.tableView reloadData];
	//UITableViewCell *test = [todayScreenTableViewController.tableView cellForRowAtIndexPath:[NSIndexPath indexPathWithIndex:1]];
	//test.backgroundColor = [UIColor blackColor];
	//[test setNeedsLayout];
	//WidgetViewControllerSuperClass *t = [[WidgetViewControllerSuperClass alloc] init];
	//t.view = [test viewWithTag:1];
	//[t startEditMode];
	tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"settingsbg.png"]];
}

- (void) stopEditingTable:(id)sender {
	[todayScreenTableViewController setEditing:NO animated:YES];
	[todayScreenTableViewController.tableView reloadData];
	tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg2.png"]];
}

- (void)dealloc {
	[todayScreenTableViewController release];
    [super dealloc];
}


@end

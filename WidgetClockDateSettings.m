//
//  WidgetClockDateSettings.m
//  TodayScreen
//
//  Created by Mac Pro on 5/30/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WidgetClockDateSettings.h"


@implementation WidgetClockDateSettings

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
	self.title = @"Clock Date Settings";
	/*UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] 
									 initWithTitle:@"Save" 
									 style:UIBarButtonItemStyleBordered 
									 target:self 
									 action:@selector(showStatusComposeView)];*/
	UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] 
								   initWithBarButtonSystemItem:UIBarButtonSystemItemSave 
								   target:self 
								   action:@selector(saveAction:)];
	UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] 
								   initWithBarButtonSystemItem:UIBarButtonSystemItemCancel 
								   target:self 
								   action:@selector(cancelAction:)];	
	self.navigationItem.rightBarButtonItem = saveButton;	
	self.navigationItem.leftBarButtonItem = cancelButton;
	[saveButton release];	
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


- (void)dealloc {
    [super dealloc];
}


@end

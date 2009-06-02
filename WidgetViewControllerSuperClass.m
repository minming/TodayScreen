//
//  WidgetViewControllerSuperClass.m
//  TodayScreen
//
//  Created by Mac Pro on 5/30/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WidgetViewControllerSuperClass.h"


@implementation WidgetViewControllerSuperClass

@synthesize tableViewController;

//@synthesize widgetHeight;

- (int)getHeight {
	return 100;
	//return widgetHeight;
}

-(id) initWithSuperTableController:(UITableViewController*)superViewController {
	if (self = [super init]) {
		tableViewController = superViewController;
		[tableViewController retain];
	}
    return self;
}
/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		self.view.tag = 1;
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

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)enableBackground:(BOOL)bg {
	if (bg == YES) {
		[self.view setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.2]];
	} else {
		[self.view setBackgroundColor:[UIColor clearColor]];
	}
}

- (void)startEditMode {
	//[self.view setBackgroundColor:[UIColor blackColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[tableViewController release];
    [super dealloc];
}


@end

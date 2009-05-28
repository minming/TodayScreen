//
//  WidgetFlipClockDate.m
//  TodayScreen
//
//  Created by Mac Pro on 5/25/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WidgetFlipClockDate.h"


@implementation WidgetFlipClockDate

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
	[self runTimer];  
}

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)runTimer {  
	// This starts the timer which fires the showActivity  
	// method every 0.5 seconds  
	myTicker = [NSTimer scheduledTimerWithTimeInterval: 0.5  
												target: self  
											  selector: @selector(showActivity)  
											  userInfo: nil  
											   repeats: YES];  
	
}  

// This method is run every 0.5 seconds by the timer created  
// in the function runTimer  
- (void)showActivity {  
	
	NSDateFormatter *hourFormatter = [[[NSDateFormatter alloc] init] autorelease];  
    [hourFormatter setDateFormat:@"h"];
	[hour setText:[hourFormatter stringFromDate:[NSDate date]]];  
	
	NSDateFormatter *minFormatter = [[[NSDateFormatter alloc] init] autorelease];  
    [minFormatter setDateFormat:@"mm"];
	[min setText:[minFormatter stringFromDate:[NSDate date]]];  
	
	NSDateFormatter *ampmFormatter = [[[NSDateFormatter alloc] init] autorelease];  
    [ampmFormatter setDateFormat:@"a"];
	[ampmFormatter setAMSymbol:@"AM"];
	[ampmFormatter setPMSymbol:@"PM"];
	[ampm setText:[ampmFormatter stringFromDate:[NSDate date]]];  	
	
	NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];  
    [dateFormatter setDateFormat:@"EEE dd MMM YYYY"];
	[date setText:[dateFormatter stringFromDate:[NSDate date]]];  
	
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

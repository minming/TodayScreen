//
//  WidgetFlipClockDate.m
//  TodayScreen
//
//  Created by Mac Pro on 5/25/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WidgetFlipClockDate.h"


@implementation WidgetFlipClockDate

- (int)getHeight {
	return 130;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[self runTimer];  
}

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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[tableViewController release];
    [super dealloc];
}


@end

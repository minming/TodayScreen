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
		//[self setWidgetHeight:100];
    }
    return self;
}
*/

- (int)getHeight {
	return 130;
}

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

- (void)infoButtonAction:(id)sender {
	/*
	 WidgetClockDateSettings *c = [[WidgetClockDateSettings alloc] init];
	 c.view.frame = CGRectMake(0,30,100,100);
	 //[self presentModalViewController:s animated:YES];
	 WidgetSettingsSuperClass *s = [[WidgetSettingsSuperClass alloc] init];
	 //[s.mainContentScrollView addSubview:c.view];
	 //[s.mainContentScrollView setNeedsLayout];
	 //[s.view setNeedsLayout];
	 
	 [s.mainContentView addSubview:c.view];
	 [s.mainContentView setNeedsLayout];
	 [s.view setNeedsLayout];
	 
	 //[s.view addSubview:c.view];
	 
	 //s.mainContentScrollView = c.view;
	 [self presentModalViewController:s animated:YES];
	
	
	WidgetSettingsNavigationController *navController = [[WidgetSettingsNavigationController alloc] init];
	//navController.navigationBar.barStyle = UIBarStyleBlackOpaque;
	WidgetFlipClockDateSettings *widgetFlipClockDateSettings = [[WidgetFlipClockDateSettings alloc] init];
	[navController pushViewController:widgetFlipClockDateSettings animated:YES];
	[self presentModalViewController:navController animated:YES]; */
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

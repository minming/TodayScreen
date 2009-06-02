//
//  WidgetClockDate.m
//  TodayScreen
//
//  Created by Mac Pro on 5/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WidgetClockDate.h"
#import "WidgetClockDateSettings.h"
//#import "WidgetSettingsSuperClass.h"
#import "WidgetSettingsNavigationController.h"

@implementation WidgetClockDate

//@synthesize dateFormat;
@synthesize timeFormat;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

-(id) initWithSuperTableController:(UITableViewController*)superViewController timeFormat:(NSString*) value {
	if (self = [super init]) {
		tableViewController = superViewController;
		[tableViewController retain];
		[self setTimeFormat:value];
	}
    return self;
}

- (int)getHeight {
	return 40;
}

- (void)editSettingsAction:(id)sender {
	NSLog(@"SETTINGS");
	WidgetSettingsNavigationController *navController = [[WidgetSettingsNavigationController alloc] init];
	//navController.navigationBar.barStyle = UIBarStyleBlackOpaque;
	WidgetClockDateSettings *widgetClockDateSettings = [[WidgetClockDateSettings alloc] init];
	[navController pushViewController:widgetClockDateSettings animated:YES];
	[self presentModalViewController:navController animated:YES];
}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor clearColor];
	//[timeLabel setFont:[UIFont fontWithName:@"DBLCDTempBlack" size:24.0]];
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

#define FONT_SIZE 25

// This method is run every 0.5 seconds by the timer created  
// in the function runTimer  
- (void)showActivity {  
	
	NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];  
    //NSDate *date = [NSDate date];  
    [formatter setDateFormat:[self timeFormat]];
	[formatter setAMSymbol:@"AM"];
	[formatter setPMSymbol:@"PM"];
	//[formatter setTimeStyle:NSDateFormatterShortStyle];  
	[timeLabel setText:[formatter stringFromDate:[NSDate date]]];  
	[timeLabel setFont:[UIFont systemFontOfSize:FONT_SIZE]];
	/*
	NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];  
    //NSDate *dateFormatter = [NSDate date];  
    [dateFormatter setDateFormat:@"EEE dd MMM"];
	//[formatter setTimeStyle:NSDateFormatterShortStyle];  
	[dateLabel setText:[dateFormatter stringFromDate:[NSDate date]]];
	[dateLabel setFont:[UIFont systemFontOfSize:FONT_SIZE]];
	 */
}  

/*
 a:	AM/PM
 A:	0~86399999 (Millisecond of Day)
 
 c/cc:	1~7 (Day of Week)
 ccc:	Sun/Mon/Tue/Wed/Thu/Fri/Sat
 cccc:	Sunday/Monday/Tuesday/Wednesday/Thursday/Friday/Saturday
 
 d:	1~31 (0 padded Day of Month)
 D:	1~366 (0 padded Day of Year)
 
 e:	1~7 (0 padded Day of Week)
 E~EEE:	Sun/Mon/Tue/Wed/Thu/Fri/Sat
 EEEE:	Sunday/Monday/Tuesday/Wednesday/Thursday/Friday/Saturday
 
 F:	1~5 (0 padded Week of Month, first day of week = Monday)
 
 g:	Julian Day Number (number of days since 4713 BC January 1)
 G~GGG:	BC/AD (Era Designator Abbreviated)
 GGGG:	Before Christ/Anno Domini
 
 h:	1~12 (0 padded Hour (12hr))
 H:	0~23 (0 padded Hour (24hr))
 
 k:	1~24 (0 padded Hour (24hr)
 K:	0~11 (0 padded Hour (12hr))
 
 L/LL:	1~12 (0 padded Month)
 LLL:	Jan/Feb/Mar/Apr/May/Jun/Jul/Aug/Sep/Oct/Nov/Dec
 LLLL:	January/February/March/April/May/June/July/August/September/October/November/December
 
 m:	0~59 (0 padded Minute)
 M/MM:	1~12 (0 padded Month)
 MMM:	Jan/Feb/Mar/Apr/May/Jun/Jul/Aug/Sep/Oct/Nov/Dec
 MMMM:	January/February/March/April/May/June/July/August/September/October/November/December
 
 q/qq:	1~4 (0 padded Quarter)
 qqq:	Q1/Q2/Q3/Q4
 qqqq:	1st quarter/2nd quarter/3rd quarter/4th quarter
 Q/QQ:	1~4 (0 padded Quarter)
 QQQ:	Q1/Q2/Q3/Q4
 QQQQ:	1st quarter/2nd quarter/3rd quarter/4th quarter
 
 s:	0~59 (0 padded Second)
 S:	(rounded Sub-Second)
 
 u:	(0 padded Year)
 
 v~vvv:	(General GMT Timezone Abbreviation)
 vvvv:	(General GMT Timezone Name)
 
 w:	1~53 (0 padded Week of Year, 1st day of week = Sunday, NB: 1st week of year starts from the last Sunday of last year)
 W:	1~5 (0 padded Week of Month, 1st day of week = Sunday)
 
 y/yyyy:	(Full Year)
 yy/yyy:	(2 Digits Year)
 Y/YYYY:	(Full Year, starting from the Sunday of the 1st week of year)
 YY/YYY:	(2 Digits Year, starting from the Sunday of the 1st week of year)
 
 z~zzz:	(Specific GMT Timezone Abbreviation)
 zzzz:	(Specific GMT Timezone Name)
 Z:	+0000 (RFC 822 Timezone)
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}


@end

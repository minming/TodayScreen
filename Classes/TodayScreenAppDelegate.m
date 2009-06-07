//
//  TodayScreenAppDelegate.m
//  TodayScreen
//
//  Created by Mac Pro on 5/20/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "TodayScreenAppDelegate.h"

@implementation TodayScreenAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	[application setStatusBarHidden:YES animated:NO];
	
    // Override point for customization after application launch
	todayScreenView = [[TodayScreenView alloc] init];
	//UIView *uiView = [[UIView alloc] init];
	//[uiView addSubview:todayScreenTableViewController];
	todayScreenView.view.opaque = NO;
	[window addSubview:todayScreenView.view];
	
    [window makeKeyAndVisible];
}

- (void)applicationWillTerminate:(UIApplication *)application {
	[[todayScreenView todayScreenTableViewController] saveUserPrefs];
}

- (void)dealloc {
	[todayScreenView release];
    [window release];
    [super dealloc];
}


@end

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

    // Override point for customization after application launch
	todayScreenView = [[TodayScreenView alloc] init];
	//UIView *uiView = [[UIView alloc] init];
	//[uiView addSubview:todayScreenTableViewController];
	[window addSubview:todayScreenView.view];
	
    [window makeKeyAndVisible];
}


- (void)dealloc {
	[todayScreenView release];
    [window release];
    [super dealloc];
}


@end

//
//  WidgetAppLauncherSettings.m
//  TodayScreen
//
//  Created by Shravan Reddy on 6/2/09.
//  Copyright 2009 Stanford University. All rights reserved.
//

#import "WidgetAppLauncherSettings.h"

@implementation WidgetAppLauncherSettings

@synthesize buttonListView;

- (id)initWithWidget:(WidgetAppLauncher*)widget {
    if (self = [super init]) {
		appLauncherWidget = widget;
		[appLauncherWidget retain];
		[appLauncherWidget setDeleteMode:YES];
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"Add New URL";
	
	[buttonListView addSubview: appLauncherWidget.view];
}

- (void)saveAction:(id)sender {
	if ([urlField.text length] > 0 && [nameField.text length] > 0) {
		[appLauncherWidget addURL:urlField.text name:nameField.text];
	}
	[appLauncherWidget setDeleteMode:NO];
	[super saveAction:sender];
}

- (void)dealloc {
	[appLauncherWidget release];
    [super dealloc];
}


@end

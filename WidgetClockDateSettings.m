//
//  WidgetClockDateSettings.m
//  TodayScreen
//
//  Created by Mac Pro on 5/30/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WidgetClockDateSettings.h"


@implementation WidgetClockDateSettings

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"Clock Date Settings";
	
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}


@end

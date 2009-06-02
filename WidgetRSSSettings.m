//
//  WidgetRSSSettings.m
//  TodayScreen
//
//  Created by Shravan Reddy on 5/30/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WidgetRSSSettings.h"

@implementation WidgetRSSSettings

- (id)initWithWidget:(WidgetRSS*)widget {
    if (self = [super init]) {
		rssWidget = widget;
		[rssWidget retain];
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"RSS Settings";
	
	UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveAction:)];
	UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelAction:)];	
	self.navigationItem.rightBarButtonItem = saveButton;	
	self.navigationItem.leftBarButtonItem = cancelButton;
	[saveButton release];	
}

- (void)cancelAction:(id)sender
{
	[self dismissModalViewControllerAnimated:YES];
}

- (void)saveAction:(id)sender {
	[rssWidget setRssFeed:rssField.text];
	[rssWidget setNUM_OF_FEEDS:numFeedsField.text.integerValue];
	[rssWidget viewDidLoad];
	[self dismissModalViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[rssWidget release];
    [super dealloc];
}


@end

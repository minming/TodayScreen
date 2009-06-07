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
	
	rssField.text = rssWidget.rssFeed;
	numFeedsField.text = [NSString stringWithFormat:@"%d", rssWidget.NUM_OF_FEEDS];
	
	self.title = @"RSS Settings";
}

- (void)saveAction:(id)sender {
	[rssWidget changeSettingsAndReload:rssField.text numFeeds:[numFeedsField.text intValue]];
	[super saveAction:sender];
}


- (void)dealloc {
	[rssWidget release];
    [super dealloc];
}


@end

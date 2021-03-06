//
//  WidgetClockDateSettings.m
//  TodayScreen
//
//  Created by Mac Pro on 5/30/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WidgetClockDateSettings.h"

@implementation WidgetClockDateSettings

- (id)initWithWidget:(WidgetClockDate*)widget {
    if (self = [super init]) {
		clockDateWidget = widget;
		[clockDateWidget retain];
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"Clock Date Settings";
	timeFormatTextField.text = clockDateWidget.timeFormat;
}

- (void)saveAction:(id)sender {
	[clockDateWidget changeSettingsAndReload:timeFormatTextField.text];
	[super saveAction:sender];
}

- (void)dealloc {
	[clockDateWidget release];
    [super dealloc];
}


@end

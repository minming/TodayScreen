//
//  WidgetWeatherSettings.m
//  TodayScreen
//
//  Created by Mac Pro on 5/30/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WidgetWeatherSettings.h"

@implementation WidgetWeatherSettings

- (id)initWithWidget:(WidgetWeather*)widget {
    if (self = [super init]) {
		weatherWidget = widget;
		[weatherWidget retain];
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"Weather Settings";
}

- (void)saveAction:(id)sender {
	[weatherWidget setZipCode: zipCodeField.text];
	[weatherWidget viewDidLoad];
	[super saveAction:sender];
}

- (void)dealloc {
	[weatherWidget release];
    [super dealloc];
}


@end

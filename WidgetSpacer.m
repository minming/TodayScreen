//
//  WidgetSpacer.m
//  TodayScreen
//
//  Created by Mac Pro on 6/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WidgetSpacer.h"


@implementation WidgetSpacer

@synthesize spacingHeight;

- (int)getHeight {
	return spacingHeight;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}


@end

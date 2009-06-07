//
//  WidgetComponent_SingleRSS.m
//  TodayScreen
//
//  Created by Mac Pro on 5/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WidgetComponent_SingleRSS.h"


@implementation WidgetComponent_SingleRSS

@synthesize url;

@synthesize titleLabel;
@synthesize dateLabel;
@synthesize timeLabel;
@synthesize datetimeLabel;
@synthesize button;

- (void)launchURL:(id)sender {
	//NSLog(@"CLICKED");
	//UIButton *b = (UIButton*)sender;
	NSURL *nsurl = [NSURL URLWithString:[self url]];
	[[UIApplication sharedApplication] openURL:nsurl];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}


@end

//
//  WidgetSettingsSuperClass.m
//  TodayScreen
//
//  Created by Mac Pro on 5/30/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WidgetSettingsSuperClass.h"


@implementation WidgetSettingsSuperClass

@synthesize mainContentScrollView;
@synthesize mainContentView;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	UINavigationBar *b = [[UINavigationBar alloc] init];
	[self.view addSubview:b];
	
	UIButton *aa = [[UIButton alloc] init];
	[self.parentViewController.view addSubview:aa];
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"settingsbg.png"]];
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}


@end

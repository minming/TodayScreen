//
//  AboutTodayScreen.m
//  TodayScreen
//
//  Created by Mac Pro on 5/31/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AboutTodayScreen.h"


@implementation AboutTodayScreen

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"settingsbg.png"]];
}

-(void)okButtonClick:(id)sender {
	[self dismissModalViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}


@end

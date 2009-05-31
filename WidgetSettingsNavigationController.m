//
//  WidgetSettingsNavigationController.m
//  TodayScreen
//
//  Created by Mac Pro on 5/30/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WidgetSettingsNavigationController.h"


@implementation WidgetSettingsNavigationController

- (void)viewDidLoad {
	self.navigationBar.barStyle = UIBarStyleBlackOpaque;
	
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"settingsbg.png"]];
	/*
	UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] 
									 initWithTitle:@"Update Status" 
									 style:UIBarButtonItemStyleBordered 
									 target:self 
									 action:@selector(showStatusComposeView)];
	 */
	//UINavigationItem *navItem = [[UINavigationItem alloc] init];
	//UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] init];
	//saveButton.title = @"Save";
	//navItem.rightBarButtonItem = saveButton;
	//[self.navigationBar pushNavigationItem:navItem animated:YES];
	
	//self.navigationItem.rightBarButtonItem = saveButton;
	//[saveButton release];		
}

@end

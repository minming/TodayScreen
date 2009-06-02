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
}

@end

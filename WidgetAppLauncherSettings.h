//
//  WidgetAppLauncherSettings.h
//  TodayScreen
//
//  Created by Shravan Reddy on 6/2/09.
//  Copyright 2009 Stanford University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WidgetSettingsSuperClass.h"
#import "WidgetAppLauncher.h"

@interface WidgetAppLauncherSettings : WidgetSettingsSuperClass {
	IBOutlet UITextField* urlField;
	IBOutlet UITextField* nameField;
	
	WidgetAppLauncher* appLauncherWidget;
}

- (id)initWithWidget:(WidgetAppLauncher*)widget;

@end

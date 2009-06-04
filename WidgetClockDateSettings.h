//
//  WidgetClockDateSettings.h
//  TodayScreen
//
//  Created by Mac Pro on 5/30/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WidgetSettingsSuperClass.h"
#import "WidgetClockDate.h"
#import "UserDefaults.h"

@interface WidgetClockDateSettings : WidgetSettingsSuperClass {
	IBOutlet UITextField* timeFormatTextField;
	WidgetClockDate* clockDateWidget;
}

- (id)initWithWidget:(WidgetClockDate*)widget;

@end

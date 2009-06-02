//
//  WidgetWeatherSettings.h
//  TodayScreen
//
//  Created by Mac Pro on 5/30/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WidgetSettingsSuperClass.h"
#import "WidgetWeather.h"

@interface WidgetWeatherSettings : UIViewController {
	IBOutlet UITextField* zipCodeField;
	WidgetWeather* weatherWidget;
}

- (id)initWithWidget:(WidgetWeather*)widget;

@end

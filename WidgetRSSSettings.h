//
//  WidgetRSSSettings.h
//  TodayScreen
//
//  Created by Mac Pro on 5/30/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WidgetSettingsSuperClass.h"
#import "WidgetRSS.h"

@interface WidgetRSSSettings : WidgetSettingsSuperClass {
	IBOutlet UITextField* rssField;
	IBOutlet UITextField* numFeedsField;
	
	WidgetRSS* rssWidget;
}

- (id)initWithWidget:(WidgetRSS*)widget;

@end

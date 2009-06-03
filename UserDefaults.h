//
//  UserDefaults.h
//  TodayScreen
//
//  Created by Shravan Reddy on 5/25/09.
//  Copyright 2009 Stanford University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WidgetContact.h"
#import "WidgetClockDate.h"
#import "WidgetWeather.h"
#import "WidgetRSS.h"
#import "WidgetAppLauncher.h"
#import "WidgetFlipClockDate.h"

@interface UserDefaults : NSObject {
	NSUserDefaults *userDefaults;
}

-(NSMutableArray*)getWidgetsArrayFromPrefs;
-(void)loadWeatherWidgetFromPrefs:(NSString*)widgetName widget:(WidgetWeather*)weatherWidget;
-(void)loadClockWidgetFromPrefs:(NSString*)widgetName widget:(WidgetClockDate*)clockWidget;
-(void)loadRSSWidgetFromPrefs:(NSString*)widgetName widget:(WidgetRSS*)rssWidget;
-(void)loadAppLauncherWidgetFromPrefs:(NSString*)widgetName widget:(WidgetAppLauncher*)appLauncherWidget;
-(void)loadContactWidgetFromPrefs:(NSString*)widgetName widget:(WidgetContact*)contactWidget;

-(void)writeWidgetArrayPrefs:(NSArray*)widgetsArray;
-(void)writeWeatherWidgetPrefs:(NSString*)widgetName zipCode:(NSString*)zipCode;
-(void)writeClockWidgetPrefs:(NSString*)widgetName timeFormat:(NSString*)timeFormat dateFormat:(NSString*)dateFormat;
//-(void)writeRSSWidgetPrefs:(NSString*)widgetName rssArray:(NSArray*)rssArray numFeeds:(NSInteger)numFeeds;
-(void)writeRSSWidgetPrefs:(NSString*)widgetName rssFeed:(NSString*)rssFeed numFeeds:(NSInteger)numFeeds;
-(void)writeAppLauncherWidgetPrefs:(NSString*)widgetName appArray:(NSArray*)appShortcuts appNumRows:(NSInteger)appNumRows;
-(void)writeContactWidgetPrefs:(NSString*)widgetName contacts:(NSArray*)contacts;

@end

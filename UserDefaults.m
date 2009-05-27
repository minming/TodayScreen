//
//  UserDefaults.m
//  TodayScreen
//
//  Created by Shravan Reddy on 5/25/09.
//  Copyright 2009 Stanford University. All rights reserved.
//

#import "UserDefaults.h"


@implementation UserDefaults

#define WIDGET_WEATHER_ZIP_CODE_CONSTANT @"zipCode"

#define WIDGET_CLOCK_TIME_FORMAT_CONSTANT @"timeFormat"
#define WIDGET_CLOCK_DATE_FORMAT_CONSTANT @"dateFormat"

#define WIDGET_RSS_ARRAY_CONSTANT @"rssArray"
#define WIDGET_RSS_NUM_FEEDS_CONSTANT @"rssNumFeeds"

#define WIDGET_APPLAUNCHER_ARRAY_CONSTANT @"appArray"
#define WIDGET_APPLAUNCHER_NUM_ROWS_CONSTANT @"appNumRows"

#define WIDGET_CONTACTS_ARRAY_CONSTANT @ "contactsArray"

/*
 (position---app) matches
 (bgimage)
 (style)
 ---------------------------------------------------------
 weather - zipcode
 timedate - time format, date format
 rss - rss url, # of feeds
 applauncher- (arrary:name,url,image), # of rows
 contact - (array:name, mode), # of rows
 */

/*-(void)loadUserPrefs { 
 [NSUserDefaults resetStandardUserDefaults];
 userDefaults = [NSUserDefaults standardUserDefaults];
 NSInteger numSides = [userDefaults integerForKey:@"numberOfSides"];
 [self initWithNumberOfSides:numSides minimumNumberOfSides:3 maximumNumberOfSides:10];
 self.drawDashed = [userDefaults boolForKey:@"drawDashed"];
 }
 
 -(void)saveUserPrefs {
 userDefaults = [NSUserDefaults standardUserDefaults];
 [userDefaults setInteger:[self numberOfSides] forKey:@"numberOfSides"];
 [userDefaults setBool:drawDashed forKey: @"drawDashed"];
 
 [userDefaults synchronize];
 }*/

/*
 * Methods to load user preferences
 */
-(void)loadWeatherWidgetFromPrefs:(NSString*)widgetName widget:(WidgetWeather*)weatherWidget {
	[NSUserDefaults resetStandardUserDefaults];
	userDefaults = [NSUserDefaults standardUserDefaults];
	NSString* zipCode = [userDefaults objectForKey:[widgetName stringByAppendingString: WIDGET_WEATHER_ZIP_CODE_CONSTANT]];
	
	[weatherWidget setZipCode:zipCode];
}

-(void)loadClockWidgetFromPrefs:(NSString*)widgetName widget:(WidgetClockDate*)clockWidget {
	[NSUserDefaults resetStandardUserDefaults];
	userDefaults = [NSUserDefaults standardUserDefaults];
	NSString* timeFormat = [userDefaults objectForKey:[widgetName stringByAppendingString: WIDGET_CLOCK_TIME_FORMAT_CONSTANT]];
	NSString* dateFormat = [userDefaults objectForKey:[widgetName stringByAppendingString: WIDGET_CLOCK_DATE_FORMAT_CONSTANT]];
	
	[clockWidget setTimeFormat:timeFormat];
	[clockWidget setDateFormat:dateFormat];
}

-(void)loadRSSWidgetFromPrefs:(NSString*)widgetName widget:(WidgetRSS*)rssWidget {
	[NSUserDefaults resetStandardUserDefaults];
	userDefaults = [NSUserDefaults standardUserDefaults];
	NSMutableArray* rssArray = [userDefaults objectForKey:[widgetName stringByAppendingString:WIDGET_RSS_ARRAY_CONSTANT]];
	NSInteger numFeeds = [userDefaults integerForKey:[widgetName stringByAppendingString:WIDGET_RSS_NUM_FEEDS_CONSTANT]];
	
	[rssWidget setSingleRSSArray:rssArray];
	[rssWidget setNUM_OF_FEEDS:numFeeds];
}

-(void)loadAppLauncherWidgetFromPrefs:(NSString*)widgetName widget:(WidgetAppLauncher*)appLauncherWidget {
	[NSUserDefaults resetStandardUserDefaults];
	userDefaults = [NSUserDefaults standardUserDefaults];
	NSMutableArray* appLauncherArray = [userDefaults objectForKey:[widgetName stringByAppendingString:WIDGET_APPLAUNCHER_ARRAY_CONSTANT]];
	NSInteger numRows = [userDefaults integerForKey:[widgetName stringByAppendingString:WIDGET_APPLAUNCHER_NUM_ROWS_CONSTANT]];
	
	[appLauncherWidget setAppShortcuts:appLauncherArray];
	[appLauncherWidget setNumRows:numRows];
}

-(void)loadContactWidgetPref:(NSString*)widgetName widget:(WidgetContact*)contactWidget {
	[NSUserDefaults resetStandardUserDefaults];
	userDefaults = [NSUserDefaults standardUserDefaults];
	NSMutableArray* contactsArray = [userDefaults objectForKey:[widgetName stringByAppendingString:WIDGET_CONTACTS_ARRAY_CONSTANT]];
	
	[contactWidget setContactsArray:contactsArray];
}

/*
 * Begin writing user prefs
 */

-(void)writeWeatherWidgetPrefs:(NSString*)widgetName zipCode:(NSString*)zipCode {
	userDefaults = [NSUserDefaults standardUserDefaults];
	[userDefaults setObject:zipCode forKey:[widgetName stringByAppendingString: WIDGET_WEATHER_ZIP_CODE_CONSTANT]];
	[userDefaults synchronize];
}

-(void)writeClockWidgetPrefs:(NSString*)widgetName timeFormat:(NSString*)timeFormat dateFormat:(NSString*)dateFormat {
	userDefaults = [NSUserDefaults standardUserDefaults];
	[userDefaults setObject:timeFormat forKey:[widgetName stringByAppendingString: WIDGET_CLOCK_TIME_FORMAT_CONSTANT]];
	[userDefaults setObject:dateFormat forKey:[widgetName stringByAppendingString: WIDGET_CLOCK_DATE_FORMAT_CONSTANT]];
	[userDefaults synchronize];
}

-(void)writeRSSWidgetPrefs:(NSString*)widgetName rssArray:(NSArray*)rssArray numFeeds:(NSInteger)numFeeds  {
	userDefaults = [NSUserDefaults standardUserDefaults];
	[userDefaults setObject:rssArray forKey:[widgetName stringByAppendingString: WIDGET_RSS_ARRAY_CONSTANT]];
	[userDefaults setInteger:numFeeds forKey:[widgetName stringByAppendingString: WIDGET_RSS_NUM_FEEDS_CONSTANT]];
	[userDefaults synchronize];
}

-(void)writeAppLauncherWidgetPrefs:(NSString*)widgetName appArray:(NSArray*)appArray appNumRows:(NSInteger)appNumRows{
	userDefaults = [NSUserDefaults standardUserDefaults];
	[userDefaults setObject:appArray forKey:[widgetName stringByAppendingString: WIDGET_APPLAUNCHER_ARRAY_CONSTANT]];
	[userDefaults setInteger:appNumRows forKey:[widgetName stringByAppendingString: WIDGET_APPLAUNCHER_NUM_ROWS_CONSTANT]];
	[userDefaults synchronize];
}

-(void)writeContactWidgetPrefs:(NSString*)widgetName contacts:(NSArray*)contacts{
	userDefaults = [NSUserDefaults standardUserDefaults];
	[userDefaults setObject:contacts forKey:[widgetName stringByAppendingString: WIDGET_CONTACTS_ARRAY_CONSTANT]];
	[userDefaults synchronize];
}

- (void) dealloc {
	[userDefaults release];
	[super dealloc];
}
@end

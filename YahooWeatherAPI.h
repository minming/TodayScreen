//
//  YahooWeatherAPI.h
//  TodayScreen
//
//  Created by Mac Pro on 5/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

typedef struct Weather {
	NSString *text;
	NSString *temp;
	NSString *high;
	NSString *low;
	NSString *day;
	NSString *date;
	NSString *code;
	NSString *bigImage;
	NSString *smallImage;
	
	NSString *sunrise;
	NSString *sunset;
	NSString *humidity;
	NSString *visibility;
	NSString *pressure;
	NSString *windChill;
	NSString *windDirection;
	NSString *windSpeed;
	
	NSString *city;
	NSString *region;
	NSString *country;
} Weather;

@interface YahooWeatherAPI : NSObject {
	NSXMLParser * rssParser;	
	NSMutableArray * stories;
	
	NSMutableDictionary * item;
	NSString * currentElement;
	NSMutableString * currentTitle, * currentDate, * currentSummary, * currentLink;

	Weather weatherReports[3];
	
}

- (Weather)getWeather:(int)i;
- (NSString*)getWeatherXmlForZipCode:(NSString*)zipCode;
- (void)getWeatherNSXMLForZipCode:(NSString*)zipCode;
- (NSString*)getWeatherIcon:(NSString*)code type:(int)type;

@end

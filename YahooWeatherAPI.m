//
//  YahooWeatherAPI.m
//  TodayScreen
//
//  Created by Mac Pro on 5/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "YahooWeatherAPI.h"


@implementation YahooWeatherAPI

- (NSString*)getWeatherXmlForZipCode: (NSString*)zipCode {
	weatherReports[1].day = nil;
	
	NSError *error;
	NSURLResponse *response;
	NSData *dataReply;
	NSString *stringReply;
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: [NSURL URLWithString: [NSString stringWithFormat:@"http://weather.yahooapis.com/forecastrss?p=%@", zipCode]]];
	[request setHTTPMethod: @"GET"];
	dataReply = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
	stringReply = [[NSString alloc] initWithData:dataReply encoding:NSUTF8StringEncoding];
	//NSLog(stringReply);
	return stringReply;
}

- (void)getWeatherNSXMLForZipCode:(NSString*)zipCode {
	/*NSError *error;
	NSURLResponse *response;
	NSData *dataReply;
	NSString *stringReply;*/
	
	// ** IMPORTANT Reset weather reports **  
	weatherReports[1].day = nil;
	
	NSURL *xmlURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://weather.yahooapis.com/forecastrss?p=%@", zipCode]];
	NSXMLParser *weatherXML = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];

    // Set self as the delegate of the parser so that it will receive the parser delegate methods callbacks.
    [weatherXML setDelegate:self];
	
    // Depending on the XML document you're parsing, you may want to enable these features of NSXMLParser.
    [weatherXML setShouldProcessNamespaces:NO];
    [weatherXML setShouldReportNamespacePrefixes:NO];
    [weatherXML setShouldResolveExternalEntities:NO];	
	
	[weatherXML parse];
	
	//return weatherReports;
	
	//return weatherXML;
	
	/*
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: [NSURL URLWithString: [NSString stringWithFormat:@"http://weather.yahooapis.com/forecastrss?p=%@", zipCode]]];
	[request setHTTPMethod: @"GET"];
	dataReply = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
	stringReply = [[NSString alloc] initWithData:dataReply encoding:NSUTF8StringEncoding];
	NSLog(stringReply);
	return stringReply;
	 */
}
- (Weather)getWeather:(int)i {
	return weatherReports[i];
}


- (void)parseXMLFileAtURL:(NSString *)URL
{	
	stories = [[NSMutableArray alloc] init];
	
    //you must then convert the path to a proper NSURL or it won't work
    NSURL *xmlURL = [NSURL URLWithString:URL];
	
    // here, for some reason you have to use NSClassFromString when trying to alloc NSXMLParser, otherwise you will get an object not found error
    // this may be necessary only for the toolchain
    rssParser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
	
    // Set self as the delegate of the parser so that it will receive the parser delegate methods callbacks.
    [rssParser setDelegate:self];
	
    // Depending on the XML document you're parsing, you may want to enable these features of NSXMLParser.
    [rssParser setShouldProcessNamespaces:NO];
    [rssParser setShouldReportNamespacePrefixes:NO];
    [rssParser setShouldResolveExternalEntities:NO];
	
    [rssParser parse];
	
}


- (void)parserDidStartDocument:(NSXMLParser *)parser{	
	//NSLog(@"found weather file and started parsing");
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
	NSString * errorString = [NSString stringWithFormat:@"Unable to download story feed from web site (Error code %i )", [parseError code]];
	//NSLog(@"error parsing weather XML: %@", errorString);
	
	UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Error loading content" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[errorAlert show];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{			
   /*
	currentElement = [elementName copy];
	if ([elementName isEqualToString:@"item"]) {
		// clear out our story item caches...
		item = [[NSMutableDictionary alloc] init];
		currentTitle = [[NSMutableString alloc] init];
		currentDate = [[NSMutableString alloc] init];
		currentSummary = [[NSMutableString alloc] init];
		currentLink = [[NSMutableString alloc] init];
	}*/
	currentElement = [elementName copy];
	if ([elementName isEqualToString:@"yweather:location"]) {
		weatherReports[0].city = [attributeDict objectForKey:@"city"];
		weatherReports[0].region = [attributeDict objectForKey:@"region"];
		weatherReports[0].country = [attributeDict objectForKey:@"country"];
	}
	if ([elementName isEqualToString:@"yweather:wind"]) {
		weatherReports[0].windChill= [attributeDict objectForKey:@"chill"];
		weatherReports[0].windDirection = [attributeDict objectForKey:@"direction"];
		weatherReports[0].windSpeed = [attributeDict objectForKey:@"speed"];
	}
	if ([elementName isEqualToString:@"yweather:atmosphere"]) {
		weatherReports[0].humidity = [attributeDict objectForKey:@"humidity"];
		weatherReports[0].visibility = [attributeDict objectForKey:@"visibility"];
		weatherReports[0].pressure = [attributeDict objectForKey:@"pressure"];
	}
	if ([elementName isEqualToString:@"yweather:astronomy"]) {
		weatherReports[0].sunrise = [attributeDict objectForKey:@"sunrise"];
		weatherReports[0].sunset = [attributeDict objectForKey:@"sunset"];
	}
		
	if ([elementName isEqualToString:@"yweather:condition"]) {
		//NSLog(@"found this weather element: %@ - %@", elementName, [attributeDict objectForKey:@"text"]);
		if ([attributeDict objectForKey:@"text"] != nil && [attributeDict objectForKey:@"text"] != @"") {
			weatherReports[0].day = @"Now";
			weatherReports[0].text = [attributeDict objectForKey:@"text"];
			weatherReports[0].temp = [attributeDict objectForKey:@"temp"];
			weatherReports[0].date = [attributeDict objectForKey:@"date"];
			weatherReports[0].code = [attributeDict objectForKey:@"code"];
			weatherReports[0].bigImage = [self getWeatherIcon:[attributeDict objectForKey:@"code"] type:1];
			weatherReports[0].smallImage = [self getWeatherIcon:[attributeDict objectForKey:@"code"] type:2];
		}
	}
	if ([elementName isEqualToString:@"yweather:forecast"]) {
		//NSLog(@"found this weather element: %@ - %@", elementName, [attributeDict objectForKey:@"text"]);
		if ([attributeDict objectForKey:@"text"] != nil && [attributeDict objectForKey:@"text"] != @"") {
			int i = 1;
			if (weatherReports[1].day != nil && weatherReports[1].day != @"") {
				i = 2;
			}
			NSLog(@"Weather report for %d is %@", i, attributeDict);
			weatherReports[i].day = [attributeDict objectForKey:@"day"];
			weatherReports[i].text = [attributeDict objectForKey:@"text"];
			weatherReports[i].high = [attributeDict objectForKey:@"high"];
			weatherReports[i].low = [attributeDict objectForKey:@"low"];
			weatherReports[i].date = [attributeDict objectForKey:@"date"];
			weatherReports[i].code = [attributeDict objectForKey:@"code"];
			weatherReports[i].bigImage = [self getWeatherIcon:[attributeDict objectForKey:@"code"] type:1];
			weatherReports[i].smallImage = [self getWeatherIcon:[attributeDict objectForKey:@"code"] type:2];
		}
	}
	
}


/*
 
 Code  	Description
 0 	tornado
 1 	tropical storm
 2 	hurricane
 3 	severe thunderstorms
 4 	thunderstorms
 5 	mixed rain and snow
 6 	mixed rain and sleet
 7 	mixed snow and sleet
 8 	freezing drizzle
 9 	drizzle
 10 	freezing rain
 11 	showers
 12 	showers
 13 	snow flurries
 14 	light snow showers
 15 	blowing snow
 16 	snow
 17 	hail
 18 	sleet
 19 	dust
 20 	foggy
 21 	haze
 22 	smoky
 23 	blustery
 24 	windy
 25 	cold
 26 	cloudy
 27 	mostly cloudy (night)
 28 	mostly cloudy (day)
 29 	partly cloudy (night)
 30 	partly cloudy (day)
 31 	clear (night)
 32 	sunny
 33 	fair (night)
 34 	fair (day)
 35 	mixed rain and hail
 36 	hot
 37 	isolated thunderstorms
 38 	scattered thunderstorms
 39 	scattered thunderstorms
 40 	scattered showers
 41 	heavy snow
 42 	scattered snow showers
 43 	heavy snow
 44 	partly cloudy
 45 	thundershowers
 46 	snow showers
 47 	isolated thundershowers
 3200 	not available
 
 http://l.yimg.com/a/i/us/we/52/3.gif //cartoon
 http://l.yimg.com/a/i/us/nws/weather/gr/7d.png //big
 http://l.yimg.com/a/i/us/nws/weather/gr/3200s.png //small
 
 */


- (NSString*)getWeatherIcon:(NSString*)code type:(int)type {
	if (code == @"" || code == nil) {
		return @"http://l.yimg.com/a/i/us/nws/weather/gr/3200s.png";
	}
	if (type == 1) {
		return [NSString stringWithFormat:@"http://l.yimg.com/a/i/us/nws/weather/gr/%@d.png",code];
	} 
	if (type == 2) {
		return [NSString stringWithFormat:@"http://l.yimg.com/a/i/us/nws/weather/gr/%@s.png",code];
	} 
	return [NSString stringWithFormat:@"http://l.yimg.com/a/i/us/nws/weather/gr/%@d.png",code];
}


/*
- (void)parser:(NSXMLParser *)parser foundAttributeDeclarationWithName:(NSString *)attributeName 
    forElement:(NSString *)elementName type:(NSString *)type defaultValue:(NSString *)defaultValue */
- (void)parser:(NSXMLParser *)parser foundAttributeDeclarationWithName:(NSString *)attributeName forElement:(NSString *)elementName type:(NSString *)type defaultValue:(NSString *)defaultValue
{
    //NSLog(@"Found weather attribute: %@ (%@) [%@] {%@}", attributeName, elementName, type, defaultValue);
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{     
	//NSLog(@"ended weather element: %@", elementName);
	/*
	if ([elementName isEqualToString:@"item"]) {
		// save values to an item, then store that item into the array...
		[item setObject:currentTitle forKey:@"title"];
		[item setObject:currentLink forKey:@"link"];
		[item setObject:currentSummary forKey:@"summary"];
		[item setObject:currentDate forKey:@"date"];
		
		[stories addObject:[item copy]];
		NSLog(@"adding story: %@", currentTitle);
	}
	 */
	
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
	//NSLog(@"found weather characters: %@", string);
	// save the characters for the current item...
	/*
	if ([currentElement isEqualToString:@"title"]) {
		[currentTitle appendString:string];
	} else if ([currentElement isEqualToString:@"link"]) {
		[currentLink appendString:string];
	} else if ([currentElement isEqualToString:@"description"]) {
		[currentSummary appendString:string];
	} else if ([currentElement isEqualToString:@"pubDate"]) {
		[currentDate appendString:string];
	}
	*/
	
	
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
	
	//[activityIndicator stopAnimating];
	//[activityIndicator removeFromSuperview];
	
	//NSLog(@"all weather done!");
	//NSLog(@"weather array has %d items", [stories count]);
	//[self showRSS];
	//[newsTable reloadData];
}




@end

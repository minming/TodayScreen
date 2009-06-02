//
//  WidgetWeather.m
//  TodayScreen
//
//  Created by Mac Pro on 5/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WidgetWeather.h"
#import "YahooWeatherAPI.h"
#import "GlobalFunctions.h"
#import "WidgetSettingsNavigationController.h"
#include "WidgetWeatherSettings.h"

@interface WidgetWeather (Internal)
- (void)getWeatherForZipCode:(NSString*)zip;
- (void)synchronousLoadYahooWeatherData;
- (void)didFinishLoadingYahooWeatherData;
@end

@implementation WidgetWeather

@synthesize zipCode;

-(id) initWithSuperTableController:(UITableViewController*)superViewController  zipCode:(NSString*)zip {
	if (self = [super init]) {
		tableViewController = superViewController;
		[tableViewController retain];
		
		weatherAPI = [[YahooWeatherAPI alloc] init];
		operationQueue = [[NSOperationQueue alloc] init];
        [operationQueue setMaxConcurrentOperationCount:1];
		
		[self setZipCode:zip];
    }
    return self;
}

- (int)getHeight {
	return 90;
}

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	NSLog(@"Zip code: %@", zipCode);
	[self getWeatherForZipCode:zipCode];
}

- (void)getWeatherForZipCode:(NSString*)zip {	
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(synchronousLoadYahooWeatherData:) object:zip];
    [operationQueue addOperation:operation];
    [operation release];
}

- (void)synchronousLoadYahooWeatherData:(NSString*)zip {
	[weatherAPI getWeatherNSXMLForZipCode:zipCode];
	self.view.backgroundColor = [UIColor clearColor];
	
	Weather now = [weatherAPI getWeather:0];
	Weather forecast1 = [weatherAPI getWeather:1];
	Weather forecast2 = [weatherAPI getWeather:2];
	
	NSLog(@"Weather api %@", now.text);
	nowTextLabel.text = now.text;
	nowTempLabel.text = [NSString stringWithFormat:@"%@˚",now.temp];
	nowFeelsLikeLabel.text = [NSString stringWithFormat:@"%@˚",now.windChill];
	
	nowImage.image = [GlobalFunctions getImageFromUrl:now.bigImage];
	nowWindLabel.text = [NSString stringWithFormat:@"%@ mph",now.windSpeed];
	nowSunriseLabel.text = now.sunrise;
	nowSunsetLabel.text = now.sunset;
	
	forecast1TextLabel.text = forecast1.text;
	forecast1DayLabel.text = forecast1.day;
	forecast1TempLabel.text = [NSString stringWithFormat:@"%@˚ - %@˚",forecast1.low,forecast1.high];
	forecast1Image.image = [GlobalFunctions getImageFromUrl:forecast1.smallImage];
	
	
	forecast2TextLabel.text = forecast2.text;
	forecast2DayLabel.text = forecast2.day;
	forecast2TempLabel.text = [NSString stringWithFormat:@"%@˚ - %@˚",forecast2.low,forecast2.high];
	forecast2Image.image = [GlobalFunctions getImageFromUrl:forecast2.smallImage];
	
	//[self.view reloadData];
}

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)editSettingsAction:(id)sender {
	NSLog(@"SETTINGS");
	WidgetSettingsNavigationController *navController = [[WidgetSettingsNavigationController alloc] init];
	navController.navigationBar.barStyle = UIBarStyleBlackOpaque;
	WidgetWeatherSettings *widgetWeatherSettings = [[WidgetWeatherSettings alloc] initWithWidget:self];
	[navController pushViewController:widgetWeatherSettings animated:YES];
	[tableViewController presentModalViewController:navController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[weatherAPI release];
	[operationQueue release];
    [super dealloc];
}


@end

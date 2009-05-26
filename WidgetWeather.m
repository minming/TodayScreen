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

@implementation WidgetWeather


// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		//weatherReports[0].
    }
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor clearColor];
	YahooWeatherAPI *weatherAPI = [[YahooWeatherAPI alloc] init];
	[weatherAPI getWeatherNSXMLForZipCode:@"94305"];
	Weather now = [weatherAPI getWeather:0];
	Weather forecast1 = [weatherAPI getWeather:1];
	Weather forecast2 = [weatherAPI getWeather:2];
	
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
	
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}


@end

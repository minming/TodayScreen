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

@interface WidgetWeather (Internal)
- (void)getWeatherForZipCode:(NSString*)zip;
- (void)synchronousLoadYahooWeatherData;
- (void)didFinishLoadingYahooWeatherData;
@end

@implementation WidgetWeather

@synthesize zipCode;

// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		/*weatherAPI = [[YahooWeatherAPI alloc] init];
		 [self setZipCode:zip];
		 
		 operationQueue = [[NSOperationQueue alloc] init];
		 [operationQueue setMaxConcurrentOperationCount:1];*/
    }
    return self;
}

-(id) initWithZipCode:(NSString*)zip {
	if (self = [super init]) {
		weatherAPI = [[YahooWeatherAPI alloc] init];
		
		[self setZipCode:zip];
		
        operationQueue = [[NSOperationQueue alloc] init];
        [operationQueue setMaxConcurrentOperationCount:1];
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
	
	[weatherAPI release];
	weatherAPI = [[YahooWeatherAPI alloc] init];
	self.view.backgroundColor = [UIColor clearColor];
	
	NSLog(@"Zip code: %@", zipCode);
	[self getWeatherForZipCode:zipCode];
}

- (void)getWeatherForZipCode:(NSString*)zip {	
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(synchronousLoadYahooWeatherData:) object:zip];
    [operationQueue addOperation:operation];
    [operation release];
}

- (void)synchronousLoadYahooWeatherData:(NSString*)zip {
	[weatherAPI getWeatherNSXMLForZipCode:zip];
	[self performSelectorOnMainThread:@selector(didFinishLoadingYahooWeatherData) withObject:nil waitUntilDone:NO];
}

-(void)didFinishLoadingYahooWeatherData {
	Weather now = [weatherAPI getWeather:0];
	Weather forecast1 = [weatherAPI getWeather:1];
	Weather forecast2 = [weatherAPI getWeather:2];
	
	//NSLog(@"Weather api %@", now);
	/*nowTextLabel.text = now.text;
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
	forecast2Image.image = [GlobalFunctions getImageFromUrl:forecast2.smallImage];*/
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
	[operationQueue release];
    [super dealloc];
}


@end

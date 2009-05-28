//
//  WidgetWeather.h
//  TodayScreen
//
//  Created by Mac Pro on 5/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YahooWeatherAPI.h"


@interface WidgetWeather : UIViewController {
	
	IBOutlet UILabel *nowTextLabel;
	IBOutlet UILabel *nowTempLabel;
	IBOutlet UIImageView *nowImage;
	IBOutlet UILabel *nowFeelsLikeLabel;
	
	IBOutlet UILabel *nowWindLabel;
	IBOutlet UILabel *nowSunriseLabel;
	IBOutlet UILabel *nowSunsetLabel;
	
	IBOutlet UILabel *forecast1DayLabel;
	IBOutlet UILabel *forecast1TextLabel;
	IBOutlet UILabel *forecast1TempLabel;
	IBOutlet UIImageView *forecast1Image;
	
	IBOutlet UILabel *forecast2DayLabel;
	IBOutlet UILabel *forecast2TextLabel;
	IBOutlet UILabel *forecast2TempLabel;
	IBOutlet UIImageView *forecast2Image;
	
	NSOperationQueue *operationQueue;
	
	NSString* zipCode;
	
	YahooWeatherAPI *weatherAPI;
}

- (id)initWithZipCode:(NSString*)zip;

@property (copy) NSString* zipCode;

@end

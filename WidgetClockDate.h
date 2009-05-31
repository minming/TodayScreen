//
//  WidgetClockDate.h
//  TodayScreen
//
//  Created by Mac Pro on 5/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WidgetViewControllerSuperClass.h"

@interface WidgetClockDate : WidgetViewControllerSuperClass {
	IBOutlet UILabel *timeLabel;	
	IBOutlet UILabel *dateLabel;	
    NSTimer *myTicker;  
	
	NSString *dateFormat;
	NSString *timeFormat;
	
	NSInteger rowHeight;
}

@property (copy) NSString* dateFormat;
@property (copy) NSString* timeFormat;
 
- (void)runTimer;  
- (void)showActivity; 

- (void)tempButtonAction:(id)sender;

@end

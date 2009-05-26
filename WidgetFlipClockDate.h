//
//  WidgetFlipClockDate.h
//  TodayScreen
//
//  Created by Mac Pro on 5/25/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WidgetFlipClockDate : UIViewController {
	IBOutlet UILabel *hour;
	IBOutlet UILabel *min;
	IBOutlet UILabel *ampm;
	IBOutlet UILabel *date;
    NSTimer *myTicker;  
}


- (void)runTimer;  
- (void)showActivity; 
@end

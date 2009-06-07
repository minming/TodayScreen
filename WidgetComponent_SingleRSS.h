//
//  WidgetComponent_SingleRSS.h
//  TodayScreen
//
//  Created by Mac Pro on 5/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WidgetComponent_SingleRSS : UIViewController {
	IBOutlet UILabel *titleLabel;
	IBOutlet UILabel *dateLabel;
	IBOutlet UILabel *timeLabel;
	IBOutlet UILabel *datetimeLabel;
	IBOutlet UIButton *button;
	NSString *url;
}

@property (copy) NSString *url;

@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UILabel *dateLabel;
@property (nonatomic, retain) IBOutlet UILabel *timeLabel;
@property (nonatomic, retain) IBOutlet UILabel *datetimeLabel;
@property (nonatomic, retain) IBOutlet UIButton *button;


- (void)launchURL:(id)sender;

@end

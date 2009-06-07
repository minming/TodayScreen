//
//  TodayScreenTableViewController.h
//  TodayScreen
//
//  Created by Mac Pro on 5/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddNewWidgetViewController.h"
#import "UserDefaults.h"

@interface TodayScreenTableViewController : UITableViewController {
	NSMutableArray *widgetsArray;
	
	bool settingsMode;
	
	UserDefaults* userDefaults;
	
	//UIImageView *bgImageView;
}

@property (nonatomic, copy) NSMutableArray *widgetsArray;
@property (nonatomic) bool settingsMode;

//@property (nonatomic, copy) UIImageView *bgImageView;

-(void) addNewWidget:(NSInteger)widgetType;
-(void)saveUserPrefs;

@end

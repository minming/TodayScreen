//
//  WidgetViewControllerSuperClass.h
//  TodayScreen
//
//  Created by Mac Pro on 5/30/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WidgetViewControllerSuperClass : UIViewController {
	//int widgetHeight;
	UITableViewController *tableViewController;	// Pointer to the table controller that this widget is contained in
}

@property (assign) UITableViewController* tableViewController;
//@property int widgetHeight;
- (void)startEditMode;
- (int)getHeight;

- (void)enableBackground:(BOOL)bg;

-(id) initWithSuperTableController:(UITableViewController*)superViewController;
- (void)editSettingsAction:(id)sender;
@end

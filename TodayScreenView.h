//
//  TodayScreenView.h
//  TodayScreen
//
//  Created by Mac Pro on 5/25/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodayScreenTableViewController.h"
#import "AddNewWidgetViewController.h"

@interface TodayScreenView : UIViewController<AddNewWidgetViewControllerDelegate>{
	TodayScreenTableViewController *todayScreenTableViewController;
	IBOutlet UIView* tableView;
}

- (void)AddNewWidgetViewController:(AddNewWidgetViewController *)controller widgetType:(NSInteger) widgetType;
- (void)showModalAddWindow:(id)sender;
- (void)cancelAddWidget;

-(IBAction) controlEditingTable:(id)sender;
- (void) startEditingTable:(id)sender;
- (void) stopEditingTable:(id)sender;
@end

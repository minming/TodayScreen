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

@property (assign) TodayScreenTableViewController* todayScreenTableViewController;

- (void)AddNewWidgetViewController:(AddNewWidgetViewController *)controller widgetType:(NSInteger) widgetType;
- (void)showModalAddWindow:(id)sender;
- (void)cancelAddWidget;

-(void)controlEditingTable:(id)sender;
- (void)startEditingTable:(id)sender;
- (void)stopEditingTable:(id)sender;

-(void)controlSettingsMode:(id)sender;
-(void)startSettingsMode:(id)sender;
-(void)stopSettingsMode:(id)sender;

- (void)showModalAboutView:(id)sender;
- (void)showModalGeneralSettingsView:(id)sender;

@end

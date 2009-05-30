//
//  WidgetAppLauncher.h
//  TodayScreen
//
//  Created by Mac Pro on 5/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WidgetComponent_LongButton.h"
#import "AppShortcut.h"

/*typedef struct AppShortcut {
	NSString *title;
	NSString *url;
	NSString *image;
} AppShortcut;*/

@interface WidgetAppLauncher : UIViewController {
	WidgetComponent_LongButton *longButton;
	NSMutableArray *longButtonArray;
	
	NSMutableArray *AppShortcuts;
	
	NSInteger numRows;
	//AppShortcut AppShortcuts[8];
	
}

@property (nonatomic, copy) NSMutableArray *longButtonArray;
@property (nonatomic, copy) NSMutableArray *AppShortcuts;
@property NSInteger numRows;

@end

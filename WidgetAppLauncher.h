//
//  WidgetAppLauncher.h
//  TodayScreen
//
//  Created by Mac Pro on 5/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WidgetComponent_LongButton.h"

typedef struct  {
	NSString *title;
	NSString *url;
	NSString *image;
} AppShortcut;

@interface WidgetAppLauncher : UIViewController {
	WidgetComponent_LongButton *longButton;
	NSMutableArray *longButtonArray;
	
	//NSMutableArray *AppShortcuts;
	AppShortcut AppShortcuts[8];
}

@property (nonatomic, copy) NSMutableArray *longButtonArray;

@end

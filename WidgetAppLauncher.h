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
#import "WidgetViewControllerSuperClass.h"
#import "CachedImages.h"

@interface WidgetAppLauncher : WidgetViewControllerSuperClass {
	WidgetComponent_LongButton *longButton;
	NSMutableArray *longButtonArray;
	
	NSMutableArray *AppShortcuts;
	
	NSInteger numRows;
	
	NSOperationQueue *operationQueue;    
    CachedImages *cachedImages;
}

@property (nonatomic, retain) NSMutableArray *longButtonArray;
@property (nonatomic, retain) NSMutableArray *AppShortcuts;
@property NSInteger numRows;

-(void)addURL:(NSString*)url name:(NSString*)name;

@end

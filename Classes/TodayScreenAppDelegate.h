//
//  TodayScreenAppDelegate.h
//  TodayScreen
//
//  Created by Mac Pro on 5/20/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodayScreenView.h"

@interface TodayScreenAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	TodayScreenView *todayScreenView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end


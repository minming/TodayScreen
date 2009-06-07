//
//  WidgetSettingsSuperClass.h
//  TodayScreen
//
//  Created by Mac Pro on 5/30/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WidgetSettingsSuperClass : UIViewController {
	UINavigationBar *navBar;
	IBOutlet UIScrollView *mainContentScrollView;
	IBOutlet UIView *mainContentView;
}

@property (nonatomic, retain) UIScrollView *mainContentScrollView;
@property (nonatomic, retain) UIView *mainContentView;

- (void)cancelAction:(id)sender;
- (void)saveAction:(id)sender;

@end

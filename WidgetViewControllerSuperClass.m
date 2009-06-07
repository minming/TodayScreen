//
//  WidgetViewControllerSuperClass.m
//  TodayScreen
//
//  Created by Mac Pro on 5/30/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WidgetViewControllerSuperClass.h"


@implementation WidgetViewControllerSuperClass

@synthesize tableViewController;

//@synthesize widgetHeight;

- (int)getHeight {
	return 100;
	//return widgetHeight;
}

-(id) initWithSuperTableController:(UITableViewController*)superViewController {
	if (self = [super init]) {
		tableViewController = superViewController;
		[tableViewController retain];
	}
    return self;
}

- (void)enableBackground:(BOOL)bg {
	if (bg == YES) {
		[self.view setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.2]];
	} else {
		[self.view setBackgroundColor:[UIColor clearColor]];
	}
}

- (void)startEditMode {
	//[self.view setBackgroundColor:[UIColor blackColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[tableViewController release];
    [super dealloc];
}

- (void)editSettingsAction:(id)sender{
}

-(void)imageCallbackFunction{
}

@end

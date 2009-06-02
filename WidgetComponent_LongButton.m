//
//  WidgetComponent_LongButton.m
//  TodayScreen
//
//  Created by Mac Pro on 5/21/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WidgetComponent_LongButton.h"


@implementation WidgetComponent_LongButton

@synthesize button;



// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		self.view.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}


@end

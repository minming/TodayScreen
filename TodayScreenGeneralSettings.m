//
//  TodayScreenGeneralSettings.m
//  TodayScreen
//
//  Created by Mac Pro on 5/31/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TodayScreenGeneralSettings.h"


@implementation TodayScreenGeneralSettings

-(void)test:(id)sender {
	UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
	[self presentModalViewController:imgPicker animated:YES];
}

-(void)cancel:(id)sender {
	[self dismissModalViewControllerAnimated:YES];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"settingsbg.png"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}


@end

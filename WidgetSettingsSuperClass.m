//
//  WidgetSettingsSuperClass.m
//  TodayScreen
//
//  Created by Mac Pro on 5/30/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WidgetSettingsSuperClass.h"


@implementation WidgetSettingsSuperClass

@synthesize mainContentScrollView;
@synthesize mainContentView;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	UINavigationBar *b = [[UINavigationBar alloc] init];
	[self.view addSubview:b];
	
	UIButton *aa = [[UIButton alloc] init];
	[self.parentViewController.view addSubview:aa];
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"settingsbg.png"]];
	
	UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveAction:)];
	UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelAction:)];	
	self.navigationItem.rightBarButtonItem = saveButton;	
	self.navigationItem.leftBarButtonItem = cancelButton;
	[saveButton release];
	[cancelButton release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)cancelAction:(id)sender
{
	[self dismissModalViewControllerAnimated:YES];
}

- (void)saveAction:(id)sender {
	[self dismissModalViewControllerAnimated:YES];
}

- (void)dealloc {
    [super dealloc];
}


@end

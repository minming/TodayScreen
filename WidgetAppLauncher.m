//
//  WidgetAppLauncher.m
//  TodayScreen
//
//  Created by Mac Pro on 5/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WidgetAppLauncher.h"
#import "GlobalFunctions.h"


@implementation WidgetAppLauncher

@synthesize longButtonArray;
@synthesize AppShortcuts;
@synthesize numRows;

// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		longButtonArray = [[NSMutableArray alloc] init];
		AppShortcuts = [[NSMutableArray alloc] init];
		
		AppShortcut* shortcut1 = [[AppShortcut alloc] initWithTitle:@"Google" url:@"http://www.google.com" image:@"http://www.google.com/favicon.ico"];
		AppShortcut* shortcut2 = [[AppShortcut alloc] initWithTitle:@"Yahoo" url:@"http://www.yahoo.com" image:@""];
		AppShortcut* shortcut3 = [[AppShortcut alloc] initWithTitle:@"Facebook" url:@"http://www.facebook.com" image:@""];
		AppShortcut* shortcut4 = [[AppShortcut alloc] initWithTitle:@"Twitter" url:@"http://www.twitter.com" image:@""];
		AppShortcut* shortcut5 = [[AppShortcut alloc] initWithTitle:@"eBay" url:@"http://www.ebay.com" image:@""];
		AppShortcut* shortcut6 = [[AppShortcut alloc] initWithTitle:@"Live" url:@"http://www.live.com" image:@""];
		AppShortcut* shortcut7 = [[AppShortcut alloc] initWithTitle:@"Reader" url:@"http://www.google.com/reader" image: @""];
		
		[AppShortcuts addObject:shortcut1];
		[AppShortcuts addObject:shortcut2];
		[AppShortcuts addObject:shortcut3];
		[AppShortcuts addObject:shortcut4];
		[AppShortcuts addObject:shortcut5];
		[AppShortcuts addObject:shortcut6];
		[AppShortcuts addObject:shortcut7];
		//[AppShortcuts addObject:as];
    }
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/




// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	self.view.backgroundColor = [UIColor clearColor];
	int rowFactor = 0;
	int heightFactor = 0;
	int buttonsPerRow = 4;
	for (int i=0; i<8; i++) {
		longButton = [[WidgetComponent_LongButton alloc] init];
		[self.view addSubview:longButton.view]; 
		longButton.view.frame = CGRectMake(rowFactor*75.0+10.0, heightFactor*30.0+10.0, 60.0, 40.0);
		longButton.button.tag = i;
		[longButton.button setTitle:[[AppShortcuts objectAtIndex:i] title] forState:UIControlStateNormal];
		if ([[AppShortcuts objectAtIndex:i] image] != nil) {
			[longButton.button setImage:[GlobalFunctions getImageFromUrl:[[AppShortcuts objectAtIndex:i] image] forState:UIControlStateNormal]];
		}
		//id path = @"http://merrimusings.mu.nu/archives/images/groundhog2.jpg";
		//NSURL *url = [NSURL URLWithString:path];
		//NSData *data = [NSData dataWithContentsOfURL:url];
		//UIImage *img = [[UIImage alloc] initWithData:data cache:NO];
		
		[longButton.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchDown];
		
		[longButton.view setNeedsLayout];
		[self.longButtonArray addObject:longButton]; // this will keep the pointer to imageView intact for use later
		
		[longButton release];
		rowFactor++;
		if (i%buttonsPerRow == 3) {
			heightFactor++;
			rowFactor = 0;
		} 
	}
	
 //[self.parentViewController.view setNeedsLayout];	
    [super viewDidLoad];
}

- (void)buttonAction:(id)sender {
	UIButton *b = (UIButton*)sender;
	//NSLog(@"clickwed");
	NSURL *url = [NSURL URLWithString:[[AppShortcuts objectAtIndex:b.tag] url]];
	[[UIApplication sharedApplication] openURL:url];
	//[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto://email@minming.net"]];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    for(WidgetComponent_LongButton *WidgetComponent_LongButton in longButtonArray) {
        [WidgetComponent_LongButton removeFromSuperview];
    }
    [longButtonArray removeAllObjects];	
    [super dealloc];
}


@end

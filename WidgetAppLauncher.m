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
		//AppShortcuts = [[NSMutableArray alloc] init];
		
		AppShortcuts[0].title = @"Google";
		AppShortcuts[0].url = @"http://www.google.com";
		AppShortcuts[0].image = @"http://www.google.com/favicon.ico";
		AppShortcuts[1].title = @"Yahoo";
		AppShortcuts[1].url = @"http://www.yahoo.com";
		AppShortcuts[2].title = @"Facebook";
		AppShortcuts[2].url = @"http://www.facebook.com";
		AppShortcuts[3].title = @"Twitter";
		AppShortcuts[3].url = @"http://www.twitter.com";
		AppShortcuts[4].title = @"ebay";
		AppShortcuts[4].url = @"http://www.ebay.com";
		AppShortcuts[5].title = @"Live";
		AppShortcuts[5].url = @"http://www.live.com";
		AppShortcuts[6].title = @"Reader";
		AppShortcuts[6].url = @"http://www.google.com/reader";
		
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
		[longButton.button setTitle:AppShortcuts[i].title forState:UIControlStateNormal];
		if (AppShortcuts[i].image != nil) {
			[longButton.button setImage:[GlobalFunctions getImageFromUrl:AppShortcuts[i].image] forState:UIControlStateNormal];
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
	NSURL *url = [NSURL URLWithString:AppShortcuts[b.tag].url];
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

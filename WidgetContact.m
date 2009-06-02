//
//  WidgetContact.m
//  TodayScreen
//
//  Created by Mac Pro on 5/24/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WidgetContact.h"


@implementation WidgetContact

@synthesize contactsArray;

-(id) initWithSuperTableController:(UITableViewController*)superViewController {
	if (self = [super init]) {
		tableViewController = superViewController;
		[tableViewController retain];
		
		contactsArray = [[NSMutableArray alloc] init];
		contacts[0].name = @"MING";
		contacts[1].name = @"THE";
		contacts[2].name = @"MING";
		contacts[3].name = @"MING";
	}
    return self;
}

// The designated initializer. Override to perform setup that is required before the view is loaded.
/*- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		contactsArray = [[NSMutableArray alloc] init];
		contacts[0].name = @"MING";
		contacts[1].name = @"THE";
		contacts[2].name = @"MING";
		contacts[3].name = @"MING";
    }
    return self;
}*/


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor clearColor];
	for (int i=0; i<5; i++) {
		contact = [[WidgetComponent_Contact alloc] init];
		[self.view addSubview:contact.view]; 
		contact.view.frame = CGRectMake(i*60.0+10.0, 10.0, 60.0, 50.0);
		contact.button.tag = i;
		[contact setContact:contacts[i].name];
		//[contact.button setTitle:contacts[i].name forState:UIControlStateNormal];
		//if (contacts[i].image != nil) {
		//	[contact.button setImage:[self getImageFromUrl:contacts[i].image] forState:UIControlStateNormal];
		//}
		//id path = @"http://merrimusings.mu.nu/archives/images/groundhog2.jpg";
		//NSURL *url = [NSURL URLWithString:path];
		//NSData *data = [NSData dataWithContentsOfURL:url];
		//UIImage *img = [[UIImage alloc] initWithData:data cache:NO];
		
		//[contact.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchDown];
		
		[contact.view setNeedsLayout];
		[self.contactsArray addObject:contact]; // this will keep the pointer to imageView intact for use later
		
		[contact release];
	}
		
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
	[tableViewController release];
	[contactsArray release];
    [super dealloc];
}


@end

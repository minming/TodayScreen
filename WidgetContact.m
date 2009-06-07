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
		contacts[0].name = @"min ming";
		contacts[1].name = @"shravan";
		contacts[2].name = @"steve";
		contacts[3].name = @"james";
		contacts[4].name = @"george";
	}
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor clearColor];
	for (int i=0; i<5; i++) {
		if ([contacts[i].name length] > 0) {
			contact = [[WidgetComponent_Contact alloc] init];
			[self.view addSubview:contact.view]; 
			contact.view.frame = CGRectMake(i*60.0+10.0, 10.0, 60.0, 50.0);
			contact.button.tag = i;
			//[contact setContact:contacts[i].name];
			
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
		
}

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

//
//  WidgetComponent_Contact.m
//  TodayScreen
//
//  Created by Mac Pro on 5/24/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WidgetComponent_Contact.h"
#import "iPhoneAddressBookAPI.h"

@implementation WidgetComponent_Contact

@synthesize name;
@synthesize button;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor clearColor];
	//self.button

	//[self getContactInfo:@"THE"];
}


- (void)setContact:(NSString*)fullName {
	if ([fullName length] > 0) {
		[self getContactInfo:fullName];	
		[self.button addTarget:self action:@selector(launchContact:) forControlEvents:UIControlEventTouchDown];
	}
}

- (void)launchContact:(id)sender {
	//[self getContactInfo:@"THE"];
	//////NSLog(@"contact");
	
	//ABRecordRef person = 
	
	ABPersonViewController *personViewController = [[ABPersonViewController alloc] init];
	personViewController.displayedPerson = person;
	personViewController.allowsEditing = YES;
	personViewController.view.bounds =  [UIScreen mainScreen].bounds;
	personViewController.view.clipsToBounds = NO;
	
	UIWindow *win = [[UIWindow alloc] init];
	[win addSubview:personViewController.view];
	
	UINavigationController *nav = [[UINavigationController alloc] init];
	[nav.view addSubview:personViewController.view];
	
	//self.view.bounds = [UIScreen mainScreen].bounds;
	
	//[win makeKeyAndVisible];
	//[self.view pushViewController:personViewController animated:YES];
	[self presentModalViewController:nav animated:YES]; 
	
	//[self.parentViewController.parentViewController.parentViewController.parentViewController presentModalViewController:nav animated:YES]; 
	//[[[[UIApplication sharedApplication] keyWindow] viewWithTag:1]
	//[self.parentViewController.parentViewController.parentViewController presentModalViewController:personViewController animated:YES]; 
	//[personViewController release];
	
	
}

- (ABRecordRef)getContactInfo:(NSString*)fullName {
	ABAddressBookRef addressBook = ABAddressBookCreate();
	//CFArrayRef people = ABAddressBookCopyArrayOfAllPeople(addressBook);
	//CFMutableArrayRef peopleMutable = CFArrayCreateMutableCopy(
	//														   kCFAllocatorDefault,
	//														   CFArrayGetCount(people),
	//														   people
	//														   );	
	CFArrayRef matches = ABAddressBookCopyPeopleWithName(addressBook, (CFStringRef)fullName);
	//ABRecordRef person = NULL;
	person = NULL;

	if (matches && CFArrayGetCount(matches)) {
		person = (id)CFArrayGetValueAtIndex(matches, 0);
		NSString *firstName = (NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
		NSString *lastName = (NSString *)ABRecordCopyValue(person, kABPersonLastNameProperty);
		//NSString *email = ABRecordCopyValue(person, kABPersonEmailProperty);
		ABMultiValueRef emails = ABRecordCopyValue(person, kABPersonEmailProperty);
		NSString *email = (NSString*) ABMultiValueCopyValueAtIndex(emails, 0);
		name.text = fullName;
		
		if(ABPersonHasImageData(person)){
			UIImage *img = [UIImage imageWithData:(NSData *)ABPersonCopyImageData(person)];
			[self.button setBackgroundImage:img forState:UIControlStateNormal];
			//[self.button setImage:img forState:UIControlStateNormal];
		}
		
	}
	CFRelease(addressBook);
	return person;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}


@end

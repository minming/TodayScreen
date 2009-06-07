//
//  iPhoneAddressBookAPI.m
//  TodayScreen
//
//  Created by Mac Pro on 5/25/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "iPhoneAddressBookAPI.h"


@implementation iPhoneAddressBookAPI


+ (void)getContactInfo:(NSString*)fullName {
	ABAddressBookRef addressBook = ABAddressBookCreate();
	//CFArrayRef people = ABAddressBookCopyArrayOfAllPeople(addressBook);
	//CFMutableArrayRef peopleMutable = CFArrayCreateMutableCopy(
	//														   kCFAllocatorDefault,
	//														   CFArrayGetCount(people),
	//														   people
	//														   );	
	CFArrayRef matches = ABAddressBookCopyPeopleWithName(addressBook, (CFStringRef)fullName);
	ABRecordRef person = NULL;
	
	if (matches && CFArrayGetCount(matches)) {
		person = (id)CFArrayGetValueAtIndex(matches, 0);
		NSString *firstName = (NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
		NSString *lastName = (NSString *)ABRecordCopyValue(person, kABPersonLastNameProperty);
		//NSString *email = ABRecordCopyValue(person, kABPersonEmailProperty);
		ABMultiValueRef emails = ABRecordCopyValue(person, kABPersonEmailProperty);
		NSString *email = (NSString*)ABMultiValueCopyValueAtIndex(emails, 0);
		
		ABPersonViewController *personViewController = [[ABPersonViewController alloc] init];
        personViewController.displayedPerson = person;
        personViewController.allowsEditing = YES;
        //[self.view pushViewController:personViewController animated:YES];
        [personViewController release];

		////NSLog(@"%@",firstName);
		////NSLog(@"%@",lastName);
		//////NSLog(@"%@",email);
	}
	CFRelease(addressBook);
}

@end

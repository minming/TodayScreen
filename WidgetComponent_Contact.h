//
//  WidgetComponent_Contact.h
//  TodayScreen
//
//  Created by Mac Pro on 5/24/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface WidgetComponent_Contact : UIViewController {
	IBOutlet UILabel *name;
	IBOutlet UIButton *button;
	ABRecordRef person;
}

@property (nonatomic, retain) IBOutlet UILabel *name;
@property (nonatomic, retain) IBOutlet UIButton *button;


- (void)getContactInfo:(NSString*)fullName;
//- (IBAction)launchContact:(id)sender;
- (void)launchContact:(id)sender;
- (void)setContact:(NSString*)fullName;

@end

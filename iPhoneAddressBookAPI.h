//
//  iPhoneAddressBookAPI.h
//  TodayScreen
//
//  Created by Mac Pro on 5/25/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface iPhoneAddressBookAPI : NSObject {

}

+ (void)getContactInfo:(NSString*)fullName;


@end

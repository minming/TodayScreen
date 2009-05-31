//
//  WidgetContact.h
//  TodayScreen
//
//  Created by Mac Pro on 5/24/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WidgetComponent_Contact.h"
#import "WidgetViewControllerSuperClass.h"

typedef struct  {
	NSString *name;
	NSString *image;
	NSString *mode;
} Contact;

@interface WidgetContact : WidgetViewControllerSuperClass {
	NSMutableArray *contactsArray;
	WidgetComponent_Contact *contact;
	Contact contacts[4];
}
@property (nonatomic, copy) NSMutableArray *contactsArray;

@end

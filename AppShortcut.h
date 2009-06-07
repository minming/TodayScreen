//
//  AppShortcut.h
//  TodayScreen
//
//  Created by Shravan Reddy on 5/26/09.
//  Copyright 2009 Stanford University. All rights reserved.
//

#import <Foundation/Foundation.h>

// Simple class to encapsulate the information for the AppShortcuts in the WidgetAppLauncher. Better than using a C style struct

@interface AppShortcut : NSObject<NSCoding> {
	NSString* title;
	NSString* url;
	NSString* image;
}

@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* url;
@property (nonatomic, copy) NSString* image;

- (id)initWithTitle:(NSString *)title url:(NSString*)url image:(NSString*)image;
@end

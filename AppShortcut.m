//
//  AppShortcut.m
//  TodayScreen
//
//  Created by Shravan Reddy on 5/26/09.
//  Copyright 2009 Stanford University. All rights reserved.
//

#import "AppShortcut.h"


@implementation AppShortcut

@synthesize title;
@synthesize url;
@synthesize image;


- (id)initWithTitle:(NSString *)newTitle url:(NSString*)newUrl image:(NSString*)newImage {
    if (self = [super init]) {
		[self setTitle:newTitle];
		[self setUrl:newUrl];
		[self setImage:newImage];
    }
    return self;
}

@end

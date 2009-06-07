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

-(void)encodeWithCoder:(NSCoder *)encoder
{
	[encoder encodeObject:title forKey:@"Title"];
	[encoder encodeObject:url forKey:@"URL"];
	[encoder encodeObject:image forKey:@"Image"];
}

-(id)initWithCoder:(NSCoder *)decoder
{
	title = [decoder decodeObjectForKey:@"Title"];
	url = [decoder decodeObjectForKey:@"URL"];
	image = [decoder decodeObjectForKey:@"Image"];
	
	[title retain];
	[url retain];
	[image retain];
	return self;
}

-(void)dealloc {
	[title release];
	[url release];
	[image release];
	[super dealloc];
}
@end

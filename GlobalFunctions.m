//
//  GlobalFunctions.m
//  TodayScreen
//
//  Created by Mac Pro on 5/24/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "GlobalFunctions.h"


@implementation GlobalFunctions


+ (UIImage*)getImageFromUrl:(NSString*)path {
	if (path == nil) {
		return nil;
	}
	NSURL *url = [NSURL URLWithString:path];
	NSData *data = [NSData dataWithContentsOfURL:url];
	UIImage *img = [[UIImage alloc] initWithData:data];
	return img;
}

@end

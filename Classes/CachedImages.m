//
//  CachedImages.m
//  Presence
//
//  Created by Shravan Reddy on 5/12/09.
//  Copyright 2009 Stanford University. All rights reserved.
//

#import "CachedImages.h"

NSString *const LoadingPlaceholder = @"Loading";

@implementation CachedImages

#pragma mark -
#pragma mark Cached Image Loading

-(id)initWithResponder:(WidgetViewControllerSuperClass*)callback{
	self = [super init];
    if (self) {
		cachedImages = [[NSMutableDictionary alloc] init];
		callbackWidget = callback;
	}
	return self;
}

- (UIImage *)cachedImageForURL:(NSString *)urlString OperationQueue:(NSOperationQueue *)operationQueue  
{
    id cachedObject = [cachedImages objectForKey:urlString];
    if (cachedObject == nil) {
        [cachedImages setObject:LoadingPlaceholder forKey:urlString];     
		NSURL* url = [NSURL URLWithString:urlString];
        ImageLoadingOperation *operation = [[ImageLoadingOperation alloc] initWithImageURL:url target:self action:@selector(didFinishLoadingImageWithResult:)];
        [operationQueue addOperation:operation];
        [operation release];
    } else if (![cachedObject isKindOfClass:[UIImage class]]) {
        cachedObject = nil;
    }
    
    return cachedObject;
}

- (void)didFinishLoadingImageWithResult:(NSDictionary *)result
{
    NSString *url = [result objectForKey:@"url"];
    UIImage *image = [result objectForKey:@"image"];
	NSLog(@"did finish loading image");
	if(image != nil) {
		NSLog(@"image not null");
		[cachedImages setObject:image forKey:url];   
		[callbackWidget imageCallbackFunction];
	}
}

-(void)clearCachedImages {
	[cachedImages removeAllObjects];
}
#pragma mark -
#pragma mark dealloc

- (void)dealloc {
	[cachedImages release];
    
    [super dealloc];
}

@end

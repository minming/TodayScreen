//
//  CachedImages.h
//  Presence
//
//  Created by Shravan Reddy on 5/12/09.
//  Copyright 2009 Stanford University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageLoadingOperation.h"
#import "WidgetViewControllerSuperClass.h"

@interface CachedImages : NSObject {
	NSMutableDictionary *cachedImages;
	WidgetViewControllerSuperClass* callbackWidget;
}

-(id)initWithResponder:(WidgetViewControllerSuperClass*) callback;
- (UIImage *)cachedImageForURL:(NSString *)url OperationQueue:(NSOperationQueue *)operationQueue;
- (void)didFinishLoadingImageWithResult:(NSDictionary *)result;
-(void)clearCachedImages;

@end

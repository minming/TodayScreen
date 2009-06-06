//
//  CachedImages.h
//  Presence
//
//  Created by Shravan Reddy on 5/12/09.
//  Copyright 2009 Stanford University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageLoadingOperation.h"

@interface CachedImages : NSObject {
	NSMutableDictionary *cachedImages;
}

-(id)init;
- (UIImage *)cachedImageForURL:(NSString *)url OperationQueue:(NSOperationQueue *)operationQueue;
- (void)didFinishLoadingImageWithResult:(NSDictionary *)result;
-(void)clearCachedImages;

@end

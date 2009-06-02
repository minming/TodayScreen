//
//  WidgetRSS.h
//  TodayScreen
//
//  Created by Mac Pro on 5/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WidgetViewControllerSuperClass.h"


@interface WidgetRSS : WidgetViewControllerSuperClass {
	UIActivityIndicatorView * activityIndicator;
	NSXMLParser * rssParser;	
	NSMutableArray * stories;
	
	NSMutableDictionary * item;
	NSString * currentElement;
	NSMutableString * currentTitle, * currentDate, * currentSummary, * currentLink;
	
	NSMutableArray *singleRSSArray;
	int NUM_OF_FEEDS;
}
@property (nonatomic, copy) NSMutableArray *singleRSSArray;
@property int NUM_OF_FEEDS;

- (void)buttonAction:(id)sender;
- (void)parseXMLFileAtURL:(NSString *)URL;
-(id) initWithSuperTableController:(UITableViewController*)superViewController numFeeds:(NSInteger)num;
@end

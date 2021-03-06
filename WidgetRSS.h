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
	
	NSString* rssFeed;
}


@property (nonatomic, copy) NSString* rssFeed;
@property (nonatomic, copy) NSMutableArray *singleRSSArray;
@property int NUM_OF_FEEDS;

-(void)resetStories;
- (void)buttonAction:(id)sender;
- (void)parseXMLFileAtURL:(NSString *)URL;
-(id)initWithSuperTableController:(UITableViewController*)superViewController numFeeds:(NSInteger)num;

-(void)changeSettingsAndReload:(NSString*)feedURL numFeeds:(int)num;
- (void)reloadRSS;
@end

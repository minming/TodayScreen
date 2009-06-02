//
//  WidgetRSS.m
//  TodayScreen
//
//  Created by Shravan Reddy on 6/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WidgetRSS.h"
#import "WidgetComponent_SingleRSS.h"

#import "WidgetSettingsNavigationController.h"
#include "WidgetRSSSettings.h"

#define DEFAULT_FEED @"http://www.engadget.com/rss.xml"
 
@implementation WidgetRSS

@synthesize singleRSSArray;
@synthesize NUM_OF_FEEDS;
@synthesize rssFeed;

-(id) initWithSuperTableController:(UITableViewController*)superViewController  numFeeds:(NSInteger)num {
	if (self = [super init]) {
		tableViewController = superViewController;
		[tableViewController retain];
		
		singleRSSArray = [[NSMutableArray alloc] init];
		[self setNUM_OF_FEEDS:num];
		[self setRssFeed:DEFAULT_FEED];
    }
    return self;
}

- (int)getHeight {
	return [self NUM_OF_FEEDS]*40+20;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor clearColor];
	//self.NUM_OF_FEEDS = 3; //temp set for testing
	if ([stories count] == 0 || stories == nil) {
		//NSString * path = @"http://www.engadget.com/rss.xml";
		[self parseXMLFileAtURL:rssFeed];
	}
	
}

- (void)showRSS {
	if ([stories count] != 0) {
		for (int i=0; i<NUM_OF_FEEDS; i++) {
			if (i<[stories count]) {
				WidgetComponent_SingleRSS *singleRSS = [[WidgetComponent_SingleRSS alloc] init];
				//singleRSS.button.tag = i;
				//[singleRSS.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchDown];
				[self.view addSubview:singleRSS.view];
				singleRSS.view.frame = CGRectMake(0.0, i*40.0+10.0, 320.0, 50.0);
				
				//NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];  
				//NSDate *date = [formatter dateFromString:[[stories objectAtIndex: i] objectForKey: @"date"]];  
				//[formatter setDateFormat:@"HH:mm"];
				//NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];  
				//[dateFormatter setDateFormat:@"dd MMM"];
				
				//[formatter setTimeStyle:NSDateFormatterShortStyle];  
				//[timeLabel setText:[formatter stringFromDate:date]];  
				
				
				singleRSS.titleLabel.text = [[stories objectAtIndex: i] objectForKey: @"title"];
				//singleRSS.dateLabel.text = [dateFormatter stringFromDate:date];
				//singleRSS.timeLabel.text = [formatter stringFromDate:date];
				singleRSS.datetimeLabel.text = [[stories objectAtIndex: i] objectForKey: @"date"];
				singleRSS.url = [[stories objectAtIndex:i] objectForKey:@"link"];
				
				[singleRSS.view setNeedsLayout];
				[singleRSSArray addObject:singleRSS];
				[singleRSS release];
			}
		}
	}
}

- (void)buttonAction:(id)sender {
	NSLog(@"CLICKED");
	UIButton *b = (UIButton*)sender;
	[[UIApplication sharedApplication] openURL:[[stories objectAtIndex:b.tag] objectForKey:@"link"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[singleRSSArray release];
    [super dealloc];
}


- (void)editSettingsAction:(id)sender {
	NSLog(@"SETTINGS");
	WidgetSettingsNavigationController *navController = [[WidgetSettingsNavigationController alloc] init];
	navController.navigationBar.barStyle = UIBarStyleBlackOpaque;
	WidgetRSSSettings *widgetRSSSettings = [[WidgetRSSSettings alloc] initWithWidget:self];
	[navController pushViewController:widgetRSSSettings animated:YES];
	[tableViewController presentModalViewController:navController animated:YES];
	[navController release];
	[widgetRSSSettings release];
}

- (void)parserDidStartDocument:(NSXMLParser *)parser{	
	//NSLog(@"found file and started parsing");
	
}

- (void)parseXMLFileAtURL:(NSString *)URL
{	
	stories = [[NSMutableArray alloc] init];
	
    //you must then convert the path to a proper NSURL or it won't work
    NSURL *xmlURL = [NSURL URLWithString:URL];
	
    // here, for some reason you have to use NSClassFromString when trying to alloc NSXMLParser, otherwise you will get an object not found error
    // this may be necessary only for the toolchain
    rssParser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
	
    // Set self as the delegate of the parser so that it will receive the parser delegate methods callbacks.
    [rssParser setDelegate:self];
	
    // Depending on the XML document you're parsing, you may want to enable these features of NSXMLParser.
    [rssParser setShouldProcessNamespaces:NO];
    [rssParser setShouldReportNamespacePrefixes:NO];
    [rssParser setShouldResolveExternalEntities:NO];
	
    [rssParser parse];
	
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
	NSString * errorString = [NSString stringWithFormat:@"Unable to download story feed from web site (Error code %i )", [parseError code]];
	//NSLog(@"error parsing XML: %@", errorString);
	
	UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Error loading content" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[errorAlert show];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{			
    //NSLog(@"found this element: %@", elementName);
	currentElement = [elementName copy];
	if ([elementName isEqualToString:@"item"]) {
		// clear out our story item caches...
		item = [[NSMutableDictionary alloc] init];
		currentTitle = [[NSMutableString alloc] init];
		currentDate = [[NSMutableString alloc] init];
		currentSummary = [[NSMutableString alloc] init];
		currentLink = [[NSMutableString alloc] init];
	}
	
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{     
	//NSLog(@"ended element: %@", elementName);
	if ([elementName isEqualToString:@"item"]) {
		// save values to an item, then store that item into the array...
		[item setObject:currentTitle forKey:@"title"];
		[item setObject:currentLink forKey:@"link"];
		[item setObject:currentSummary forKey:@"summary"];
		[item setObject:currentDate forKey:@"date"];
		
		[stories addObject:[item copy]];
		//NSLog(@"adding story: %@", currentTitle);
	}
	
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
	//NSLog(@"found characters: %@", string);
	// save the characters for the current item...
	if ([currentElement isEqualToString:@"title"]) {
		[currentTitle appendString:string];
	} else if ([currentElement isEqualToString:@"link"]) {
		[currentLink appendString:string];
	} else if ([currentElement isEqualToString:@"description"]) {
		[currentSummary appendString:string];
	} else if ([currentElement isEqualToString:@"pubDate"]) {
		[currentDate appendString:string];
	}
	
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
	
	[activityIndicator stopAnimating];
	[activityIndicator removeFromSuperview];
	
	//NSLog(@"all done!");
	//NSLog(@"stories array has %d items", [stories count]);
	[self showRSS];
	//[newsTable reloadData];
}




@end

//
//  TodayScreenTableViewController.m
//  TodayScreen
//
//  Created by Mac Pro on 5/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TodayScreenTableViewController.h"
#import "WidgetAppLauncher.h"
#import "WidgetClockDate.h"
#import "WidgetRSS.h"
#import "WidgetWeather.h"
#import "WidgetContact.h"
#import "WidgetFlipClockDate.h"
#import "WidgetViewControllerSuperClass.h"

#define WIDGET_CLOCK 500
#define WIDGET_RSS 501
#define WIDGET_CONTACT 502
#define WIDGET_FLIP_CLOCK 503
#define WIDGET_APPLAUNCHER 504
#define WIDGET_WEATHER 505

@interface TodayScreenTableViewController (Internal)

-(void) initWidgetsArray;

@end

@implementation TodayScreenTableViewController

@synthesize widgetsArray;
@synthesize settingsMode;
//@synthesize bgImageView;

- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
	if (self = [super initWithStyle:style]) {
		settingsMode = NO;
		widgetsArray = [[NSMutableArray alloc] init];
		
		userDefaults = [[UserDefaults alloc] init];
		[self initWidgetsArray];
    }
    return self;
}

- (void)dealloc {
	[widgetsArray release];
	//[bgImageView release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	[self.view setBackgroundColor:[UIColor clearColor]];
	//self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg1.jpg"]];
	self.tableView.separatorColor = [UIColor clearColor];
	self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	
	//bgImageView.frame = CGRectMake(0, 0, 320.0, 480.0);
	//bgImageView.image = [UIImage imageNamed:@"bg1.jpg"];
	//[self.view addSubview:bgImageView];
	
	
	//self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg1.jpg"]];
	
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void) initWidgetsArray {
	NSMutableArray* widgetsNameArray = [userDefaults getWidgetsArrayFromPrefs];
	if([widgetsNameArray count] > 0) {
		for(NSString* widgetName in widgetsNameArray) {
			NSLog(@"Widget name: %@", widgetName);
			
			if([widgetName rangeOfString:@"weatherWidget"].location != NSNotFound) {
				[self addNewWidget:WIDGET_WEATHER];
				[userDefaults loadWeatherWidgetFromPrefs:widgetName widget:[widgetsArray objectAtIndex:([widgetsArray count] - 1)]];
			} else if ([widgetName rangeOfString:@"clockDateWidget"].location != NSNotFound) {
				[self addNewWidget:WIDGET_CLOCK];
				[userDefaults loadClockWidgetFromPrefs:widgetName widget:[widgetsArray objectAtIndex:([widgetsArray count] - 1)]];
			} else if ([widgetName rangeOfString:@"rssWidget"].location != NSNotFound) {
				[self addNewWidget:WIDGET_RSS];
				[userDefaults loadRSSWidgetFromPrefs:widgetName widget:[widgetsArray objectAtIndex:([widgetsArray count] - 1)]];
			} else if ([widgetName rangeOfString:@"appLauncherWidget"].location != NSNotFound) {
				[self addNewWidget:WIDGET_APPLAUNCHER];
				[userDefaults loadAppLauncherWidgetFromPrefs:widgetName widget:[widgetsArray objectAtIndex:([widgetsArray count] - 1)]];
			} else if ([widgetName rangeOfString:@"contactWidget"].location != NSNotFound) {
				[self addNewWidget:WIDGET_CONTACT];
				[userDefaults loadContactWidgetFromPrefs:widgetName widget:[widgetsArray objectAtIndex:([widgetsArray count] - 1)]];
			} else if ([widgetName rangeOfString:@"flipClockDateWidget"].location != NSNotFound) {
				[self addNewWidget:WIDGET_FLIP_CLOCK];
				//[userDefaults loadFlipClockWidgetFromPrefs:widgetName widget:[widgetsArray objectAtIndex:([widgetsArray count] - 1)]];
			} 
		}
	} else {	
		[self addNewWidget:WIDGET_FLIP_CLOCK];
		[self addNewWidget:WIDGET_CLOCK];
		[self addNewWidget:WIDGET_WEATHER];
		[self addNewWidget:WIDGET_RSS];
		[self addNewWidget:WIDGET_APPLAUNCHER];
	}
	[self.tableView reloadData];
	//addNewWidget:WIDGET_CONTACT;
}


-(void) addNewWidget:(NSInteger)widgetType {
	switch (widgetType) {
		case WIDGET_FLIP_CLOCK: {
			NSLog(@"Add flip clock");
			WidgetFlipClockDate *flipClockDate = [[WidgetFlipClockDate alloc] init];
			self.view.tag = 1;
			[self.widgetsArray addObject:flipClockDate];
			[flipClockDate release];
			break; 
		}
		case WIDGET_CLOCK: {
			NSLog(@"Add widget clock");
			WidgetClockDate *clockDate = [[WidgetClockDate alloc] initWithSuperTableController:self timeFormat:@"h:mm a   EEE dd MMM"];
			self.view.tag = 1;
			[self.widgetsArray addObject:clockDate];
			[clockDate release];
			break;
		}
		case WIDGET_RSS: {
			NSLog(@"Add rss");
			WidgetRSS *RSS = [[WidgetRSS alloc] initWithSuperTableController:self numFeeds:3];
			[self.widgetsArray addObject:RSS];
			[RSS release];
			break;
		}
		case WIDGET_WEATHER: {
			NSLog(@"Add weather");
			WidgetWeather *weather = [[WidgetWeather alloc] initWithSuperTableController:self zipCode:DEFAULT_ZIP_CODE];
			[self.widgetsArray addObject:weather];
			[weather release];
			break;
		}
		case WIDGET_APPLAUNCHER: {
			NSLog(@"Add app launcher");
			WidgetAppLauncher *appLauncher = [[WidgetAppLauncher alloc] initWithSuperTableController:self];
			[self.widgetsArray addObject:appLauncher];
			[appLauncher release];
			break;
		}
		case WIDGET_CONTACT: {
			NSLog(@"Add contact");
			WidgetContact *contact = [[WidgetContact alloc] initWithSuperTableController:self];
			[self.widgetsArray addObject:contact];
			break;
		}
		default:
			break;
	}
	[self.tableView reloadData];
	
	NSLog(@"Number of widgets: %d", [self.widgetsArray count]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [widgetsArray count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
		[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
		//[cell setBackgroundView:UITableViewStylePlain];
		[cell setShouldIndentWhileEditing:NO];
		cell.clipsToBounds = YES;
		cell.contentView.clipsToBounds = YES;
    }
	
	cell.accessoryType = UITableViewCellAccessoryNone;
	if(settingsMode == YES) {
		NSLog(@"SETTINGS MODE");
		cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
		cell.contentView.alpha = 0.5;
	} else if (cell.editing == YES) {
		NSLog(@"EDITING MODE");
		//cell.contentView.backgroundColor  = [[UIColor blackColor] colorWithAlphaComponent:0.5];
		cell.contentView.alpha = 0.5;
		//while( [cell.contentView.subviews count] ){
		//	id subview = [cell.contentView.subviews objectAtIndex:0];
		//	[subview removeFromSuperview];	
		//}//while
		//cell.text = @"EDIT MODE FOR...";
		//tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
	}
	//if (cell.tag != 10) {
	else {
		//cell.text = @"";
		//cell.contentView.backgroundColor  = [UIColor clearColor];
		cell.contentView.alpha = 1.0;
		NSLog(@"ADDING MODE");
		[cell.contentView addSubview:[[widgetsArray objectAtIndex:indexPath.row] view]];
		//[cell setTag:10];
	}
    return cell;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
	WidgetViewControllerSuperClass* temp = [[self widgetsArray] objectAtIndex:[indexPath row]];
	[temp editSettingsAction:nil];
}


#pragma mark -
#pragma mark edit, delete cells methods
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath 
{
	if (editingStyle == UITableViewCellEditingStyleDelete) 
	{
        [widgetsArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
	NSObject* temp = [widgetsArray objectAtIndex:fromIndexPath.row];
	[temp retain];
	[widgetsArray removeObjectAtIndex:fromIndexPath.row];
	[widgetsArray insertObject:temp atIndex:toIndexPath.row];
	[temp release];
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath  
{  
    WidgetViewControllerSuperClass *temp = [widgetsArray objectAtIndex:indexPath.row];
	return [temp getHeight];
}  

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (void)tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath {
	//[tableView cellForRowAtIndexPath:indexPath].backgroundColor = [UIColor blueColor];
}

#pragma mark -
#pragma mark user defaults methods

-(void)saveUserPrefs {
	NSLog(@"called save");
	
	NSInteger i = 0;
	for(WidgetViewControllerSuperClass* widget in widgetsArray) {
		if([widget class] == [WidgetWeather class]) {
			[userDefaults writeWeatherWidgetPrefs:[@"weatherWidget" stringByAppendingString:[NSString stringWithFormat:@"%d", i]] zipCode:[(WidgetWeather*)widget zipCode]];
		} else if ([widget class] == [WidgetClockDate class]) {
			[userDefaults writeClockWidgetPrefs:[@"clockDateWidget" stringByAppendingString:[NSString stringWithFormat:@"%d", i]] timeFormat:[(WidgetClockDate*) widget timeFormat] dateFormat:[(WidgetClockDate*) widget dateFormat]];
		} else if ([widget class] == [WidgetRSS class]) {
			[userDefaults writeRSSWidgetPrefs:[@"rssWidget" stringByAppendingString:[NSString stringWithFormat:@"%d", i]] rssArray:[(WidgetRSS*) widget singleRSSArray] numFeeds:[(WidgetRSS*)widget NUM_OF_FEEDS]];
		} else if ([widget class] == [WidgetAppLauncher class]) {
			[userDefaults writeAppLauncherWidgetPrefs:[@"appLauncherWidget" stringByAppendingString:[NSString stringWithFormat:@"%d", i]] appArray:[(WidgetAppLauncher*)widget AppShortcuts] appNumRows:[(WidgetAppLauncher*)widget numRows]];
		} else if ([widget class] == [WidgetContact class]) {
			[userDefaults writeContactWidgetPrefs:[@"contactWidget" stringByAppendingString:[NSString stringWithFormat:@"%d", i]] contacts:[(WidgetContact*) widget contactsArray]];
		}
		
		i++;
	}
	[userDefaults writeWidgetArrayPrefs:widgetsArray];
	NSLog(@"User defaults: %@", userDefaults);
}

@end


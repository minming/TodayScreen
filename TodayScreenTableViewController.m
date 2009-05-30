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
//@synthesize bgImageView;

- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
	if (self = [super initWithStyle:style]) {
		widgetsArray = [[NSMutableArray alloc] init];
		[self initWidgetsArray];
    }
    return self;
}

- (void)dealloc {
	[widgetsArray release];
	//[bgImageView release];// forKeyPath:<#(NSString *)keyPath#>
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
	[self addNewWidget:WIDGET_FLIP_CLOCK];
	[self addNewWidget:WIDGET_CLOCK];
	[self addNewWidget:WIDGET_WEATHER];
	[self addNewWidget:WIDGET_RSS];
	[self addNewWidget:WIDGET_APPLAUNCHER];
	//addNewWidget:WIDGET_CONTACT;
}


-(void) addNewWidget:(NSInteger)widgetType {
	switch (widgetType) {
		case WIDGET_FLIP_CLOCK: {
			NSLog(@"Add flip clock");
			WidgetFlipClockDate *flipClockDate = [[WidgetFlipClockDate alloc] init];
			[self.widgetsArray addObject:flipClockDate];
			[flipClockDate release];
			break; 
		}
		case WIDGET_CLOCK: {
			NSLog(@"Add widget clock");
			WidgetClockDate *clockDate = [[WidgetClockDate alloc] init];
			[self.widgetsArray addObject:clockDate];
			[clockDate release];
			break;
		}
		case WIDGET_RSS: {
			NSLog(@"Add rss");
			WidgetRSS *RSS = [[WidgetRSS alloc] init];
			[self.widgetsArray addObject:RSS];
			[RSS release];
			break;
		}
		case WIDGET_WEATHER: {
			NSLog(@"Add weather");
			WidgetWeather *weather = [[WidgetWeather alloc] initWithZipCode:DEFAULT_ZIP_CODE];
			[self.widgetsArray addObject:weather];
			[weather release];
			break;
		}
		case WIDGET_APPLAUNCHER: {
			NSLog(@"Add app launcher");
			WidgetAppLauncher *appLauncher = [[WidgetAppLauncher alloc] init];
			[self.widgetsArray addObject:appLauncher];
			[appLauncher release];
			break;
		}
		case WIDGET_CONTACT: {
			NSLog(@"Add contact");
			WidgetContact *contact = [[WidgetContact alloc] init];
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
		[cell setBackgroundView:UITableViewStylePlain];
    }
	
	[cell.contentView addSubview:[[widgetsArray objectAtIndex:indexPath.row] view]];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath  
{  
    return 150.0; //returns floating point which will be used for a cell row height at specified row index  
}  

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	//return nil;
    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{ 
	return nil;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
	// Return NO if you do not want the specified item to be editable.
	return NO;
}


/*
 - (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
 }
 */
/*
 - (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];
 }
 */
/*
 - (void)viewWillDisappear:(BOOL)animated {
 [super viewWillDisappear:animated];
 }
 */
/*
 - (void)viewDidDisappear:(BOOL)animated {
 [super viewDidDisappear:animated];
 }
 */

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */


/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


@end


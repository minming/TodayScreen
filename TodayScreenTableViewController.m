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


@implementation TodayScreenTableViewController

@synthesize widgetsArray;
//@synthesize bgImageView;

- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
	if (self = [super initWithStyle:style]) {
		widgetsArray = [[NSMutableArray alloc] init];
    }
    return self;
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
    return 6;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
		[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    // Set up the cell...
	if (indexPath.row == 0) {
		WidgetFlipClockDate *flipClockDate = [[WidgetFlipClockDate alloc] init];	//WithNibName:@"WidgetAppLauncher.xib" bundle:nil] autorelease];
		[cell.contentView addSubview:flipClockDate.view];
		[self.widgetsArray addObject:flipClockDate];
		[flipClockDate release];
	} 
	
	if (indexPath.row == 1) {
		WidgetClockDate *clockDate = [[WidgetClockDate alloc] init];	//WithNibName:@"WidgetAppLauncher.xib" bundle:nil] autorelease];
		[cell.contentView addSubview:clockDate.view];
		[self.widgetsArray addObject:clockDate];
		[clockDate release];
	} 
	
	if (indexPath.row == 2) {
		WidgetRSS *RSS = [[WidgetRSS alloc] init];	//WithNibName:@"WidgetAppLauncher.xib" bundle:nil] autorelease];
		[cell.contentView addSubview:RSS.view];
		[self.widgetsArray addObject:RSS];
		[RSS release];
	} 
	
	if (indexPath.row == 3) {
		WidgetWeather *weather = [[WidgetWeather alloc] init];	//WithNibName:@"WidgetAppLauncher.xib" bundle:nil] autorelease];
		[cell.contentView addSubview:weather.view];
		[self.widgetsArray addObject:weather];
		[weather release];
	} 
	
	if (indexPath.row == 4) {
		WidgetContact *contact = [[WidgetContact alloc] init];//WithNibName:@"WidgetAppLauncher.xib" bundle:nil] autorelease];
		[cell.contentView addSubview:contact.view];
		[self.widgetsArray addObject:contact];
		[contact release];
	} 
	
	if (indexPath.row == 5) {
		WidgetAppLauncher *appLauncher = [[WidgetAppLauncher alloc] init];//WithNibName:@"WidgetAppLauncher.xib" bundle:nil] autorelease];
		[cell.contentView addSubview:appLauncher.view];
		[self.widgetsArray addObject:appLauncher];
		[appLauncher release];
	} 
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath  
{  
    return 100.0; //returns floating point which will be used for a cell row height at specified row index  
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

- (BOOL)tableView:(UITableView *)tableView canSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{ 
	return NO;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
	// Return NO if you do not want the specified item to be editable.
	return NO;
}


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


- (void)dealloc {
	//[bgImageView release];// forKeyPath:<#(NSString *)keyPath#>
    [super dealloc];
}


@end


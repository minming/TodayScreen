#import "AddNewWidgetViewController.h"

@implementation AddNewWidgetViewController

@synthesize delegate;

- (IBAction)addNewWidget:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(AddNewWidgetViewController:widgetType:)]) {
        [self.delegate AddNewWidgetViewController:self widgetType:[sender tag]];
    }
}

- (void)viewDidLoad {
	
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"settingsbg.png"]];
}

- (IBAction)cancelAddWidget:(id)sender
{
    [self.delegate cancelAddWidget]; 
}


- (void)dealloc {
	//[delegate release];
    [super dealloc];
}


@end

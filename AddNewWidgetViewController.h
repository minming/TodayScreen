#import <UIKit/UIKit.h>

@protocol AddNewWidgetViewControllerDelegate;

@interface AddNewWidgetViewController : UIViewController {
    id<AddNewWidgetViewControllerDelegate> delegate;
}

@property (assign) id<AddNewWidgetViewControllerDelegate> delegate;

- (IBAction)cancelAddWidget:(id)sender;
- (IBAction)addNewWidget:(id)sender;

@end

@protocol AddNewWidgetViewControllerDelegate <NSObject>

@optional
- (void)AddNewWidgetViewController:(AddNewWidgetViewController *)controller widgetType:(NSInteger)widgetType;
- (void)cancelAddWidget;

@end
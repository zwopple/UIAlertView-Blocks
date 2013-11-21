#import <UIKit/UIKit.h>

@interface UIAlertView (Blocks)

#pragma mark - Properties

@property (nonatomic, copy) void (^completionHandler)(UIAlertView *alertView, NSInteger buttonIndex);

#pragma mark - Initialization

+ (instancetype)alertViewWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonsTitles, ... NS_REQUIRES_NIL_TERMINATION;

#pragma mark - Actions

- (void)showWithCompletionHandler:(void (^)(UIAlertView *alertView, NSInteger buttonIndex))completionHandler;

@end

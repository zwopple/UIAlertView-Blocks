#import "UIAlertView+Blocks.h"
#import <objc/runtime.h>

static void *completionHandlerKey = &completionHandlerKey;

@implementation UIAlertView (Blocks)

#pragma mark - Properties

@dynamic completionHandler;

- (void (^)(UIAlertView *alertView, NSInteger buttonIndex))completionHandler {
    return objc_getAssociatedObject(self, completionHandlerKey);
}
- (void)setCompletionHandler:(void (^)(UIAlertView *alertView, NSInteger buttonIndex))completionHandler {
    objc_setAssociatedObject(self, completionHandlerKey, completionHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark - Initialization

+ (instancetype)alertViewWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonsTitle, ... {
    UIAlertView *av = [[self alloc] initWithTitle:title
                                          message:message
                                         delegate:nil
                                cancelButtonTitle:cancelButtonTitle
                                otherButtonTitles:otherButtonsTitle, nil];
    
    if(otherButtonsTitle) {
        va_list args;
        va_start(args, otherButtonsTitle);
        while((otherButtonsTitle = va_arg(args, id)) != nil) {
            [av addButtonWithTitle:otherButtonsTitle];
        }
        va_end(args);
    }
    return av;
}

#pragma mark - Actions

- (void)showWithCompletionHandler:(void (^)(UIAlertView *alertView, NSInteger buttonIndex))completionHandler  {
    if(self.delegate != nil) {
        NSLog(@"WARNING: resetting delegate on UIAlertView because completion handler will be used.");
    }
    self.delegate = (id<UIAlertViewDelegate>)self;
    self.completionHandler = completionHandler;
    [self show];
}

#pragma mark - UIAlertViewDelegte

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {
    if(self.completionHandler) {
        self.completionHandler(alertView, buttonIndex);
    }
}

@end

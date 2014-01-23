//
//  TiUITableViewProxy+KeyboardDismiss.m
//  TiSoftKeyboard
//
//  Created by pier on 23/01/14.
//
//

#import "TiBase.h"
#import "TiComplexValue.h"
#import "ItSmcSoftkeyboardModule.h"
#import "TiUITableView.h"
#import "TiUITableViewProxy.h"
#import "TiUITableViewProxy+KeyboardDismiss.h"

@implementation TiUITableViewProxy (KeyboardDismiss)


- (void)setKeyboardDismissMode:(id)args
{
    ENSURE_TYPE_OR_NIL(args, NSString);
    NSString * mode = (NSString *)args;
    UIScrollViewKeyboardDismissMode keyboardDismissMode =
    [ItSmcSoftkeyboardModule keyboardDismissModeFrom:mode];

    TiThreadPerformOnMainThread(^{
        TiUITableView * tableView = [self tableView];
        [tableView.tableView setKeyboardDismissMode:keyboardDismissMode];
    }, NO);
}


@end

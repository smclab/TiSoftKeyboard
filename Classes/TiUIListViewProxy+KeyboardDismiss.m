//
//  TiUIListViewProxy+KeyboardDismiss.m
//  TiSoftKeyboard
//
//  Created by pier on 23/01/14.
//
//

#import "TiBase.h"
#import "TiComplexValue.h"
#import "ItSmcSoftkeyboardModule.h"
#import "TiUIListView.h"
#import "TiUIListViewProxy.h"
#import "TiUIListViewProxy+KeyboardDismiss.h"

@implementation TiUIListViewProxy (KeyboardDismiss)


- (void)setKeyboardDismissMode:(id)args
{
    ENSURE_TYPE_OR_NIL(args, NSString);
    NSString * mode = (NSString *)args;
    UIScrollViewKeyboardDismissMode keyboardDismissMode =
        [ItSmcSoftkeyboardModule keyboardDismissModeFrom:mode];

    TiThreadPerformOnMainThread(^{
        TiUIListView * listView = [self listView];
        [[listView tableView] setKeyboardDismissMode:keyboardDismissMode];
    }, NO);
}


@end

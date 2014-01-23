//
//  TiUIScrollViewProxy+KeyboardDismiss.m
//  TiSoftKeyboard
//
//  Created by pier on 23/01/14.
//
//

#import "TiBase.h"
#import "TiComplexValue.h"
#import "ItSmcSoftkeyboardModule.h"
#import "TiUIScrollView.h"
#import "TiUIScrollViewProxy.h"
#import "TiUIScrollViewProxy+KeyboardDismiss.h"

@implementation TiUIScrollViewProxy (KeyboardDismiss)


- (void)setKeyboardDismissMode:(id)args
{
    ENSURE_TYPE_OR_NIL(args, NSString);
    NSString * mode = (NSString *)args;
    UIScrollViewKeyboardDismissMode keyboardDismissMode =
    [ItSmcSoftkeyboardModule keyboardDismissModeFrom:mode];

    TiThreadPerformOnMainThread(^{
        TiUIScrollView * scrollView = (TiUIScrollView *)[self view];
        [scrollView.scrollView setKeyboardDismissMode:keyboardDismissMode];
    }, NO);
}


@end

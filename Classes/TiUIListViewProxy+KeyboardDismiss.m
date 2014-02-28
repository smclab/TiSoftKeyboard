/**
 * Copyright (c) 2014 SMC Treviso s.r.l. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */

#ifdef USE_TI_UILISTVIEW

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

#endif

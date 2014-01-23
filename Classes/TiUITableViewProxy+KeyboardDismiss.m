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

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

#import "ItSmcSoftkeyboardModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation ItSmcSoftkeyboardModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
    return @"ee1a0dab-a991-49b6-aeac-3a915abc610c";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
    return @"it.smc.softkeyboard";
}

#pragma mark Lifecycle

-(void)startup
{
    // this method is called when the module is first loaded
    // you *must* call the superclass
    [super startup];

    NSNotificationCenter * nc = [NSNotificationCenter defaultCenter];

    [nc addObserver:self
           selector:@selector(keyboardWillShow:)
               name:UIKeyboardWillShowNotification
             object:nil];

    [nc addObserver:self
           selector:@selector(keyboardWillHide:)
               name:UIKeyboardWillHideNotification
             object:nil];

    [nc addObserver:self
           selector:@selector(keyboardWillChange:)
               name:UIKeyboardWillChangeFrameNotification
             object:nil];

    NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
    // this method is called when the module is being unloaded
    // typically this is during shutdown. make sure you don't do too
    // much processing here or the app will be quit forceably
    
    // you *must* call the superclass
    [super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
    // release any resources that have been retained by the module
    [super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
    // optionally release any resources that can be dynamically
    // reloaded once memory is available - such as caches
    [super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
    if (count == 1 && [type isEqualToString:@"my_event"])
    {
        // the first (of potentially many) listener is being added 
        // for event named 'my_event'
    }
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
    if (count == 0 && [type isEqualToString:@"my_event"])
    {
        // the last listener called for event named 'my_event' has
        // been removed, we can optionally clean up any resources
        // since no body is listening at this point for that event
    }
}

#pragma mark Internal APIs

-(void)keyboardWillShow:(NSNotification *)aNotification
{
    NSDictionary * userInfo = [aNotification userInfo];

    // Get height of keyboard
    CGRect keyboardEndFrame;
    [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&keyboardEndFrame];
    NSNumber * keyboardHeight = [NSNumber numberWithFloat:keyboardEndFrame.size.height];
    NSNumber * keyboardWidth = [NSNumber numberWithFloat:keyboardEndFrame.size.width];

    NSMutableDictionary * event = [NSMutableDictionary dictionary];

    [event setValue:keyboardHeight
             forKey:@"keyboardHeight"];

    [event setValue:keyboardWidth
             forKey:@"keyboardWidth"];

    [self fireEvent:@"keyboardshow"
         withObject:event];
}

-(void)keyboardWillChange:(NSNotification *)aNotification
{
    NSDictionary * userInfo = [aNotification userInfo];

    // Get height of keyboard
    CGRect keyboardEndFrame;
    [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&keyboardEndFrame];

    NSNumber * keyboardHeight = [NSNumber numberWithFloat:keyboardEndFrame.size.height];
    NSNumber * keyboardWidth = [NSNumber numberWithFloat:keyboardEndFrame.size.width];

    NSMutableDictionary * event = [NSMutableDictionary dictionary];

    [event setValue:keyboardHeight
             forKey:@"keyboardHeight"];

    [event setValue:keyboardWidth
             forKey:@"keyboardWidth"];

    [self fireEvent:@"keyboardchange"
         withObject:event];
}

-(void)keyboardWillHide:(NSNotification *)aNotification
{
    NSMutableDictionary * event = [NSMutableDictionary dictionary];

    [event setValue:0
             forKey:@"keyboardHeight"];

    [event setValue:0
             forKey:@"keyboardWidth"];

    [self fireEvent:@"keyboardhide"
         withObject:event];
}

#pragma Public APIs

+ (UIScrollViewKeyboardDismissMode)keyboardDismissModeFrom:(NSString *)name
{

    ENSURE_TYPE_OR_NIL(name, NSString);

    if (name == nil)
    {
        name = @"none";
    }
    else
    {
        name = [name lowercaseString];
    }

    NSLog(@"[ERROR] Dismiss mode name NOW is %s", name);

    if ([name isEqualToString:@"none"])
    {
        return UIScrollViewKeyboardDismissModeNone;
    }
    else if ([name isEqualToString:@"ondrag"])
    {
        return UIScrollViewKeyboardDismissModeOnDrag;
    }
    else if ([name isEqualToString:@"interactive"])
    {
        return UIScrollViewKeyboardDismissModeInteractive;
    }
    else {
        return UIScrollViewKeyboardDismissModeNone;
    }
}

@end

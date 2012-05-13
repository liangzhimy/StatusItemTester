//
//  StatusItem.m
//  StatusItemTester
//
//  Created by John Winter on 11/05/12.
//  Copyright 2010 Aptonic Software. All rights reserved.
//

#import "StatusItem.h"

@implementation StatusItem

- (void)awakeFromNib
{
    statusItem = [[[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength] retain];
    StatusItemView *statusItemView = [[StatusItemView alloc] initWithFrame:NSMakeRect(0, 0, 26, 16)];

    [statusItemView setStatusItem:statusItem];
    [statusItem setView:statusItemView];

    [statusItemView release];
}

- (void)updateStatusImage:(NSString *)imagePath
{
    NSImage *statusItemImage = [[NSImage alloc] initWithContentsOfFile:imagePath];
    [(StatusItemView *)[statusItem view] setStatusImage:statusItemImage];
    [[statusItem view] setNeedsDisplay:YES];
    [statusItemImage release];
}

@end

//
//  StatusItemView.m
//  StatusItemTester
//
//  Created by John Winter on 11/05/12.
//  Copyright 2010 Aptonic Software. All rights reserved.
//

#import "StatusItemView.h"

@implementation StatusItemView

@synthesize statusImage, statusItem;

- (StatusItemView *)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        self.statusImage = [NSImage imageNamed:@"statusitem"];
    }
    return self;
}

- (void)drawRect:(NSRect)rect 
{
    [statusImage drawAtPoint:NSMakePoint(3, 3) fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0];
}

- (void)mouseDown:(NSEvent *)event
{
    [NSApp activateIgnoringOtherApps:YES];
}
@end

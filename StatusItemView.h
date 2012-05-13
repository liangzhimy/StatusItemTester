//
//  StatusItemView.h
//  StatusItemTester
//
//  Created by John Winter on 11/05/12.
//  Copyright 2010 Aptonic Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface StatusItemView : NSView <NSMenuDelegate> {
	NSImage *statusImage;
	NSStatusItem *statusItem;
}

@property (retain) NSImage *statusImage;
@property (retain) NSStatusItem *statusItem;

@end

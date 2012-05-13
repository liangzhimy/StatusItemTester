//
//  StatusItem.h
//  StatusItemTester
//
//  Created by John Winter on 11/05/12.
//  Copyright 2010 Aptonic Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "StatusItemView.h"

@interface StatusItem : NSObject {
	NSStatusItem *statusItem;
}

- (void)updateStatusImage:(NSString *)imagePath;

@end

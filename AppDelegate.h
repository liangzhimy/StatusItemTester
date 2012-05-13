//
//  AppDelegate.h
//  StatusItemTester
//
//  Created by John Winter on 11/05/12.
//  Copyright (c) 2012 Aptonic Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "UKKQueue.h"
#import "GHNSString+TimeInterval.h"
#import "StatusItem.h"

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    NSMutableArray *monitorPaths;
    IBOutlet StatusItem *statusItem;
    IBOutlet NSTextField *monitoringLabel;
    IBOutlet NSTextField *lastUpdatedLabel;
    IBOutlet NSWindow *window;
    NSDate *lastUpdateTime;
    NSTimer *timeAgoTimer;
}

@property (assign) IBOutlet NSWindow *window;
@property (retain) NSMutableArray *monitorPaths;
@property (retain) NSDate *lastUpdateTime;
@property (retain) NSTimer *timeAgoTimer;


- (void)setupMonitor:(NSString *)filePath;

@end

//
//  AppDelegate.m
//  StatusItemTester
//
//  Created by John Winter on 11/05/12.
//  Copyright (c) 2012 Aptonic Software. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window, monitorPaths, lastUpdateTime, timeAgoTimer;

- (id)init
{
    self = [super init];
    if (self) {
        monitorPaths = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)applicationDidFinishLaunching:(NSNotification *)notification
{
    [self.window center];
}

- (void)setupMonitor:(NSString *)filePath
{
    [self.monitorPaths removeAllObjects];
    [self.monitorPaths addObject:filePath];
    [monitoringLabel setStringValue:filePath];
    [statusItem updateStatusImage:[[self monitorPaths] objectAtIndex:0]];
    
    self.lastUpdateTime = [NSDate date];
    [self updateTimeLabel];
    [lastUpdatedLabel setTextColor:[NSColor redColor]];
    
    [self.timeAgoTimer invalidate];
    self.timeAgoTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                         target:self 
                                                       selector:@selector(updateTimeLabel) 
                                                       userInfo:nil
                                                        repeats:YES];
    
    [self stopEventBasedMonitoring];
    [self applyForFileChangeNotifications];
}

- (void)applyForFileChangeNotifications
{
    for (NSString *path in [self monitorPaths])
        [[UKKQueue sharedFileWatcher] addPath:path];

    [[UKKQueue sharedFileWatcher] setDelegate:self];
}

- (void)stopEventBasedMonitoring
{
    for (NSString *path in [self monitorPaths]) {
        [[UKKQueue sharedFileWatcher] removePathFromQueue:path];
    }
}

- (void)updateTimeLabel
{
    NSDate *localDate = [NSDate date];
    [lastUpdatedLabel setStringValue:[@"Updated " stringByAppendingString:
                                      [[NSString gh_stringForTimeInterval:[localDate timeIntervalSinceDate:self.lastUpdateTime] includeSeconds:NO] 
                                       stringByAppendingString:@" ago"]]];
    
    [lastUpdatedLabel setTextColor:[NSColor controlTextColor]];
}

- (void)watcher:(id<UKFileWatcher>)watcher receivedNotification:(NSString *)notification forPath:(NSString *)path
{	
    [statusItem updateStatusImage:[[self monitorPaths] objectAtIndex:0]];
    [self updateTimeLabel];
    
    NSDate *localDate = [NSDate date];
    self.lastUpdateTime = localDate;
    [lastUpdatedLabel setTextColor:[NSColor redColor]];
    
    [self stopEventBasedMonitoring];
    [self applyForFileChangeNotifications];
}

- (void)windowWillClose:(NSNotification *)aNotification
{
    [NSApp terminate:nil];
}

- (void)dealloc
{
    [self stopEventBasedMonitoring];
    [super dealloc];
}

@end

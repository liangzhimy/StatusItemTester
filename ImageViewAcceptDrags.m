//
//  ImageViewAcceptDrags.m
//  StatusItemTester
//
//  Created by John Winter on 11/05/12.
//  Copyright (c) 2012 Aptonic Software. All rights reserved.
//

#import "ImageViewAcceptDrags.h"

@implementation ImageViewAcceptDrags

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *draggedTypeArray = [[NSArray alloc] initWithObjects:NSFilenamesPboardType, NSStringPboardType, 
                                     NSFilesPromisePboardType, NSTIFFPboardType, nil];
        
        [self registerForDraggedTypes:draggedTypeArray];
    }
    
    return self;
}

/* Drag and Drop */

- (NSDragOperation)draggingEntered:(id <NSDraggingInfo>)sender
{
    return NSDragOperationCopy;
}

- (NSDragOperation)draggingUpdated:(id <NSDraggingInfo>)theEvent
{
    return NSDragOperationCopy;
}

- (void)draggingExited:(id <NSDraggingInfo>)sender {}

- (BOOL)prepareForDragOperation:(id <NSDraggingInfo>)sender
{
    return YES;
}

- (BOOL)performDragOperation:(id <NSDraggingInfo>)sender
{
    NSPasteboard *pasteBoard = [sender draggingPasteboard];
    NSArray *arguments = [[pasteBoard stringForType:@"NSFilenamesPboardType"] propertyList];
    [[NSApp delegate] setupMonitor:[arguments objectAtIndex:0]];
    return YES;
}

- (void)concludeDragOperation:(id < NSDraggingInfo >)sender { }


@end

//
// Created by Jan Schulte on 14/06/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import "TTDTaskEditorViewController.h"
#import "TTDTaskEditorDelegate.h"
#import "TTDIssue.h"


@implementation TTDTaskEditorViewController

-(id) init {
    self = [super initWithNibName:@"TTDTaskEditorView" bundle:nil];
    return self;
}

- (IBAction)saveTask:(id)sender {
    [[self delegate] taskEditor:self didSaveTask: self.currentIssue];
}

- (IBAction)discardTask:(id)sender {
    [[self delegate] taskEditor:self didSaveTask:nil];
}

#pragma mark - TextView delegates

/*
From https://developer.apple.com/library/mac/qa/qa1454/_index.html

This allows normal returns in multi line text fields without pressing an additional modifier key
*/
- (BOOL)control:(NSControl*)control textView:(NSTextView*)textView doCommandBySelector:(SEL)commandSelector
{
    BOOL result = NO;

    if (commandSelector == @selector(insertNewline:))
    {
        // new line action:
        // always insert a line-break character and don’t cause the receiver to end editing
        [textView insertNewlineIgnoringFieldEditor:self];
        result = YES;
    }
    else if (commandSelector == @selector(insertTab:))
    {
        // tab action:
        // always insert a tab character and don’t cause the receiver to end editing
        [textView insertTabIgnoringFieldEditor:self];
        result = YES;
    }

    return result;
}


@end

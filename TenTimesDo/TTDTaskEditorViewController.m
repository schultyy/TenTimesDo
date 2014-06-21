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


@end

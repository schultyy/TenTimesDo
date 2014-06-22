//
// Created by Jan Schulte on 23/06/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import "TTDProjectEditorViewController.h"
#import "TTDProjectEditorDelegate.h"


@implementation TTDProjectEditorViewController

-(id) init {
    self = [super initWithNibName:@"TTDProjectEditorView" bundle:nil];
    return self;
}

-(IBAction) saveProject: (id) sender {
    [[self delegate] projectEditor:self saveProject:self.currentProject];
}

-(IBAction) discardProject: (id) sender {
    [[self delegate] projectEditor:self discardProject:self.currentProject];
}

@end

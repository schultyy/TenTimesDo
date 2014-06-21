//
// Created by Jan Schulte on 14/06/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TTDTaskEditorViewController;
@class TTDIssue;

@protocol TTDTaskEditorDelegate <NSObject>

-(void) taskEditor: (TTDTaskEditorViewController *) editor didSaveTask: (TTDIssue *) task;

@end

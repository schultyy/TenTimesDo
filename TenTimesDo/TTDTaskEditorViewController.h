//
// Created by Jan Schulte on 14/06/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TTDTaskEditorDelegate;
@class TTDIssue;


@interface TTDTaskEditorViewController : NSViewController

@property (retain) TTDIssue *currentIssue;

@property (assign) NSObject<TTDTaskEditorDelegate> *delegate;

-(IBAction) saveTask:(id) sender;
-(IBAction) discardTask:(id) sender;
@end

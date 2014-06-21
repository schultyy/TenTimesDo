//
// Created by Jan Schulte on 14/06/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TTDTaskEditorDelegate;


@interface TTDTaskEditorViewController : NSViewController

@property (retain) NSManagedObject *currentIssue;

@property (assign) NSObject<TTDTaskEditorDelegate> *delegate;

-(IBAction) saveTask:(id) sender;
-(IBAction) discardTask:(id) sender;
@end

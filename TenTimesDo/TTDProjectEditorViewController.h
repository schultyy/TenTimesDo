//
// Created by Jan Schulte on 23/06/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TTDProjectEditorDelegate;


@interface TTDProjectEditorViewController : NSViewController

@property (assign) NSManagedObject *currentProject;

@property (assign) NSObject<TTDProjectEditorDelegate> *delegate;

-(IBAction) saveProject: (id) sender;
-(IBAction) discardProject: (id) sender;

@end

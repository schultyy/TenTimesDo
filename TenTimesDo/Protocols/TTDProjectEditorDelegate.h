//
// Created by Jan Schulte on 23/06/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TTDProjectEditorViewController;

@protocol TTDProjectEditorDelegate <NSObject>

-(void) projectEditor: (TTDProjectEditorViewController *) editor saveProject: (NSManagedObject *) project;
-(void) projectEditor: (TTDProjectEditorViewController *) editor discardProject: (NSManagedObject *) project;

@end

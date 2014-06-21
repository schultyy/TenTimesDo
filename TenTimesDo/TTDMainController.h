//
// Created by Jan Schulte on 14/06/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TTDTaskListViewController;
@class TTDTaskEditorViewController;


@interface TTDMainController : NSWindowController

@property (retain) TTDTaskListViewController *taskListController;

@property (retain) TTDTaskEditorViewController *taskEditorController;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property IBOutlet NSBox *mainView;

-(id) initWithManagedObjectContext: (NSManagedObjectContext *) context;

-(void) createNewTask;

-(void) showTaskList;

@end

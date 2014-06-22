//
// Created by Jan Schulte on 14/06/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TTDTaskListViewController;
@class TTDTaskEditorViewController;
@class TTDProjectEditorViewController;


@interface TTDMainController : NSWindowController

@property (retain) TTDTaskListViewController *taskListController;

@property (retain) TTDTaskEditorViewController *taskEditorController;

@property (retain) TTDProjectEditorViewController *projectEditorController;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property IBOutlet NSBox *mainView;

-(id) initWithManagedObjectContext: (NSManagedObjectContext *) context;

-(void) showTaskList;

-(void) createNewTask;

-(void) createProject;

-(void) markAsDone;

-(void) showAllIssues;

-(void) showUnresolvedIssues;

@end

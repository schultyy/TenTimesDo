//
// Created by Jan Schulte on 14/06/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import "TTDMainController.h"
#import "TTDTaskEditorDelegate.h"
#import "TTDTaskListViewController.h"
#import "TTDTaskEditorViewController.h"
#import "TTDTaskListDelegate.h"


@interface TTDMainController()<TTDTaskEditorDelegate, TTDTaskListDelegate>
@end

@implementation TTDMainController

- (id)initWithManagedObjectContext:(NSManagedObjectContext *)context {
    self = [super initWithWindowNibName:@"TTDMainWindow"];
    if(self){
        [self setManagedObjectContext: context];
        [self setTaskListController:[[TTDTaskListViewController alloc] initWitHManagedObjectContext:self.managedObjectContext]];
        [self setTaskEditorController:[[TTDTaskEditorViewController alloc] init]];

        [[self taskListController] setDelegate:self];
        [[self taskEditorController] setDelegate:self];
    }
    return self;
}

-(void)windowDidLoad {

}

-(void)awakeFromNib {
    [self showTaskList];
}

- (void) showTaskEditor {
    [[self mainView] setContentView:self.taskEditorController.view];
}

- (void)showTaskList {
    [[self mainView] setContentView: self.taskListController.view];
}

#pragma mark - Issue actions

- (void)createNewTask {
    id newIssue = [NSEntityDescription insertNewObjectForEntityForName:@"Issue"
                                                inManagedObjectContext:self.managedObjectContext];
    [[self taskEditorController] setCurrentIssue:newIssue];
    [self showTaskEditor];
}

-(void)markAsDone {
    NSManagedObject *selectedIssue = [[self taskListController] selectedIssue];
    if(selectedIssue) {
        [selectedIssue setValue:[NSNumber numberWithBool:YES]
                         forKey:@"isDone"];
    }
    [self saveChanges];
}

#pragma mark - ManagedObjectContext

-(void) saveChanges {
    NSError *error = nil;
    [[self managedObjectContext] save: &error];
    if(error) {
        NSAlert *alert = [[NSAlert alloc] init];
        [alert addButtonWithTitle:@"Ok"];
        [alert setMessageText:@"Failed to save changes"];

        NSString *errorText = [NSString stringWithFormat:@"NSWarningAlertStyle \r %@", [error localizedDescription]];

        [alert setInformativeText:errorText];
        [alert setAlertStyle:NSWarningAlertStyle];
        [alert beginSheetModalForWindow:[self window] modalDelegate:self didEndSelector:NULL contextInfo:nil];
    }
}

#pragma mark - TTDTaskListDelegate

-(void)taskList:(TTDTaskListViewController *)controller didSelectIssue:(NSManagedObject *)issue {
    [[self taskEditorController] setCurrentIssue:issue];
    [self showTaskEditor];
}

#pragma mark - TTDTaskEditorDelegate

-(void) taskEditor: (TTDTaskEditorViewController *) editor didSaveTask: (NSManagedObject *) task {
    if(task) {
        
    }
    [self showTaskList];
}

@end

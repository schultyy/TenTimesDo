//
// Created by Jan Schulte on 14/06/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import "TTDMainController.h"
#import "TTDTaskEditorDelegate.h"
#import "TTDTaskListViewController.h"
#import "TTDTaskEditorViewController.h"
#import "TTDTaskListDelegate.h"
#import "TTDIssue.h"
#import "Underscore.h"
#import "TTDProjectEditorViewController.h"
#import "TTDProjectEditorDelegate.h"


@interface TTDMainController()<TTDTaskEditorDelegate, TTDTaskListDelegate, TTDProjectEditorDelegate>
@end

@implementation TTDMainController

- (id)initWithManagedObjectContext:(NSManagedObjectContext *)context {
    self = [super initWithWindowNibName:@"TTDMainWindow"];
    if(self){
        [self setManagedObjectContext: context];
        [self setTaskListController:[[TTDTaskListViewController alloc] initWitHManagedObjectContext:self.managedObjectContext]];
        [self setTaskEditorController:[[TTDTaskEditorViewController alloc] init]];
        [self setProjectEditorController:[[TTDProjectEditorViewController alloc] init]];

        [[self taskListController] setDelegate:self];
        [[self taskEditorController] setDelegate:self];
        [[self projectEditorController] setDelegate:self];
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
    [[self taskListController] invalidate];
    [[self mainView] setContentView: self.taskListController.view];
}

-(void) showProjectEditor {
    [[self mainView] setContentView:self.projectEditorController.view];
}

-(void) showAllIssues {
    [[self taskListController] showAll];
}

-(void) showUnresolvedIssues {
    [[self taskListController] showUnresolved];
}

# pragma mark - Project actions

-(void) createProject {
    id newProject = [NSEntityDescription insertNewObjectForEntityForName:@"TTDProject"
                                                  inManagedObjectContext:self.managedObjectContext];
    [[self projectEditorController] setCurrentProject:newProject];
    [self showProjectEditor];
}

#pragma mark - Issue actions

- (void)createNewTask {
    id newIssue = [NSEntityDescription insertNewObjectForEntityForName:@"TTDIssue"
                                                inManagedObjectContext:self.managedObjectContext];
    [[self taskEditorController] setCurrentIssue:newIssue];
    [self showTaskEditor];
}

-(void)markAsDone {
    TTDIssue *selectedIssue = [[self taskListController] selectedIssue];
    if(selectedIssue) {
        [selectedIssue markAsDone];
        [self saveChanges];
        [[self taskListController] invalidate];
    }
}

#pragma mark - ManagedObjectContext

-(BOOL) saveChanges {
    NSError *error = nil;
    [[self managedObjectContext] save: &error];

    if(error) {

        NSArray *detailedErrors = [[error userInfo] valueForKey: NSDetailedErrorsKey];

        NSString *errorText = [Underscore.arrayMap(detailedErrors, ^(NSError *err) {
            return [err localizedDescription];
        }) componentsJoinedByString:@"\n"];

        NSAlert *alert = [[NSAlert alloc] init];
        [alert addButtonWithTitle:@"Ok"];
        [alert setMessageText:@"Failed to save changes"];

        [alert setInformativeText:errorText];
        [alert setAlertStyle:NSWarningAlertStyle];
        [alert beginSheetModalForWindow:[self window] modalDelegate:self didEndSelector:NULL contextInfo:nil];
        return NO;
    }
    else {
        return YES;
    }
}

#pragma mark - TTDProjectEditorDelegate

-(void)projectEditor:(TTDProjectEditorViewController *)editor saveProject:(NSManagedObject *)project {
    if(self.saveChanges) {
        [self showTaskList];
    }
}

-(void)projectEditor:(TTDProjectEditorViewController *)editor discardProject:(NSManagedObject *)project {
    [[self managedObjectContext] rollback];
    [self showTaskList];
}

#pragma mark - TTDTaskListDelegate

-(void)taskList:(TTDTaskListViewController *)controller didSelectIssue:(TTDIssue *)issue {
    [[self taskEditorController] setCurrentIssue:issue];
    [self showTaskEditor];
}

#pragma mark - TTDTaskEditorDelegate

-(void) taskEditor: (TTDTaskEditorViewController *) editor saveTask: (TTDIssue *) task {
    if(self.saveChanges) {
        [self showTaskList];
    }
}
-(void) taskEditor: (TTDTaskEditorViewController *) editor discardTask: (TTDIssue *) task {
    [[self managedObjectContext] rollback];
    [self showTaskList];
}

@end

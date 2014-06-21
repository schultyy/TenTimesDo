//
// Created by Jan Schulte on 14/06/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import "TTDMainController.h"
#import "TTDTaskEditorDelegate.h"
#import "TTDTaskListViewController.h"
#import "TTDTaskEditorViewController.h"


@interface TTDMainController()<TTDTaskEditorDelegate>
@end

@implementation TTDMainController

- (id)initWithManagedObjectContext:(NSManagedObjectContext *)context {
    self = [super initWithWindowNibName:@"TTDMainWindow"];
    if(self){
        [self setManagedObjectContext: context];
        [self setTaskListController:[[TTDTaskListViewController alloc] initWitHManagedObjectContext:self.managedObjectContext]];
        [self setTaskEditorController:[[TTDTaskEditorViewController alloc] init]];
        [[self taskEditorController] setDelegate:self];
    }
    return self;
}

-(void)windowDidLoad {

}

-(void)awakeFromNib {
    [self showTaskList];
}

- (void)createNewTask {
    id newIssue = [NSEntityDescription insertNewObjectForEntityForName:@"Issue"
                                                inManagedObjectContext:self.managedObjectContext];
    [[self taskEditorController] setCurrentIssue:newIssue];
    [[self mainView] setContentView:self.taskEditorController.view];
}

- (void)showTaskList {
    [[self mainView] setContentView: self.taskListController.view];
}


#pragma mark - TTDTaskEditorDelegate

-(void) taskEditor: (TTDTaskEditorViewController *) editor didSaveTask: (NSManagedObject *) task {
    if(task) {
        
    }
    [self showTaskList];
}

@end

//
// Created by Jan Schulte on 14/06/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import "TTDMainController.h"
#import "TTDTaskEditorDelegate.h"
#import "TTDTaskListViewController.h"
#import "TTDTaskEditorViewController.h"


@interface TTDMainController(TTDTaskEditorDelegate)
@end

@implementation TTDMainController

-(id) init {
    self = [super initWithWindowNibName:@"TTDMainWindow"];
    if(self){
        [self setTaskListController:[[TTDTaskListViewController alloc] init]];
        [self setTaskEditorController:[[TTDTaskEditorViewController alloc] init]];
        [[self taskEditorController] setDelegate:self];
    }
    return self;
}

-(void)windowDidLoad {

}

- (void)createNewTask {
    [[self mainView] setContentView:self.taskEditorController.view];
}

- (void)showTaskList {
    [[self mainView] setContentView: self.taskListController.view];
}


#pragma mark - TTDTaskEditorDelegate

-(void) taskEditor: (TTDTaskEditorViewController *) editor didSaveTask: (NSManagedObject *) task {
    [self showTaskList];
}

@end

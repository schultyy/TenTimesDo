//
// Created by Jan Schulte on 14/06/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import "TTDMainController.h"
#import "TTDTaskListViewController.h"


@implementation TTDMainController {

}

-(id) init {
    self = [super initWithWindowNibName:@"TTDMainWindow"];
    if(self){
        [self setTaskListController:[[TTDTaskListViewController alloc] init]];
    }
    return self;
}

-(void)windowDidLoad {
    [[self mainView] setContentView: self.taskListController.view];
}

@end

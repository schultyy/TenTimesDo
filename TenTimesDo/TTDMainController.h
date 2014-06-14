//
// Created by Jan Schulte on 14/06/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TTDTaskListViewController;


@interface TTDMainController : NSWindowController

@property (retain) TTDTaskListViewController *taskListController;

@property IBOutlet NSBox *mainView;

@end

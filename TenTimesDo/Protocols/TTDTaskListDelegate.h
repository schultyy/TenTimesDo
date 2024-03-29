//
// Created by Jan Schulte on 21/06/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TTDTaskListViewController;
@class TTDIssue;

@protocol TTDTaskListDelegate <NSObject>

-(void) taskList: (TTDTaskListViewController *) controller didSelectIssue: (TTDIssue *) issue;

@end

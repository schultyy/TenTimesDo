//
// Created by Jan Schulte on 14/06/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import "TTDTaskListViewController.h"
#import "TTDTaskListDelegate.h"


@implementation TTDTaskListViewController

- (id)initWitHManagedObjectContext:(NSManagedObjectContext *)context {
    self = [super initWithNibName:@"TTDTaskListView" bundle:nil];
    if(self) {
        [self setManagedObjectContext:context];
    }
    return self;
}

-(void)awakeFromNib {
    [[self tableView] setDoubleAction:@selector(tableViewDoubleAction:)];
    [[self tableView] setTarget:self];
}

-(void) tableViewDoubleAction: (id) sender {
    NSInteger selectedRow = [[self tableView] selectedRow];
    NSManagedObject *selectedObject = [[[self arrayController] arrangedObjects] objectAtIndex:(NSUInteger) selectedRow];
    [[self delegate] taskList:self didSelectIssue:selectedObject];
}

@end

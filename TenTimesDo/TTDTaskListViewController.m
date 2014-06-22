//
// Created by Jan Schulte on 14/06/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import "TTDTaskListViewController.h"
#import "TTDTaskListDelegate.h"
#import "TTDIssue.h"


@implementation TTDTaskListViewController

- (id)initWitHManagedObjectContext:(NSManagedObjectContext *)context {
    self = [super initWithNibName:@"TTDTaskListView" bundle:nil];
    if(self) {
        [self setManagedObjectContext:context];
        [self showUnresolved];
    }
    return self;
}

-(void)awakeFromNib {
    [[self tableView] setDoubleAction:@selector(tableViewDoubleAction:)];
    [[self tableView] setTarget:self];
}

-(TTDIssue *)selectedIssue {
    NSInteger selectedRow = [[self tableView] selectedRow];
    if(selectedRow == -1) {
        return nil;
    }
    return [[[self arrayController] arrangedObjects] objectAtIndex:(NSUInteger) selectedRow];
}

-(void) showUnresolved {
    [self setFilterPredicate:[NSPredicate predicateWithFormat:@"isDone = %@", [NSNumber numberWithBool:NO]]];
}

-(void) showAll {
    [self setFilterPredicate: nil];
}

#pragma mark - TableView actions

-(void) tableViewDoubleAction: (id) sender {
    TTDIssue *issue = [self selectedIssue];
    if(issue) {
        [[self delegate] taskList:self didSelectIssue: issue];
    }
}

@end

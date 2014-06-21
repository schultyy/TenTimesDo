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

-(NSManagedObject *)selectedIssue {
    NSInteger selectedRow = [[self tableView] selectedRow];
    return [[[self arrayController] arrangedObjects] objectAtIndex:(NSUInteger) selectedRow];
}

#pragma mark - TableView actions

-(void) tableViewDoubleAction: (id) sender {
    [[self delegate] taskList:self didSelectIssue: self.selectedIssue];
}

@end

//
// Created by Jan Schulte on 14/06/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import "TTDTaskListViewController.h"


@implementation TTDTaskListViewController

- (id)initWitHManagedObjectContext:(NSManagedObjectContext *)context {
    self = [super initWithNibName:@"TTDTaskListView" bundle:nil];
    if(self) {
        [self setManagedObjectContext:context];
    }
    return self;
}

@end

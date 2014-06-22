//
// Created by Jan Schulte on 23/06/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import "TTDProjectListViewController.h"


@implementation TTDProjectListViewController
-(id) initWitHManagedObjectContext: (NSManagedObjectContext *) context {
    self = [super initWithNibName:@"TTDProjectListView" bundle:nil];
    if(self) {
        [self setManagedObjectContext:context];
    }
    return self;
}
@end

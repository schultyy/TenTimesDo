//
// Created by Jan Schulte on 14/06/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TTDTaskListDelegate;


@interface TTDTaskListViewController : NSViewController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (assign) NSObject<TTDTaskListDelegate> *delegate;

@property IBOutlet NSTableView *tableView;

@property IBOutlet NSArrayController *arrayController;

-(id) initWitHManagedObjectContext: (NSManagedObjectContext *) context;

-(NSManagedObject *) selectedIssue;

@end

//
// Created by Jan Schulte on 14/06/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TTDTaskListDelegate;
@class TTDIssue;


@interface TTDTaskListViewController : NSViewController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (assign) NSObject<TTDTaskListDelegate> *delegate;

@property (retain) NSPredicate *filterPredicate;

@property IBOutlet NSTableView *tableView;

@property IBOutlet NSArrayController *arrayController;

-(id) initWitHManagedObjectContext: (NSManagedObjectContext *) context;

-(TTDIssue *) selectedIssue;

-(void) showUnresolved;

-(void) showAll;

@end

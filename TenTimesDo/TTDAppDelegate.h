//
//  TTDAppDelegate.h
//  TenTimesDo
//
//  Created by Jan Schulte on 14/06/14.
//  Copyright (c) 2014 schultyy. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class TTDMainController;

@interface TTDAppDelegate : NSObject <NSApplicationDelegate>

@property (strong) TTDMainController *mainController;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

-(IBAction) createNewTask: (id) sender;
-(IBAction) createNewProject: (id) sender;
-(IBAction) markAsDone: (id) sender;
-(IBAction) showAllIssues: (id) sender;
-(IBAction) showUnresolvedIssues: (id) sender;

@end

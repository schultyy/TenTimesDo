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

- (IBAction)saveAction:(id)sender;

@end

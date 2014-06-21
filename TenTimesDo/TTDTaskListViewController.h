//
// Created by Jan Schulte on 14/06/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TTDTaskListViewController : NSViewController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

-(id) initWitHManagedObjectContext: (NSManagedObjectContext *) context;
@end

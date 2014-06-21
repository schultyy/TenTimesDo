//
//  TTDIssue.h
//  TenTimesDo
//
//  Created by Jan Schulte on 21/06/14.
//  Copyright (c) 2014 schultyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface TTDIssue : NSManagedObject

@property (nonatomic, retain) NSString * headline;
@property (nonatomic, retain) NSNumber * isDone;
@property (nonatomic, retain) NSString * text;

-(void) markAsDone;
-(void) markAsNotDone;

@end

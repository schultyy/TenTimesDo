//
//  TTDIssue.m
//  TenTimesDo
//
//  Created by Jan Schulte on 21/06/14.
//  Copyright (c) 2014 schultyy. All rights reserved.
//

#import "TTDIssue.h"


@implementation TTDIssue

@dynamic headline;
@dynamic isDone;
@dynamic text;

-(id)initWithEntity:(NSEntityDescription *)entity insertIntoManagedObjectContext:(NSManagedObjectContext *)context {

    self = [super initWithEntity:entity insertIntoManagedObjectContext:context];
    if(self) {
        [self setHeadline:@""];
        [self setIsDone: [NSNumber numberWithBool:NO]];
        [self setText:@""];
    }
    return self;
}

-(void)markAsDone {
    [self setValue:[NSNumber numberWithBool:YES]
                     forKey:@"isDone"];
}

-(void)markAsNotDone {
    [self setValue:[NSNumber numberWithBool:NO]
                     forKey:@"isDone"];
}

@end

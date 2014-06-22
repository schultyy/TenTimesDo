//
// Created by Jan Schulte on 23/06/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface TTDYesNoTransformer : NSValueTransformer
@end



@implementation TTDYesNoTransformer

+ (Class)transformedValueClass {
    return [NSString class];
}

+ (BOOL)allowsReverseTransformation {
    return NO;
}

- (id)transformedValue:(id)value {
    if([value boolValue]) {
        return @"Yes";
    }
    else {
        return @"No";
    }
}

@end

//
//  NSString+Extensions.m
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/15/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import "NSString+Extensions.h"

@implementation NSString (Extensions)

- (NSDictionary *) toDictionary {
    NSError *error;
    NSData *objectData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:objectData options:NSJSONReadingMutableContainers error:&error];
    return (error ? nil : json);
}

-(BOOL)isValid {
    if (self && [self length] > 0) {
        return YES;
    }
    return NO;
}


@end

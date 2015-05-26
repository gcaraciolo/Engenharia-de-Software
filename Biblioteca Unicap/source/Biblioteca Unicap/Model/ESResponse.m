//
//  ESResponse.m
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/17/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import "ESResponse.h"

@implementation ESResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"statusCode": @"codResp"
             };
}

@end

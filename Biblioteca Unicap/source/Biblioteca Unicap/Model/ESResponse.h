//
//  ESResponse.h
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/17/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle.h>

@interface ESResponse : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSString *statusCode;

@end


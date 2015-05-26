//
//  ESError.h
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/17/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ESError : NSError

@property (nonatomic) NSInteger networkingError;
@property (strong, nonatomic) NSError *error;

@end

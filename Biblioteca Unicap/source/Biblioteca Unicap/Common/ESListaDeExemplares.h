//
//  ESListaDeExemplares.h
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/15/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ESListaDeExemplares : NSObject

+(instancetype) sharedInstance;

@property (strong, nonatomic) NSArray *exemplares;

@end

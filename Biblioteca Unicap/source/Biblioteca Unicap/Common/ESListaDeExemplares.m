//
//  ESListaDeExemplares.m
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/15/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import "ESListaDeExemplares.h"

@implementation ESListaDeExemplares

+(instancetype) sharedInstance {
    static ESListaDeExemplares * instance;
    @synchronized(self) {
        if ( ! instance )
            instance = [[ESListaDeExemplares alloc] init];
    }
    return instance;
}



@end

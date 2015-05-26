//
//  ESLivroUtility.m
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/9/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import "ESLivroUtility.h"

@interface ESLivroUtility ()

@end

@implementation ESLivroUtility

+(ESLivroUtility *) sharedInstance {
    static ESLivroUtility * livro;
    @synchronized(self) {
        if ( ! livro )
            livro = [[ESLivroUtility alloc] init];
    }
    return livro;
}


@end

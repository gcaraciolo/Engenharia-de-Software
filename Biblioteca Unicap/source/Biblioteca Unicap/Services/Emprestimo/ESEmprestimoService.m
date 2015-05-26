//
//  ESEmprestimoService.m
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 4/29/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import "ESEmprestimoService.h"
#import "ESUtils.h"

@implementation ESEmprestimoService


+(ESEmprestimoService *) sharedInstance {
    static ESEmprestimoService * emprestimoService;
    @synchronized(self) {
        if ( ! emprestimoService )
           emprestimoService = [[ESEmprestimoService alloc] init];
    }   
    return emprestimoService; 
    
}
@end

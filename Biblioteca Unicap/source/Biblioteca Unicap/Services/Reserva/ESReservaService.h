//
//  ESReservaService.h
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/8/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ESBaseService.h"
#import "ESUsuario.h"

@interface ESReservaService : ESBaseService

+(instancetype) sharedInstance;
- (void) doReservaWithCodigoAcervo:(NSString *)codigoAcervo
                           usuario:(ESUsuario *)usuario
                      completition:(void (^)(BOOL))completition
                           failure:(void (^)(ESError *))failure;

@end

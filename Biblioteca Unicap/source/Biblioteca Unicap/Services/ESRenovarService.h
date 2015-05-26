//
//  ESRenovarService.h
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/15/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ESUsuario.h"
#import "ESRenovacao.h"

@interface ESRenovarService : NSObject

+(instancetype) sharedInstance;

- (void) doRenovacaoWithCodigoAcervo:(NSString *)codigoAcervo
                             usuario:(ESUsuario *)usuario
                        completition:(void (^)(ESRenovacao *))completition
                             failure:(void (^)(NSError *))failure;

@end

//
//  ESDadosDoAcervoService.h
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/8/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ESBaseService.h"
#import "ESLivroDetalhe.h"

@interface ESDadosDoAcervoService : ESBaseService

+(instancetype) sharedInstance;

- (void) getDetalhesWithNumeroAcervo:(NSString *)numeroAcervo
                        completition:(void (^)(ESLivroDetalhe *))completion
                             failure:(void (^)(NSError *))failure;

@end

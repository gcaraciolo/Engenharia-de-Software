//
//  ESReservaService.m
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/8/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import "ESReservaService.h"

@implementation ESReservaService

+(ESReservaService *) sharedInstance {
    static ESReservaService * reservaService;
    @synchronized(self) {
        if ( ! reservaService )
            reservaService = [[ESReservaService alloc] init];
    }
    return reservaService;
}


- (void) doReservaWithCodigoAcervo:(NSString *)codigoAcervo
                             usuario:(ESUsuario *)usuario
                        completition:(void (^)(BOOL))completition
                             failure:(void (^)(ESError *))failure {
 
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setValue:@"6" forKey:@"t"];
    [params setValue:usuario.numMatricula forKey:@"m"];
    [params setValue:usuario.senha forKey:@"s"];
    [params setValue:codigoAcervo forKey:@"q"];
    
    [ESBaseService
     doPostRequestWithParams:params
                     success:^(id responseObject) {
                         completition(YES);
                   } failure:^(ESError *error) {
                       failure(error);
    }];
    
    
}

@end

//
//  ESLoginService.m
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/15/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import "ESLoginService.h"
#import "ESUsuario.h"
#import "ESItensPendentes.h"
#import "ESItensReservados.h"


@implementation ESLoginService

+(ESLoginService *) sharedInstance {
    static ESLoginService * loginService;
    @synchronized(self) {
        if ( ! loginService )
            loginService = [[ESLoginService alloc] init];
    }
    return loginService;
}

- (void) doLoginWithMatricula:(NSString *)matricula
                        senha:(NSString *)senha
                 completition:(void (^)(ESUsuario *))completition
                      failure:(void (^)(ESError *))failure {
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setValue:@"4" forKey:@"t"];
    [params setValue:matricula forKey:@"m"];
    [params setValue:senha forKey:@"s"];
    
    [ESBaseService doPostRequestWithParams:params
                                   success:^(id responseObject) {
                                       completition([self toUsuario:responseObject]);
                                   } failure:^(ESError *error) {
                                       failure(error);
                                   }];
}



-(ESUsuario *)toUsuario:(id)responseObject {
    ESUsuario *usuario = [MTLJSONAdapter modelOfClass:[ESUsuario class]
                                   fromJSONDictionary:responseObject
                                                error:nil];
    
    return usuario;
}


@end

//
//  ESRenovarService.m
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/15/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import "ESRenovarService.h"
#import "ESBaseService.h"
#import "ESServerStatus.h"
#import "ESResponse.h"
#import "ESError.h"

@implementation ESRenovarService

+(instancetype) sharedInstance {
    static ESRenovarService * renovarService;
    @synchronized(self) {
        if ( ! renovarService )
            renovarService = [[ESRenovarService alloc] init];
    }
    return renovarService;
}

- (void) doRenovacaoWithCodigoAcervo:(NSString *)codigoAcervo
                             usuario:(ESUsuario *)usuario
                        completition:(void (^)(ESRenovacao *))completition
                             failure:(void (^)(NSError *))failure {
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setValue:@"5" forKey:@"t"];
    [params setValue:usuario.numMatricula forKey:@"m"];
    [params setValue:codigoAcervo forKey:@"q"];
    [params setValue:usuario.codCookie forKey:@"c"];
    
    
    [ESBaseService
     doPostRequestWithParams:params
                     success:^(id responseObject) {
                       [self checkResponse:responseObject
                                completion:^{
                                    
                           ESRenovacao *renovacaoResponse =
                                    [MTLJSONAdapter modelOfClass:[ESRenovacao class]
                                              fromJSONDictionary:responseObject
                                                           error:nil];
                                    completition(renovacaoResponse);
                       } failure:^(ESError *error) {
                           failure(error);
                       }];
                  } failure:^(NSError *error) {
                      failure(error);
    }];
    
}

-(void)checkResponse:(id)responseObject completion:(void (^)(void))completition failure:(void (^)(ESError *))failure{
    ESResponse *response = [MTLJSONAdapter modelOfClass:[ESResponse class]
                                     fromJSONDictionary:responseObject
                                                  error:nil];
    if ([response.statusCode isEqualToString:@"1"]) {
        completition();
    } else {
        failure(nil);
    }
}


@end

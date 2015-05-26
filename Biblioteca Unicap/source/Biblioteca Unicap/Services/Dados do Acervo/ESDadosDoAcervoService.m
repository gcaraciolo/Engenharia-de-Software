//
//  ESDadosDoAcervoService.m
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/8/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import "ESDadosDoAcervoService.h"
#import "ESUtils.h"
#import "ESLivroDetalhe.h"

@implementation ESDadosDoAcervoService

+(ESDadosDoAcervoService *) sharedInstance {
    static ESDadosDoAcervoService * dadosDoAcervoService;
    @synchronized(self) {
        if ( ! dadosDoAcervoService )
            dadosDoAcervoService = [[ESDadosDoAcervoService alloc] init];
    }
    return dadosDoAcervoService;
}

- (void) getDetalhesWithNumeroAcervo:(NSString *)numeroAcervo
        completition:(void (^)(ESLivroDetalhe *))completion
             failure:(void (^)(NSError *))failure {

        NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
        [params setValue:@"3" forKey:@"t"];
        [params setValue:numeroAcervo forKey:@"q"];

        [ESBaseService doPostRequestWithParams:params
                                      success:^(id responseObject) {
                                          ESLivroDetalhe * livroDetalhe = [MTLJSONAdapter modelOfClass:[ESLivroDetalhe class]
                                                                                    fromJSONDictionary:responseObject
                                                                                                 error:nil];
                                          completion(livroDetalhe);
                                      } failure:^(NSError * error) {
                                          failure(error);
                                      }];

}

@end

//
//  ESExemplaresService.m
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/8/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import "ESExemplaresService.h"
#import "ESUtils.h"
#import "Mantle.h"


@implementation ESExemplaresService

+(ESExemplaresService *) sharedInstance {
    static ESExemplaresService * exemplaresService;
    @synchronized(self) {
        if ( ! exemplaresService )
            exemplaresService = [[ESExemplaresService alloc] init];
    }
    return exemplaresService;
}


- (void)getExemplaresWithNumeroAcervo:(NSString *)numeroAcervo
                           completion:(void (^)(ESExemplarList *))completion
                              failure:(void (^)(NSError *))failure {
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setValue:@"2" forKey:@"t"];
    [params setValue:numeroAcervo forKey:@"q"];
    
    [ESBaseService doPostRequestWithParams:params
                                  success:^(id responseObject) {
                                      completion([MTLJSONAdapter modelOfClass:[ESExemplarList class]
                                                           fromJSONDictionary:responseObject
                                                                        error:nil]);
                                  } failure:^(NSError * error) {
                                      failure(error);
                                  }];
}

@end

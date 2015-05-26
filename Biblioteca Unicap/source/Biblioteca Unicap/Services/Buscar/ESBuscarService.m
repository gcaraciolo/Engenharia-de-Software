//
//  ESBuscarService.m
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/6/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import "ESBuscarService.h"
#import "ESUtils.h"

@implementation ESBuscarService


+(ESBuscarService *) sharedInstance {
    static ESBuscarService * buscarService;
    @synchronized(self) {
        if ( ! buscarService )
            buscarService = [[ESBuscarService alloc] init];
    }
    return buscarService;
}

- (void) searchBook:(NSString *)titulo
       completition:(void (^)(NSArray *))completition
            failure:(void (^)(NSError *))failure {
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setValue:@"1" forKey:@"t"];
    [params setValue:titulo forKey:@"q"];

    [ESBaseService doPostRequestWithParams:params
                                  success:^(id responseObject) {
                                      completition([self toArray:responseObject fromKey:@"itens"]);
                                } failure:^(NSError * error) {
                                    failure(error);
                                }];
}

- (NSArray *)toArray:(id)responseObject
             fromKey:(NSString *)key {
   
    NSDictionary *dictionary = (NSDictionary *)responseObject;
    NSArray *items  = [dictionary objectForKey:key];
    
    NSMutableArray *allBooksReturned = [[NSMutableArray alloc] init];
    if (items) {
        [items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            ESLivro *livro = [MTLJSONAdapter modelOfClass:[ESLivro class] fromJSONDictionary:obj error:nil];
            if (livro) {
                [allBooksReturned addObject:livro];
            }
        }];
    }
    
    return allBooksReturned;
}


@end

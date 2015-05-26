//
//  ESExemplaresService.h
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/8/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ESBaseService.h"
#import "ESExemplarList.h"

@interface ESExemplaresService : ESBaseService

+(instancetype) sharedInstance;

- (void)getExemplaresWithNumeroAcervo:(NSString *)numeroAcervo
                           completion:(void (^)(ESExemplarList *))completion
                              failure:(void (^)(NSError *))failure;
    
@end

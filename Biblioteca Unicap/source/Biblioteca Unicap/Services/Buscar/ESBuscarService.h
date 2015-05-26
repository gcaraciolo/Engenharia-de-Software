//
//  ESBuscarService.h
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/6/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ESBaseService.h"

@interface ESBuscarService : ESBaseService

+(instancetype) sharedInstance;
- (void) searchBook:(NSString *)titulo
       completition:(void (^)(NSArray *))completition
            failure:(void (^)(NSError *))failure;

@end

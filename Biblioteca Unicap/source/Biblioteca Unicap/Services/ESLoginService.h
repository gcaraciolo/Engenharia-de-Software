//
//  ESLoginService.h
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/15/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ESBaseService.h"
#import "ESUsuario.h"
#import "ESError.h"

@interface ESLoginService : ESBaseService

typedef NS_ENUM(NSInteger, loginStatus) {
    loginStatusException = -1,
    loginStatusFalha,
    loginStatusSucesso
};

+(instancetype) sharedInstance;
- (void) doLoginWithMatricula:(NSString *)matricula
                        senha:(NSString *)senha
                 completition:(void (^)(ESUsuario *))completition
                      failure:(void (^)(ESError *))failure;

@end

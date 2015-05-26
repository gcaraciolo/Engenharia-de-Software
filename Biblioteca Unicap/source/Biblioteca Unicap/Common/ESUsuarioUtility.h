//
//  ESUsuarioUtility.h
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/15/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ESUsuario.h"

@interface ESUsuarioUtility : NSObject

+(instancetype) sharedInstance;
@property (strong, nonatomic) ESUsuario *usuario;
@property (nonatomic) BOOL logged;
-(void)doLogout;
- (BOOL)hasBookAsItemPendente:(NSString *)numAcervo;
@end

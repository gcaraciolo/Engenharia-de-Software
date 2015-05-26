//
//  ESRenovacao.h
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/19/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle.h>

@interface ESRenovacao : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSString *dthDevolucao;

@end

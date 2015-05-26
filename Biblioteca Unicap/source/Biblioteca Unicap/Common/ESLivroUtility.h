//
//  ESLivroUtility.h
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/9/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ESLivro.h"

@interface ESLivroUtility : NSObject

+(instancetype) sharedInstance;

@property (strong, nonatomic) ESLivro *currentLivro;
@property (strong, nonatomic) NSString *numeroAcervo;

@end

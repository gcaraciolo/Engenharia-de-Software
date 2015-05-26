//
//  ESEmprestimosViewController.h
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 4/26/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESBaseNavigationViewController.h"


#define kIDLivroCell @"emprestimoLivroCell"

@interface ESEmprestimosViewController : ESBaseNavigationViewController

@property (strong, nonatomic) NSArray *livros;

@end

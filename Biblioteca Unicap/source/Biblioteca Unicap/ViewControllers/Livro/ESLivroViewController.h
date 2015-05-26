//
//  ESLivroViewController.h
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 4/26/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESBaseNavigationViewController.h"
#import "ESLivro.h"

@interface ESLivroViewController : ESBaseNavigationViewController

@property (strong, nonatomic) ESLivro *livro;

@end

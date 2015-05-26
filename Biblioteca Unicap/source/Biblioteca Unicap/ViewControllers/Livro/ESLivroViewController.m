//
//  ESLivroViewController.m
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 4/26/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import "ESLivroViewController.h"

@interface ESLivroViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblTitulo;

@end

@implementation ESLivroViewController


#pragma mark - 
#pragma mark Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self preencherDados];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 
#pragma mark load

-(void) preencherDados {
    self.lblTitulo.text = self.livro.nomItem;
}



@end

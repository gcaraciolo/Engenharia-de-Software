//
//  ESBaseViewController.m
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 4/26/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import "ESBaseViewController.h"

@interface ESBaseViewController ()

@end

@implementation ESBaseViewController


-(void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"view load %@",[self class]);
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"view apperar %@", [self class]);
}



@end

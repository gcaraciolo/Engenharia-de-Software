//
//  ESBaseViewController.m
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 4/26/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import "ESBaseViewController.h"
#import <MBProgressHUD.h>

@interface ESBaseViewController ()

@end

@implementation ESBaseViewController


-(void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem.image =
    [[UIImage imageNamed:@"IconMenu"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    NSLog(@"view load %@",[self class]);
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"view apperar %@", [self class]);
}


#pragma mark - 
-(void)showHUD {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

-(void)hideHUD {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}


@end

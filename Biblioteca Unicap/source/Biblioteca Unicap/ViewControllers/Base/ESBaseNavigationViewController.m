//
//  ESBaseNavigationViewController.m
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/7/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import "ESBaseNavigationViewController.h"

#warning deprecated

@interface ESBaseNavigationViewController ()

@end

@implementation ESBaseNavigationViewController

#pragma mark -
#pragma mark Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self reloadSettings];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)reloadSettings {
    [self.navigationController.navigationBar
     setBarTintColor:[UIColor colorWithRed:1
                                     green:1
                                      blue:4
                                     alpha:1]];

    [[self.navigationController navigationItem] setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"IconMenu"] style:UIBarButtonItemStylePlain target:self action:nil]];
}

-(void)setBarTitle:(NSString *)title {
    self.navigationItem.title = title;
}



@end

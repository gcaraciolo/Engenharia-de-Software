//
//  ESRootViewController.m
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/23/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import "ESRootViewController.h"
#import "ESBuscarAcervoViewController.h"
#import "ESBaseService.h"

@implementation ESRootViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    self.view.hidden = YES;
    [self checkNetworking];
}

-(void)checkNetworking {    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status != AFNetworkReachabilityStatusNotReachable) {
            ESBuscarAcervoViewController *buscarAcervo =
            [self.storyboard instantiateViewControllerWithIdentifier:@"buscarAcervoViewControllerID"];
            [self.navigationController pushViewController:buscarAcervo animated:NO];
        } else {
            self.view.hidden = NO;
        }
    }];
}

@end

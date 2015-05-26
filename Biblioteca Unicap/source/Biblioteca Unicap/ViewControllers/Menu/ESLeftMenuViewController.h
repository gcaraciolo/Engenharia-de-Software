//
//  ESLeftMenuViewController.h
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 4/26/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RESideMenu.h"

#define kTitleHome @"Home"
#define kTitleBuscarAcervo @"Buscar no acervo"
#define kTitleMeusEmprestimos @"Meus empréstimos"
#define kTitleSobre @"Sobre"
#define kTitleLogin @"Log In"
#define kTitleLogout @"Log Out"
#define kTitleSettings @"Settings"

#define kIconMeusEmprestimos @"IconMeusEmprestimos"
#define kIconSobre @"IconSobre"
#define kIconLogout @"IconLogout"
#define kIconEmpty @"IconEmpty"
#define kIconConsultar @"IconConsultarAcervo"

@interface ESLeftMenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *btnLogout;
-(void)instatiateViewController:(NSString *)identifier;

@end

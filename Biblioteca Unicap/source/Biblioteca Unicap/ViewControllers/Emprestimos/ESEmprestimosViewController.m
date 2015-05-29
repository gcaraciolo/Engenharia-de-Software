//
//  ESEmprestimosViewController.m
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 4/26/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import "ESEmprestimosViewController.h"
#import "ESEmprestimoService.h"
#import "ESLivroViewController.h"
#import "ESEmprestimoTableViewCell.h"
#import "ESUsuarioUtility.h"
#import "ESLoginViewController.h"
#import "ESLivroUtility.h"
#import "ESBuscarAcervoViewController.h"

@interface ESEmprestimosViewController () <UITableViewDataSource, UITableViewDelegate >

@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuBarButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) BOOL hiddenItens;
@end

@implementation ESEmprestimosViewController


#pragma mark -
#pragma mark Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"Lista de Emprestimos"];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    if ([self isLogged]) {
        self.hiddenItens = NO;
        [self getBooks];
    } else {
        ESLoginViewController *loginVC = [self.storyboard
                                          instantiateViewControllerWithIdentifier:@"loginViewControllerID"];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(cancelarPressed)
                                                     name:@"cancelarLoginButtonPressed"
                                                   object:nil];
        [self.navigationController presentViewController:loginVC animated:YES completion:nil];
    }
}

#pragma mark -
#pragma mark load datas

-(void) getBooks {
    if ([self isLogged]) {
        self.livros = [ESUsuarioUtility sharedInstance].usuario.itensPendentes;
        [self.tableView reloadData];

    }
}

-(BOOL)isLogged {
    if ([[ESUsuarioUtility sharedInstance] logged])
        return YES;
    return NO;
}


#pragma mark -
#pragma mark Delegate tableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.livros count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = kIDLivroCell;
    ESEmprestimoTableViewCell *cell = (ESEmprestimoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    ESItensPendentes *itemPendente = self.livros[indexPath.row];
    [self preencherCell:cell withLivro:itemPendente];
    return cell;
}

-(void)preencherCell:(ESEmprestimoTableViewCell *)cell withLivro:(ESItensPendentes *)livro {
    cell.lblNomItem.text = livro.nomItem;
    cell.lblNumAcervo.text = livro.numAcervo;
    cell.lblDthRenovacao.text = livro.dthRenovacao;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ESItensPendentes *itemPendente = self.livros[indexPath.row];
    [ESLivroUtility sharedInstance].numeroAcervo = itemPendente.numAcervo;
}

#pragma mark - logged logic view

-(void)setHiddenItens:(BOOL)hiddenItens {
    _hiddenItens = hiddenItens;
    self.tableView.hidden = hiddenItens;    
}


#pragma mark - login delegate

-(void)cancelarPressed {
    [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"buscarAcervoViewControllerID"]]
                                                 animated:NO];
}





@end

//
//  ESDadosDoAcervoViewController.m
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/8/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import "ESDadosDoAcervoViewController.h"
#import "ESLivroUtility.h"
#import "ESDadosDoAcervoService.h"
#import "ESUsuarioUtility.h"
#import "ESRenovarService.h"
#import "ESReservaService.h"
#import "ESLoginViewController.h"

@interface ESDadosDoAcervoViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nomTituloPrincipal;
@property (weak, nonatomic) IBOutlet UILabel *nomAutor;
@property (weak, nonatomic) IBOutlet UILabel *nomEdicao;
@property (weak, nonatomic) IBOutlet UILabel *dscLocalEditora;
@property (weak, nonatomic) IBOutlet UILabel *numIsbn;
@property (weak, nonatomic) IBOutlet UILabel *numChamada;
@property (weak, nonatomic) IBOutlet UIButton *btnDoReserva;
@property (weak, nonatomic) IBOutlet UIButton *btnDoRenovacao;

@property (nonatomic) BOOL hiddenItem;


@property (strong, nonatomic) NSString *numeroAcervo;

@end

@implementation ESDadosDoAcervoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"Dados do Acervo"];
    [self getBookDetails];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) getBookDetails {
    //TODO colocar um hud
    self.numeroAcervo = [ESLivroUtility sharedInstance].numeroAcervo;
    [self userHasBookAsItemPendente];
    [self showHUD];
    [[ESDadosDoAcervoService sharedInstance] getDetalhesWithNumeroAcervo:self.numeroAcervo
                            completition:^(ESLivroDetalhe * livroDetalhe) {
                                [self preencherLabels:livroDetalhe];
                                [self hideHUD];
                            } failure:^(NSError *error) {
                                UIAlertView *alert = [[UIAlertView alloc]
                                                          initWithTitle:@"error"
                                                                message:@"Falha ao fazer conexao com o servidor"
                                                               delegate:self
                                                      cancelButtonTitle:@"Ok"
                                                      otherButtonTitles:nil];
                                [self hideHUD];
                                [alert show];
                                [self.navigationController popToRootViewControllerAnimated:YES];
                                
                            }];
    
    
}

- (void)preencherLabels:(ESLivroDetalhe *)livroDetalhe {
    self.nomTituloPrincipal.text = livroDetalhe.nomTituloPrincipal;
    self.nomAutor.text = livroDetalhe.nomAutor;
    self.nomEdicao.text = livroDetalhe.nomEdicao;
    self.dscLocalEditora.text = livroDetalhe.dscLocalEditora;
    self.numIsbn.text = livroDetalhe.numIsbn;
    self.numChamada.text = livroDetalhe.numChamada;
}

#pragma mark - logica de reserva ou renovacao

-(void)userHasBookAsItemPendente {
    if ([[ESUsuarioUtility sharedInstance] hasBookAsItemPendente:self.numeroAcervo]) {
        self.hiddenItem = YES;
    } else {
        self.hiddenItem = NO;
    }
}

-(void)setHiddenItem:(BOOL)hiddenItem {
    _hiddenItem = hiddenItem;
    self.btnDoReserva.hidden = hiddenItem;
    self.btnDoRenovacao.hidden = !hiddenItem;
}

#pragma mark - IBActions

-(IBAction)doReserva:(id)sender {
    ESUsuario *usuario = [ESUsuarioUtility sharedInstance].usuario;
    if (usuario) {
        [self showHUD];
        [[ESReservaService sharedInstance]
            doReservaWithCodigoAcervo:self.numeroAcervo
                              usuario:usuario
                         completition:^(BOOL status) {
                             if (status) {
                                 UIAlertView *alert =
                                 [[UIAlertView alloc] initWithTitle:@"Sucesso"
                                                            message:@"Livro reservado!"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
                                 [self hideHUD];
                                 [alert show];
                             }
                            } failure:^(ESError *error) {
                                UIAlertView *alert =
                                [[UIAlertView alloc] initWithTitle:@"Error"
                                                           message:@"Falha ao fazer reserva!"
                                                          delegate:nil
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil];
                                [self hideHUD];
                                [alert show];
                            }];
    } else {
        ESLoginViewController *loginVC = [self.storyboard instantiateViewControllerWithIdentifier:@"loginViewControllerID"];
        [self.navigationController presentViewController:loginVC animated:YES completion:nil];
    }
}

-(IBAction)doRenovacao:(id)sender {
    ESUsuario *usuario = [ESUsuarioUtility sharedInstance].usuario;
    [self showHUD];
    [[ESRenovarService sharedInstance]
            doRenovacaoWithCodigoAcervo:self.numeroAcervo
                                usuario:usuario
                           completition:^(ESRenovacao *renovacaoResponse) {
                               
                               NSString *message = [NSString stringWithFormat:@"Renovação concluida com sucesso"];
                               [message stringByAppendingString:@"\n"];
                               [message stringByAppendingFormat:@"Devolução: %@",renovacaoResponse.dthDevolucao];
                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sucesso" message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                               [self hideHUD];
                               [alert show];
    
                              } failure:^(NSError *error) {
                                  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Erro ao fazer renovação" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                                  [self hideHUD];
                                  [alert show];    
                            }];
}


@end

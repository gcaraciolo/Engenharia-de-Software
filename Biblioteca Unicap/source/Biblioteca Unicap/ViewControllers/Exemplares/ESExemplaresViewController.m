//
//  ESExemplaresViewController.m
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/8/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import "ESExemplaresViewController.h"
#import "ESExemplaresService.h"
#import "ESLivro.h"
#import "ESLivroTableViewCell.h"
#import "ESLivroUtility.h"
#import "ESExemplarTableViewCell.h"
#import "ESExemplarList.h"
#import "ESExemplar.h"

#define kIDLivroCell @"buscarLivroCell"

@interface ESExemplaresViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *exemplares;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UILabel *qtdExemplares;
@property (weak, nonatomic) IBOutlet UILabel *qtdDisponivel;
@property (weak, nonatomic) IBOutlet UILabel *qtdEmprestado;


@end

@implementation ESExemplaresViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.hidden = YES;
    [self getExemplares:[[ESLivroUtility sharedInstance] numeroAcervo]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) getExemplares:(NSString *)numeroAcervo {
    [self showHUD];
    [[ESExemplaresService sharedInstance]
     getExemplaresWithNumeroAcervo:numeroAcervo
                        completion:^(ESExemplarList *exemplarList) {
                            
                            self.tableView.hidden = NO;
                            
                            self.qtdExemplares.text = exemplarList.qtdExemplares;
                            self.qtdDisponivel.text = exemplarList.qtdDisponivel;
                            self.qtdEmprestado.text = exemplarList.qtdEmprestado;
                            self.exemplares = exemplarList.exemplares;
                            [self.tableView reloadData];
                            [self hideHUD];
                            
                        } failure:^(NSError *operation) {
                            //TODO alert
                            self.tableView.hidden = YES;
                        } ];
    
}

#pragma mark -
#pragma mark TableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.exemplares count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120.0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = kIDLivroCell;
    ESExemplarTableViewCell *cell = (ESExemplarTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    ESExemplar *exemplar = self.exemplares[indexPath.row];
    [self preencherCell:cell withLivro:exemplar];
    
    return cell;
}


-(void)preencherCell:(ESExemplarTableViewCell *)cell withLivro:(ESExemplar *)exemplar {
    cell.numExemplar.text = exemplar.numExemplar;
    cell.numItem.text = exemplar.numItem;
    cell.indLocalizacao.text = exemplar.indLocalizacao;
    cell.dthDevolucao.text = exemplar.dthDevolucao;
}


@end

//
//  ESBuscarAcervoViewController.m
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 4/26/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import "ESBuscarAcervoViewController.h"
#import "ESBuscarService.h"
#import "ESLivro.h"
#import "ESLivroTableViewCell.h"
#import "ESLivroUtility.h"
#import "ESBaseService.h"



#define kIDLivroCell @"buscarLivroCell"

@interface ESBuscarAcervoViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuBarButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic) BOOL hiddenItems;

@property (weak, nonatomic) IBOutlet UIImageView *imgLupa;
@property (weak, nonatomic) IBOutlet UILabel *lblMain;
@property (weak, nonatomic) IBOutlet UILabel *lblSecond;


@property (strong, nonatomic) NSArray * livros;

@end

@implementation ESBuscarAcervoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [super setBarTitle:@"Buscar no Acervo"];
    self.searchBar.delegate = self;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self initialSettings];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

-(void)initialSettings {
    self.hiddenItems = YES;
}

#pragma mark -
#pragma mark TableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.livros count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120.0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = kIDLivroCell;
    ESLivroTableViewCell *cell = (ESLivroTableViewCell *)
        [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    ESLivro *livro = self.livros[indexPath.row];
    [self preencherCell:cell withLivro:livro];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ESLivro * livro = self.livros[indexPath.row];
    [[ESLivroUtility sharedInstance] setCurrentLivro:livro];
    [ESLivroUtility sharedInstance].numeroAcervo = livro.numAcervo;
}

-(void)preencherCell:(ESLivroTableViewCell *)cell withLivro:(ESLivro *)livro {
    [cell.lblTitulo setText:livro.nomItem];
    [cell.lblAutor setText:livro.nomAutor];
    [cell.lblNumeroChamada setText:livro.numChamada];
}

#pragma mark -
#pragma mark SearchBar Delegate

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *text = self.searchBar.text;
    [self showHUD];
    [[ESBuscarService sharedInstance]
       searchBook:text
     completition:^(NSArray *livros) {
         self.hiddenItems = NO;
         self.livros = livros;
         [self.tableView reloadData];
         [self hideHUD];
    } failure:^(NSError *error) {
        UIAlertView *alert =
        [[UIAlertView alloc] initWithTitle:@"Error"
                                   message:@"Erro ao fazer busca!"
                                  delegate:nil
                         cancelButtonTitle:@"Ok"
                         otherButtonTitles:nil];
        [self hideHUD];
        self.livros = nil;
        [self.tableView reloadData];
        [alert show];
    }];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if ([searchText length] == 0) {
        self.hiddenItems = YES;
        self.livros = nil;
        [self.tableView reloadData];
    }
}

-(void)setHiddenItems:(BOOL)hiddenItems {
    _hiddenItems = hiddenItems;
    
    self.tableView.hidden = hiddenItems;
    self.imgLupa.hidden =
        self.lblMain.hidden =
            self.lblSecond.hidden = !hiddenItems;
}

@end

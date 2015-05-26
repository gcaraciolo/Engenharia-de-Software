//
//  ESLeftMenuViewController.m
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 4/26/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import "ESLeftMenuViewController.h"
#import "ESUsuarioUtility.h"

@interface ESLeftMenuViewController () <UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *menuOptionsTitles;
@property (strong, nonatomic) NSArray *menuOptionsImages;

@end

@implementation ESLeftMenuViewController

enum ESMenuOption : NSUInteger {
    ESMenuOptionBuscarAcervo = 0,
    ESMenuOptionMeusEmprestimos,
    ESMenuOptionSobre,
    ESMenuOptionSettings
};


#pragma mark -
#pragma mark Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configs];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

-(void)configs {
    [self menuOptions];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

#pragma mark -
#pragma mark Menu settings

-(void) menuOptions {
    
    NSMutableArray *menuOptions =
    [[NSMutableArray alloc] initWithArray:@[ kTitleBuscarAcervo,
                                            kTitleMeusEmprestimos,
                                            kTitleSobre,
                                            kTitleSettings
                                            ]];
    
    NSMutableArray *menuIcons =
    [[NSMutableArray alloc] initWithArray:@[kIconConsultar,
                                            kIconMeusEmprestimos,
                                            kIconSobre,
                                            kIconEmpty
                                            ]];

    
    self.menuOptionsTitles = [menuOptions copy];
    self.menuOptionsImages = [menuIcons copy];
    [self.tableView reloadData];
}

#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case ESMenuOptionBuscarAcervo:
            [self instatiateViewController:@"buscarAcervoViewControllerID"];
            break;
            
        case ESMenuOptionMeusEmprestimos:
            [self instatiateViewController:@"emprestimoViewControllerID"];
            break;
            
        case ESMenuOptionSobre:
            [self instatiateViewController:@"sobreViewControllerID"];
            break;
        case ESMenuOptionSettings:
            [self instatiateViewController:@"settingsViewController"];
            break;
        default:
            break;
    }
}

-(void) instatiateViewController:(NSString *)identifier {
    [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:identifier]]
                                                 animated:YES];
    [self.sideMenuViewController hideMenuViewController];
}

#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return [self.menuOptionsTitles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
        cell.textLabel.textColor = [UIColor blackColor];
        cell.textLabel.highlightedTextColor = [UIColor lightGrayColor];
        cell.selectedBackgroundView = [[UIView alloc] init];
    }
    
    cell.textLabel.text = self.menuOptionsTitles[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:self.menuOptionsImages[indexPath.row]];
    
    return cell;
}

#pragma mark - IBActions
- (IBAction)doLogout:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Log out"
                                                    message:@"Você tem certeza que deseja fazer logout?"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancelar"
                                          otherButtonTitles:@"Confirmar", nil];
    [alert show];
}


#pragma mark - Alert View
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 1:
            if ([[ESUsuarioUtility sharedInstance] logged]) {
                [[ESUsuarioUtility sharedInstance] doLogout];
                [self instatiateViewController:@"buscarAcervoViewControllerID"];
            }
            break;
        default:
            break;
    }
}


@end

//
//  ESLoginViewController.m
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 4/26/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import "ESLoginViewController.h"
#import "ESLoginService.h"
#import "ESUsuarioUtility.h"
#import "ESError.h"
#import "NSString+Extensions.h"

#define kOFFSET_FOR_KEYBOARD 80.0


@interface ESLoginViewController ()
@property (nonatomic) UITapGestureRecognizer *tapRecognizer;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuBarButton;
@property (weak, nonatomic) IBOutlet UITextField *txtMatricula;
@property (weak, nonatomic) IBOutlet UITextField *txtSenha;
@property (weak, nonatomic) IBOutlet UIButton *btnEntrar;
@property (weak, nonatomic) IBOutlet UIButton *btnLimpar;

@end

@implementation ESLoginViewController


#pragma mark -
#pragma mark Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configKeyboard];
//    [super setBarTitle:@"Login do Usuário"];
    self.btnEntrar.showsTouchWhenHighlighted = YES;
    self.btnLimpar.showsTouchWhenHighlighted = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}

#pragma mark -
#pragma mark Keyboard Settings
-(void) configKeyboard {
    // register for keyboard notifications
//TODO dismiss keyboard when touch anywhere
    self.tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapAnywhere)];
    self.tapRecognizer.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:self.tapRecognizer];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)handleSingleTap:(UITapGestureRecognizer *) sender
{
    [self.view endEditing:YES];
}

-(void)didTapAnywhere {

}

-(void)keyboardWillShow {
    // Animate the current view out of the way
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)keyboardWillHide {
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}


//method to move the view up/down whenever the keyboard is shown/dismissed
-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
    if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else
    {
        // revert back to the normal state.
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - IBActions

- (IBAction)entrarButtonTapped:(UIButton *)sender {
    [self doLogin];
}
- (IBAction)limparButtonTapped:(UIButton *)sender {
    [self cleanFields];
}

- (IBAction)cancelarButtonTapped:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"cancelarLoginButtonPressed" object:self];
    }];
}

#pragma mark -  login

- (void) doLogin {
    NSString *matricula = self.txtMatricula.text;
    NSString *senha = self.txtSenha.text;
    
    if (![matricula isValid] && ![senha isValid]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erro" message:@"Preencha os campos." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    [[ESLoginService sharedInstance] doLoginWithMatricula:matricula
                                                    senha:senha
                    completition:^(ESUsuario * usuario) {
                        usuario.senha = senha;
                        [ESUsuarioUtility sharedInstance].usuario = usuario;
                        [self dismissViewControllerAnimated:YES completion:nil];
                    } failure:^(ESError * error) {
                        switch (error.networkingError) {
                            case loginStatusException: {
                                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erro" message:@"Login ou senha invalidos." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                                [alert show];
                                [self cleanFields];
                            }
                                break;
                            case loginStatusFalha:{
                                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erro" message:@"Sem conexão com internet." delegate:nil
                                                                      cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                                [alert show];

                            }
                            default:
                                break;
                        }

                    }];
}


#pragma mark - helpers 

-(void)cleanFields {
    self.txtMatricula.text = @"";
    self.txtSenha.text = @"";
}

@end

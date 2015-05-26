//
//  ESLivroTableViewCell.h
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/6/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ESLivroTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblTitulo;
@property (weak, nonatomic) IBOutlet UILabel *lblAutor;
@property (weak, nonatomic) IBOutlet UILabel *lblNumeroChamada;

@end

//
//  ESExemplarTableViewCell.h
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/15/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ESExemplarTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *numExemplar;
@property (weak, nonatomic) IBOutlet UILabel *numItem;
@property (weak, nonatomic) IBOutlet UILabel *indLocalizacao;
@property (weak, nonatomic) IBOutlet UILabel *dthDevolucao;


@end

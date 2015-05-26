//
//  ESLivroDetalhe.h
//  
//
//  Created by Guilherme Caraciolo on 5/13/15.
//
//

#import <Foundation/Foundation.h>
#import "Mantle.h"


@interface ESLivroDetalhe : MTLModel <MTLJSONSerializing>

@property (nonatomic, retain) NSString * nomOriginal;
@property (nonatomic, retain) NSString * dscLocalEditora;
@property (nonatomic, retain) NSString * qtdDisponivel;
@property (nonatomic, retain) NSString * nomEdicao;
@property (nonatomic, retain) NSString * nomTituloPrincipal;
@property (nonatomic, retain) NSString * txtAssuntos;
@property (nonatomic, retain) NSString * nomAutor;
@property (nonatomic, retain) NSString * nomEntradasSecundarias;
@property (nonatomic, retain) NSString * numIsbn;
@property (nonatomic, retain) NSString * numChamada;
@property (nonatomic, retain) NSString * imagens;

@end

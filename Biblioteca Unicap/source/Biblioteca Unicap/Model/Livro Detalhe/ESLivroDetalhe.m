//
//  ESLivroDetalhe.m
//  
//
//  Created by Guilherme Caraciolo on 5/13/15.
//
//

#import "ESLivroDetalhe.h"


@implementation ESLivroDetalhe


+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"dscLocalEditora" : @"dscLocalEditora",
             @"qtdDisponivel" : @"qtdDisponivel",
             @"nomEdicao" : @"nomEdicao",
             @"nomTituloPrincipal" : @"nomTituloPrincipal",
             @"txtAssuntos" : @"txtAssuntos",
             @"nomAutor" : @"nomAutor",
             @"nomEntradasSecundarias" : @"nomEntradasSecundarias",
             @"numIsbn" : @"numIsbn",
             @"numChamada" : @"numChamada",
             @"imagens" : @"imagens"
             };
}

@end

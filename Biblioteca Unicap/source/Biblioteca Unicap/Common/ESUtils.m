//
//  ESUtils.m
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/6/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import "ESUtils.h"

@implementation ESUtils

+(NSArray *)parseResponseWithKey:(NSString *)key
               andResponseObject:(id)responseObject {
    
    
    NSDictionary *json = (NSDictionary *)responseObject;
    NSArray *jsonArray = [json objectForKey:key];
    NSMutableArray *allBooks = [[NSMutableArray alloc] init];
    
    [jsonArray enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL *stop){
        ESLivro *livro =  [ESUtils parseJsonToLivro:obj];
        if (livro) [allBooks addObject:livro];
    }];
    
    return allBooks;
}

+(ESLivro *)parseJsonToLivro:(id)obj {
    ESLivro *livro = [[ESLivro alloc] init];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:obj
                                            options:NSJSONWritingPrettyPrinted
                                            error:&error];
    
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:jsonData
                                                         options:kNilOptions
                                                           error:&error];
    
    @try {
        
//        if ([json objectForKey:@"numAcervo"])                   livro.numAcervo                 = json[@"numAcervo"];
//        if ([json objectForKey:@"nomItem"])               		livro.nomItem 					= json[@"nomItem"];
//        if ([json objectForKey:@"dscItem"])               		livro.dscItem 					= json[@"dscItem"];
//        if ([json objectForKey:@"srcImagem"])             		livro.srcImagem 				= json[@"srcImagem"];
//        if ([json objectForKey:@"numItem"])               		livro.numItem 					= json[@"numItem"];
//        if ([json objectForKey:@"numChamada"])            		livro.numChamada 				= json[@"numChamada"];
//        if ([json objectForKey:@"qtdExemplares"])         		livro.qtdExemplares 			= json[@"qtdExemplares"];
//        if ([json objectForKey:@"qtdEmprestado"])         		livro.qtdEmprestado				= json[@"qtdEmprestado"];
//        if ([json objectForKey:@"dthEmprestimo"])         		livro.dthEmprestimo 			= json[@"dthEmprestimo"];
//        if ([json objectForKey:@"dthDevolucao"])          		livro.dthDevolucao 				= json[@"dthDevolucao"];
//        if ([json objectForKey:@"nomColecao"])            		livro.nomColecao 				= json[@"nomColecao"];
//        if ([json objectForKey:@"indLocalizacao"])        		livro.indLocalizacao			= json[@"indLocalizacao"];
//        if ([json objectForKey:@"numExemplar"])           		livro.numExemplar 				= json[@"numExemplar"];
//        if ([json objectForKey:@"tipoEmprestimo"])        		livro.tipoEmprestimo 			= json[@"tipoEmprestimo"];
//        if ([json objectForKey:@"nomOriginal"])           		livro.nomOriginal 				= json[@"nomOriginal"];
//        if ([json objectForKey:@"dscLocalEditora"])       		livro.dscLocalEditora 			= json[@"dscLocalEditora"];
//        if ([json objectForKey:@"nomEdicao"])             		livro.nomEdicao 				= json[@"nomEdicao"];
//        if ([json objectForKey:@"imagens"])               		livro.imagens 					= json[@"imagens"];
//        if ([json objectForKey:@"nomTituloPrincipal"])    		livro.nomTituloPrincipal 		= json[@"nomTituloPrincipal"];
//        if ([json objectForKey:@"txtAssuntos"])           		livro.txtAssuntos 				= json[@"txtAssuntos"];
//        if ([json objectForKey:@"nomAutor"])              		livro.nomAutor 					= json[@"nomAutor"];
//        if ([json objectForKey:@"nomEntradasSecundarias"])		livro.nomEntradasSecundarias 	= json[@"nomEntradasSecundarias"];
//        if ([json objectForKey:@"numIsbn"])               		livro.numIsbn					= json[@"numIsbn"];
//
    }
    @catch (NSException *exception) {
#warning TODO exception
        livro = nil;
    }
    
    return livro;
}


@end

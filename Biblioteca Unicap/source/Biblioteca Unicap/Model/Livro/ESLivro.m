//
//  ESLivro.m
//  
//
//  Created by Guilherme Caraciolo on 5/13/15.
//
//

#import "ESLivro.h"


@implementation ESLivro

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"dscItem" : @"dscItem",
             @"numAcervo" : @"numAcervo",
             @"srcImagem" : @"srcImagem",
             @"dscItem" : @"dscItem",
             @"nomItem" : @"nomItem",
             @"numItem" : @"numItem",
             @"numChamada" : @"numChamada",
             @"nomAutor" : @"nomAutor"
             };
}

@end

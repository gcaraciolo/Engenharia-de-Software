//
//  ESItensPendentes.m
//  
//
//  Created by Guilherme Caraciolo on 5/13/15.
//
//

#import "ESItensPendentes.h"


@implementation ESItensPendentes

+(NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"nomItem" : @"nomItem",
             @"numAcervo" : @"numAcervo",
             @"numRenovacao": @"numRenovacao",
             @"dthRenovacao": @"dthRenovacao",
             @"numExemplar": @"numExemplar",
             @"vlrTaxaParcial": @"vlrTaxaParcial"
             };
}

@end

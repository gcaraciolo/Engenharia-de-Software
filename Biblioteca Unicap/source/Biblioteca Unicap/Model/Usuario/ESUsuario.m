//
//  ESUsuario.m
//  
//
//  Created by Guilherme Caraciolo on 5/13/15.
//
//

#import "ESUsuario.h"


@implementation ESUsuario

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"codCookie": @"codCookie",
             @"numMatricula": @"numMatricula",
             @"nomUsuario" : @"nomUsuario",
             @"itensPendentes": @"itensPendentes"
        };
}

+ (NSValueTransformer *)itensPendentesJSONTransformer {
        return [MTLJSONAdapter arrayTransformerWithModelClass:[ESItensPendentes class]];
}



@end
